(** *)

(* This file is part of the Interproc analyzer, released under GPL license.
   Please read the COPYING file packaged in the distribution.

   Copyright (C) Mathias Argoud, Gaël Lalire, Bertrand Jeannet 2007.
*)

open Format
open Option

(*  ********************************************************************** *)
(** {2 Parsing input file} *)
(*  ********************************************************************** *)

let parse_lexbuf
  (fmt:Format.formatter)
  (lexbuf:Lexing.lexbuf)
  :
  Spl_syn.program
  =
  let prog =
    try
      Spl_yacc.program Spl_lex.token lexbuf
    with
    | Parsing.Parse_error ->
	let startp = Lexing.lexeme_start_p lexbuf
	and endp = Lexing.lexeme_end_p lexbuf
	in
	Format.fprintf fmt
	  "Syntaxical error: %s, line %i, characters %i-%i: '%s'.@."
	  startp.Lexing.pos_fname
	  startp.Lexing.pos_lnum
	  (startp.Lexing.pos_cnum - startp.Lexing.pos_bol)
	  (endp.Lexing.pos_cnum - endp.Lexing.pos_bol)
	  (Lexing.lexeme lexbuf);
	raise Exit;
    | Spl_syn.Error ->
	let startp = Lexing.lexeme_start_p lexbuf
	and endp = Lexing.lexeme_end_p lexbuf
	in
	Format.fprintf fmt "Lexical error: %s, line %i, character %i-%i: '%s'.@."
	  startp.Lexing.pos_fname
	  startp.Lexing.pos_lnum
	  (startp.Lexing.pos_cnum - startp.Lexing.pos_bol)
	  (endp.Lexing.pos_cnum - endp.Lexing.pos_bol)
	  (Lexing.lexeme lexbuf);
	raise Exit
  in
  prog

(*  ********************************************************************** *)
(** {2 Analyzing and displaying the solution} *)
(*  ********************************************************************** *)

let build_graphs
  (fmt:Format.formatter)
  (prog:Spl_syn.program)
  :
  Equation.graph * Equation.graph
  =
  (* Converting prog into a forward equation system *)
  let (fgraph:Equation.graph) = Syn2equation.Forward.make prog in
  if !debug>5 then
    fprintf fmt "%sForward equation graph%s@   @[<v>%a@]@."
      (!Option.displaytags).precolorB (!Option.displaytags).postcolor
      (PSHGraph.print
	PSpl_syn.print_point
	pp_print_int
	(fun fmt () -> pp_print_string fmt "()")
	Equation.print_transfer
	Equation.print_info)
      fgraph
  ;
  (* Converting prog into a backward equation system *)
  let (bgraph:Equation.graph) = Syn2equation.Backward.make prog in
  if !debug>5 then
    fprintf fmt "%sBackward equation graph%s@   @[<v>%a@]@."
      (!Option.displaytags).precolorB (!Option.displaytags).postcolor
      (PSHGraph.print
	PSpl_syn.print_point
	pp_print_int
	(fun fmt () -> pp_print_string fmt "()")
	Equation.print_transfer
	Equation.print_info)
      bgraph
  ;
  (fgraph,bgraph)

let compute_and_display
  (fmt:Format.formatter)
  (prog:Spl_syn.program)
  (fgraph:Equation.graph) (bgraph:Equation.graph)
  (manager:'a Apron.Manager.t)
  :
  unit
  =
  let
    (previous
      :
      (Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output option ref
    )
    =
    ref None
  in
  List.iter
    (begin fun t ->
      (* Computation *)
      let fp =
	begin match t with
	| Forward ->
	    let fp =
	      Solving.Forward.compute ~fmt fgraph ~output:(!previous) manager ~debug:!debug
	    in
	    fprintf fmt "%sAnnotated program after forward analysis%s@ "
	      (!Option.displaytags).precolorB (!Option.displaytags).postcolor
	    ;
	    fp
	| Backward ->
	    let fp =
	      Solving.Backward.compute ~fmt prog bgraph ~output:(!previous) manager ~debug:!debug
	    in
	    fprintf fmt "%sAnnotated program after backward analysis%s@ "
	      (!Option.displaytags).precolorB (!Option.displaytags).postcolor
	    ;
	    fp
	end
      in
      (* Display *)
      Solving.print_output prog fmt fp;
      previous := Some fp;
    end)
    !analysis
  ;
  ()

let compute_and_display_policy
  (fmt:Format.formatter)
  (prog:Spl_syn.program)
  (fgraph:Equation.graph) (bgraph:Equation.graph)
  (pmanager:'a Apron.Policy.man)
  :
  unit
  =
  let
    (previous
      :
      (Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output option ref
    )
    =
    ref None
  in
  List.iter
    (begin fun t ->
      (* Computation *)
      let fp =
	begin match t with
	| Forward ->
	    let fp =
	      SolvingPolicy.Forward.compute ~fmt prog fgraph ~output:(!previous) pmanager ~debug:!debug
	    in
	    fprintf fmt "%sAnnotated program after forward analysis%s@ "
	      (!Option.displaytags).precolorB (!Option.displaytags).postcolor
	    ;
	    fp
	| Backward ->
	    let fp =
	      SolvingPolicy.Backward.compute ~fmt prog bgraph ~output:(!previous) pmanager ~debug:!debug
	    in
	    fprintf fmt "%sAnnotated program after backward analysis%s@ "
	      (!Option.displaytags).precolorB (!Option.displaytags).postcolor
	    ;
	    fp
	end
      in
      (* Display *)
      Solving.print_output prog fmt fp;
      previous := Some fp;
    end)
    !analysis
  ;
  ()

let analyze_and_display
    (fmt:Format.formatter)
    (prog:Spl_syn.program)
    :
    unit
    =
  let (fgraph,bgraph) = build_graphs fmt prog in
  (* Computing solution *)
  begin match !domain with
  | Box ->
      compute_and_display fmt prog fgraph bgraph
	(Box.manager_alloc ())
  | BoxPolicy ->
      let man = Box.manager_alloc () in
      let funopt = Apron.Manager.get_funopt man Apron.Manager.Funid_meet_lincons_array in
      let funopt = { funopt with Apron.Manager.algorithm = 1 } in
      Apron.Manager.set_funopt man Apron.Manager.Funid_meet_lincons_array funopt;
      compute_and_display_policy fmt prog fgraph bgraph
	(Box.policy_manager_alloc man)
  | Octagon ->
      compute_and_display fmt prog fgraph bgraph
	(Oct.manager_alloc ())
  | PolkaLoose ->
      compute_and_display fmt prog fgraph bgraph
	(let man = Polka.manager_alloc_loose () in
(*
  let wideningopt = Apron.Manager.get_funopt man Apron.Manager.Funid_widening in
  let wideningopt = { wideningopt with Apron.Manager.algorithm = 1 } in
  Apron.Manager.set_funopt man Apron.Manager.Funid_widening wideningopt;
*)
	man
	)
  | PolkaStrict ->
      compute_and_display fmt prog fgraph bgraph
	(Polka.manager_alloc_strict ())
  | PolkaEq ->
      compute_and_display fmt prog fgraph bgraph
	(Polka.manager_alloc_equalities ())
  | Taylor1plus ->
      compute_and_display fmt prog fgraph bgraph
	(T1p.manager_alloc ())

  | PplPolyLoose ->
      compute_and_display fmt prog fgraph bgraph
	(Ppl.manager_alloc_loose ())
  | PplPolyStrict ->
      compute_and_display fmt prog fgraph bgraph
	(Ppl.manager_alloc_strict ())
  | PplGrid ->
      compute_and_display fmt prog fgraph bgraph
	(Ppl.manager_alloc_grid ())
  | PolkaGrid ->
      let man1 = Polka.manager_alloc_loose () in
      let man2 = Ppl.manager_alloc_grid () in
      compute_and_display fmt prog fgraph bgraph
	(PolkaGrid.manager_alloc man1 man2)

  | _->
    failwith "You probably selected a domain needing the PPL library. Uncomment the last lines of the INTERPROC file frontend.ml and recompile INTERPROC"
  end

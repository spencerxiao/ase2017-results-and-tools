(** Solving the equations *)

(* This file is part of the Interproc analyzer, released under GPL license.
   Please read the COPYING file packaged in the distribution.

   Copyright (C) Mathias Argoud, Gaël Lalire, Bertrand Jeannet 2007.
*)

open Format

(*  ********************************************************************* *)
(** {2 Instanciated module and options} *)
(*  ********************************************************************* *)

(*  ===================================================================== *)
(** {3 Functions} *)
(*  ===================================================================== *)

(** Build a fixpoint manager (for module [Fixpoint]) given:
  - an equation graph (forward or backward)
  - optionally, the result of a previous, dual analysis
  - a function [apply graph output manager hyperedge tabstract]
  - a function [abstract_init]
  - an APRON manager;
  - a debug level
*)
let make_fpmanager
    ~(fmt : Format.formatter)
    ~(output : (Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output option)
    ~(debug:int)
    ~(graph: Equation.graph)
    ~(man:'abstract Apron.Manager.t)
    ~(abstract_init : Spl_syn.point -> 'a Apron.Abstract1.t)
    ~(apply :
      Equation.graph ->
      output:(Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output option ->
      'a Apron.Manager.t -> int -> 'a Apron.Abstract1.t array ->
      unit * 'a Apron.Abstract1.t)
    :
    (Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.manager
    =
  let info = PSHGraph.info graph in
  {
    (* Lattice operation *)
    Fixpoint.bottom = begin fun vtx ->
      Apron.Abstract1.bottom man (Hashhe.find info.Equation.pointenv vtx)
    end;
    Fixpoint.canonical = begin fun vtx abs -> ()
      (* Apron.Abstract1.canonicalize man abs *)
    end;
    Fixpoint.is_bottom = begin fun vtx abs ->
      Apron.Abstract1.is_bottom man abs
    end;
    Fixpoint.is_leq = begin fun vtx abs1 abs2 ->
      Apron.Abstract1.is_leq man abs1 abs2
    end;
    Fixpoint.join = begin fun vtx abs1 abs2 ->
      Apron.Abstract1.join man abs1 abs2
    end;
    Fixpoint.join_list = begin fun vtx labs ->
      Apron.Abstract1.join_array man (Array.of_list labs)
    end;
    Fixpoint.odiff = None;
    Fixpoint.widening = begin fun vtx abs1 abs2 ->
      Apron.Abstract1.widening man abs1 abs2
    end;
    (* Initialisation of equations *)
    Fixpoint.abstract_init = abstract_init;
    Fixpoint.arc_init = begin fun hedge -> () end;
    (* Interpreting hyperedges *)
    Fixpoint.apply = begin fun hedge tx ->
      apply graph ~output man hedge tx
    end;
    (* Printing functions *)
    Fixpoint.print_vertex=PSpl_syn.print_point;
    Fixpoint.print_hedge=pp_print_int;
    Fixpoint.print_abstract = Apron.Abstract1.print;
    Fixpoint.print_arc = begin fun fmt () -> pp_print_string fmt "()" end;
    (* Fixpoint Options *)
    Fixpoint.accumulate = false;
    (* Printing Options *)
    Fixpoint.print_fmt = fmt;
    Fixpoint.print_analysis=debug>=1;
    Fixpoint.print_component=debug>=2;
    Fixpoint.print_step=debug>=3;
    Fixpoint.print_state=debug>=4;
    Fixpoint.print_postpre=debug>=5;
    Fixpoint.print_workingsets=debug>=6;
    (* DOT Options *)
    Fixpoint.dot_fmt = !Option.dot_fmt;
    Fixpoint.dot_vertex=PSpl_syn.print_point;
    Fixpoint.dot_hedge=pp_print_int;
    Fixpoint.dot_attrvertex=PSpl_syn.print_point;
    Fixpoint.dot_attrhedge= begin fun fmt hedge ->
      let transfer = PSHGraph.attrhedge graph hedge in
      fprintf fmt "%i: %a"
	hedge
	Equation.print_transfer transfer
    end;
  }

(** Make an output graph filled with bottom abstract values *)
let make_emptyoutput
  (graph : (Spl_syn.point,int,'a,'b,'c) PSHGraph.t)
  (manager : 'abstract Apron.Manager.t)
  :
  (Spl_syn.point, int, 'abstract Apron.Abstract1.t,unit) Fixpoint.output
  =
  let info = PSHGraph.info graph in
  PSHGraph.map graph
    (begin fun vertex attr ->
      Apron.Abstract1.bottom manager (Hashhe.find info.Equation.pointenv vertex)
    end)
    (begin fun hedge arc -> () end)
    (begin fun info ->
      {
	Fixpoint.time = 0.0;
	Fixpoint.ascending = (let open FixpointType in { nb=0; stable=false }),[];
	Fixpoint.descending = (let open FixpointType in { nb=0; stable=false }),[];
      }
    end)

(** *)

let environment_of_tvar
  (typ_of_var : Apron.Var.t -> Apron.Environment.typvar)
  (tvar : Apron.Var.t array)
  :
  Apron.Environment.t
  =
  let (lint,lreal) =
    Array.fold_right
      (begin fun var (lint,lreal) ->
	begin match typ_of_var var with
	| Apron.Environment.INT -> (var::lint,lreal)
	| Apron.Environment.REAL -> (lint,var::lreal)
	end
      end)
      tvar
      ([],[])
  in
  let tint = Array.of_list lint and treal = Array.of_list lreal in
  Apron.Environment.make tint treal

(*  ********************************************************************** *)
(** {2 Forward semantics} *)
(*  ********************************************************************** *)

module Forward = struct

  (*  ===================================================================== *)
  (** {3 Transfer function} *)
  (*  ===================================================================== *)

  let apply_tassign
    (manager:'a Apron.Manager.t)
    (abstract:'a Apron.Abstract1.t)
    (var: Apron.Var.t)
    (expr:Apron.Texpr1.t)
    (dest:'a Apron.Abstract1.t option)
    =
    let res =
      Apron.Abstract1.assign_texpr
	manager abstract
	var expr dest
    in
(*
    printf "apply_tassign %a := %a (%a) = %a@."
      Apron.Var.print var Apron.Texpr1.print expr
      Apron.Abstract1.print abstract
      Apron.Abstract1.print res
    ;
*)
    res

  let apply_condition
      (manager:'a Apron.Manager.t)
      (abstract:'a Apron.Abstract1.t)
      (expr:Apron.Tcons1.earray Boolexpr.t)
      (dest:'a Apron.Abstract1.t option)
      :
      'a Apron.Abstract1.t
      =
    let labstract =
      match expr with
      | Boolexpr.TRUE ->
	  [abstract]
      | Boolexpr.DISJ lconj ->
	  List.map
	    (fun conj ->
	      Apron.Abstract1.meet_tcons_array manager abstract conj)
	    lconj
    in
    let labstract =
      match dest with
      | None -> labstract
      | Some dest ->
	  List.map
	    (fun abstract -> Apron.Abstract1.meet manager abstract dest)
	    labstract
    in
    let res = match labstract with
    | [] ->
	Apron.Abstract1.bottom manager (Apron.Abstract1.env abstract)
    | [x] -> x
    | _	  -> Apron.Abstract1.join_array manager (Array.of_list labstract)
    in
    if false then
      printf "apply_condition %a %a => %a@."
	Apron.Abstract1.print abstract
	(Boolexpr.print (Apron.Tcons1.array_print ~first:"@[" ~sep:" &&@ " ~last:"@]")) expr
	Apron.Abstract1.print res
    ;
    res

  let apply_call
    (manager:'a Apron.Manager.t)
    (abstract:'a Apron.Abstract1.t)
    (calleeinfo:Equation.procinfo)
    (inargs:Apron.Var.t array)
    (dest:'a Apron.Abstract1.t option)
    =
    (* current environment *)
    let env = Apron.Abstract1.env abstract in
    (* 1. We begin by removing all non-argument variables from the current
     abstract value *)
    let tenv = environment_of_tvar (Apron.Environment.typ_of_var env) inargs in
    let abstract2 =
      Apron.Abstract1.change_environment manager abstract tenv false
    in
    (* From now on, we work by side-effect *)
    (* 2. We now rename actual parameters in formal ones *)
    Apron.Abstract1.rename_array_with
      manager abstract2
      inargs calleeinfo.Equation.pinput
    ;
    (* 3. Last, we embed in callee environment *)
    Apron.Abstract1.change_environment_with
      manager abstract2
      calleeinfo.Equation.penv false
    ;
    (* 4. We possibly intersect with the result of a previous analysis *)
    begin match dest with
    | None -> ()
    | Some dest ->
	Apron.Abstract1.meet_with manager abstract2 dest
    end;
    abstract2

  let apply_return
    (manager:'a Apron.Manager.t)
    (abscaller:'a Apron.Abstract1.t) (abscallee:'a Apron.Abstract1.t)
    (calleeinfo:Equation.procinfo)
    (inargs:Apron.Var.t array) (outargs:Apron.Var.t array)
    (dest:'a Apron.Abstract1.t option)
    =
     (* 0. We forget local variables in abscallee *)
    let env =
      Apron.Environment.remove (Apron.Abstract1.env abscallee)
	(calleeinfo.Equation.plocal)
    in
    let res =
      Apron.Abstract1.change_environment manager abscallee
	env false
    in
    (* 1. We rename in modified abscallee
       - formal in parameters by actual inparameters
       - formal out parameters by special names (to avoid name conflicts)
    *)
    Apron.Abstract1.rename_array_with
      manager res
      (Array.append calleeinfo.Equation.pinput calleeinfo.Equation.poutput)
      (Array.append inargs calleeinfo.Equation.poutput_tmp)
    ;
    (* 2. We unify the renamed callee value and the caller value *)
    Apron.Abstract1.unify_with manager res abscaller;
    (* 3. We assign the actual out parameters *)
    let env = Apron.Abstract1.env res in
    let tlinexpr =
      Array.map
	(begin fun var ->
	  let e = Apron.Linexpr1.make ~sparse:true env in
	  Apron.Linexpr1.set_coeff e var (Apron.Coeff.s_of_int 1);
	  e
	end)
	calleeinfo.Equation.poutput_tmp
    in
    if tlinexpr<>[||] then
      Apron.Abstract1.assign_linexpr_array_with
	manager res
	outargs tlinexpr None
    ;
    (* 4. We remove the introduced temporary variables *)
    Apron.Abstract1.change_environment_with
      manager res
      (Apron.Abstract1.env abscaller) false
    ;
    (* 5. We possibly intersect with the result of a previous analysis *)
    begin match dest with
    | None -> ()
    | Some dest ->
	Apron.Abstract1.meet_with manager res dest
    end;
    res

  (** Main transfer function *)
  let apply
    (graph:Equation.graph)
    ~(output : (Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output option)
    (manager:'a Apron.Manager.t)
    (hedge:int)
    (tabs:'a Apron.Abstract1.t array)
    :
    unit * 'a Apron.Abstract1.t
    =
    let transfer = PSHGraph.attrhedge graph hedge in
    let abs = tabs.(0) in
    let dest = match output with
      | None -> None
      | Some(output) ->
	  let tdest = PSHGraph.succvertex graph hedge in
	  assert(Array.length tdest = 1);
	  let dest = PSHGraph.attrvertex output tdest.(0) in
	  Some dest
    in
    let res =
      match transfer with
      | Equation.Tassign(var,expr) ->
	  apply_tassign manager abs var expr dest
      | Equation.Lassign _ ->
	  failwith ""
      | Equation.Condition cond ->
	  apply_condition manager abs cond dest
      | Equation.Call(callerinfo,calleeinfo,tin,tout) ->
	  apply_call manager abs calleeinfo tin dest
      | Equation.Return(callerinfo,calleeinfo,tin,tout) ->
	  apply_return manager abs tabs.(1) calleeinfo tin tout dest
    in
    ((),res)

  (*  ===================================================================== *)
  (** {3 Compute (post)fixpoint} *)
  (*  ===================================================================== *)

  let compute
      ~(fmt : Format.formatter)
      (graph:Equation.graph)
      ~(output : (Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output option)
      (manager:'a Apron.Manager.t)
      ~(debug:int)
      :
      (Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output
      =
    let info = PSHGraph.info graph in
    let sstart =
      let maininfo = Hashhe.find info.Equation.procinfo "" in
      let start = maininfo.Equation.pstart in
      begin match output with
      | None ->
	  PSette.singleton Equation.compare_point start
      | Some output ->
	  let abstract = PSHGraph.attrvertex output start in
	  if Apron.Abstract1.is_bottom manager abstract then
	    PSette.empty Equation.compare_point
	  else
	    (PSette.singleton Equation.compare_point start)
      end
    in
    if PSette.is_empty sstart then begin
      make_emptyoutput graph manager
    end
    else begin
      let abstract_init = begin fun vertex ->
	begin match output with
	| None ->
	    Apron.Abstract1.top manager (Hashhe.find info.Equation.pointenv vertex)
	| Some(output) ->
	    PSHGraph.attrvertex output vertex
	end
      end
      in
      let fpmanager =
	make_fpmanager ~fmt ~output ~debug ~graph
	  ~man:manager
	  ~abstract_init ~apply
      in
      let fp =
	if !Option.iteration_guided then
	  Fixpoint.analysis_guided
	    fpmanager graph sstart
	    (fun filter  ->
	      Fixpoint.make_strategy_default
		~vertex_dummy:Equation.vertex_dummy
		~hedge_dummy:Equation.hedge_dummy
		~priority:(PSHGraph.Filter filter)
		~widening_start:(!Option.widening_start)
		~widening_descend:(!Option.widening_descend)
		~depth:(!Option.iteration_depth)
		graph sstart)
	else
	  Fixpoint.analysis_std
	    fpmanager graph sstart
	    (Fixpoint.make_strategy_default
	      ~vertex_dummy:Equation.vertex_dummy
	      ~hedge_dummy:Equation.hedge_dummy
	      ~widening_start:(!Option.widening_start)
	      ~widening_descend:(!Option.widening_descend)
	      ~depth:(!Option.iteration_depth)
	      graph sstart)
      in
      fp
    end
end

(*  ********************************************************************** *)
(** {2 Bacward semantics} *)
(*  ********************************************************************** *)

module Backward = struct

  (*  ===================================================================== *)
  (** {3 Transfer function} *)
  (*  ===================================================================== *)

  let apply_tassign
    (manager:'a Apron.Manager.t)
    (abstract:'a Apron.Abstract1.t)
    (var: Apron.Var.t)
    (expr:Apron.Texpr1.t)
    (dest:'a Apron.Abstract1.t option)
    =
    let res =
      Apron.Abstract1.substitute_texpr
	manager abstract
	var expr dest
    in
(*
    printf "apply_tassign %a := %a (%a) = %a@."
      Apron.Var.print var Apron.Texpr1.print expr
      Apron.Abstract1.print abstract
      Apron.Abstract1.print res
    ;
*)
    res

  let apply_condition = Forward.apply_condition

  let apply_call
    (manager:'a Apron.Manager.t)
    (abstract:'a Apron.Abstract1.t)
    (callerinfo:Equation.procinfo)
    (calleeinfo:Equation.procinfo)
    (inargs:Apron.Var.t array)
    (dest:'a Apron.Abstract1.t option)
    =
    (* current environment *)
    let env = Apron.Abstract1.env abstract in
    (* 1. We begin by removing all non-argument variables from the current
     abstract value *)
    let tenv =
      environment_of_tvar
	(Apron.Environment.typ_of_var env)
	calleeinfo.Equation.pinput
    in
    let abstract2 =
      Apron.Abstract1.change_environment manager abstract tenv false
    in
    (* From now on, we work by side-effect *)
    (* 2. We now rename formal parameters into actual ones *)
    Apron.Abstract1.rename_array_with
      manager abstract2
      calleeinfo.Equation.pinput inargs
    ;
    (* 3. Last, we embed in caller environment *)
    Apron.Abstract1.change_environment_with
      manager abstract2
      callerinfo.Equation.penv false
    ;
    (* 4. We possibly intersect with the result of a previous analysis *)
    begin match dest with
    | None -> ()
    | Some dest ->
	Apron.Abstract1.meet_with manager abstract2 dest
    end;
    abstract2

  let apply_return
    (manager:'a Apron.Manager.t)
    (abstract:'a Apron.Abstract1.t)
    (callerinfo:Equation.procinfo)
    (calleeinfo:Equation.procinfo)
    (inargs:Apron.Var.t array) (outargs:Apron.Var.t array)
    (dest:'a Apron.Abstract1.t option)
    =
    (* 1. We rename actual output parameters by temporary output parameters *)
    let res =
      Apron.Abstract1.rename_array
	manager abstract
	outargs calleeinfo.Equation.poutput_tmp
    in
    (* 2. We switch to an environment composed of
	  temporary output parameters and actual input paramaters *)
    let lint = ref [] and lreal = ref [] in
    Array.iteri
      (begin fun i var ->
	let list =
	  match Apron.Environment.typ_of_var calleeinfo.Equation.penv var with
	  | Apron.Environment.INT -> lint
	  | Apron.Environment.REAL -> lreal
	in
	let var_tmp = calleeinfo.Equation.poutput_tmp.(i) in
	list := var_tmp :: !list
      end)
      calleeinfo.Equation.poutput
    ;
    Array.iter
      (begin fun var ->
	let list =
	  match Apron.Environment.typ_of_var callerinfo.Equation.penv var with
	  | Apron.Environment.INT -> lint
	  | Apron.Environment.REAL -> lreal
	in
	list := var :: !list
      end)
      inargs
    ;
    let tint = Array.of_list !lint and treal = Array.of_list !lreal in
    let tenv = Apron.Environment.make tint treal in
    Apron.Abstract1.change_environment_with manager res tenv false;
    (* 3. We rename
       temporary output parameters -> formal output
       actual input -> formal input *)
    Apron.Abstract1.rename_array_with
      manager res
      (Array.append calleeinfo.Equation.poutput_tmp inargs)
      (Array.append calleeinfo.Equation.poutput  calleeinfo.Equation.pinput)
    ;
    (* 4. We embed into callee environment *)
    Apron.Abstract1.change_environment_with manager res calleeinfo.Equation.penv false;
    (* 5. We possibly intersect with the result of a previous analysis *)
    begin match dest with
    | None -> ()
    | Some dest ->
	Apron.Abstract1.meet_with manager res dest
    end;
    res

  (** Main transfer function *)
  let apply
    (graph:Equation.graph)
    ~(output : (Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output option)
    (manager:'a Apron.Manager.t)
    (hedge:int)
    (tabs:'a Apron.Abstract1.t array)
    :
    unit * 'a Apron.Abstract1.t
    =
    let transfer = PSHGraph.attrhedge graph hedge in
    let abs = tabs.(0) in
    let dest = match output with
      | None -> None
      | Some(output) ->
	  let tdest = PSHGraph.succvertex graph hedge in
	  assert(Array.length tdest = 1);
	  let dest = PSHGraph.attrvertex output tdest.(0) in
	  Some dest
    in
    let res =
      match transfer with
      | Equation.Tassign(var,expr) ->
	  apply_tassign manager abs var expr dest
      | Equation.Lassign _ ->
	  failwith ""
      | Equation.Condition cond ->
	  apply_condition manager abs cond dest
      | Equation.Call(callerinfo,calleeinfo,tin,tout) ->
	  apply_call manager abs callerinfo calleeinfo tin dest
      | Equation.Return(callerinfo,calleeinfo,tin,tout) ->
	  apply_return manager abs callerinfo calleeinfo tin tout dest
    in
    ((),res)

  (*  ===================================================================== *)
  (** {3 Compute (post)fixpoint} *)
  (*  ===================================================================== *)

  let compute
      ~(fmt : Format.formatter)
      (prog:Spl_syn.program)
      (graph:Equation.graph)
      ~(output : (Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output option)
      (manager:'a Apron.Manager.t)
      ~(debug:int)
      :
      (Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output
      =
    let info = PSHGraph.info graph in
    let sstart = ref (PSette.empty Equation.compare_point) in
    List.iter
      (begin fun procedure ->
	Spl_syn.iter_eltinstr
	  (begin fun (bpoint,instr) ->
	    if instr.Spl_syn.instruction = Spl_syn.FAIL then begin
	      let ok = match output with
		| None -> true
		| Some output ->
		    let abstract = PSHGraph.attrvertex output bpoint in
		    not (Apron.Abstract1.is_bottom manager abstract)
	      in
	      if ok then
		sstart := PSette.add bpoint !sstart;
	    end
	  end)
	  procedure.Spl_syn.pcode;
      end)
      prog.Spl_syn.procedures;

    if PSette.is_empty !sstart then begin
      make_emptyoutput graph manager
    end
    else begin
      let abstract_init = begin fun vertex ->
	begin match output with
	| None ->
	    Apron.Abstract1.top manager (Hashhe.find info.Equation.pointenv vertex)
	| Some(output) ->
	    PSHGraph.attrvertex output vertex
	end
      end
      in
      let fpmanager =
	make_fpmanager ~fmt ~output ~debug ~graph
	  ~man:manager
	  ~abstract_init ~apply
      in
      let fp =
	if !Option.iteration_guided then
	  Fixpoint.analysis_guided
	    fpmanager graph !sstart
	    (fun filter  ->
	      Fixpoint.make_strategy_default
		~vertex_dummy:Equation.vertex_dummy
		~hedge_dummy:Equation.hedge_dummy
		~priority:(PSHGraph.Filter filter)
		~widening_start:(!Option.widening_start)
		~widening_descend:(!Option.widening_descend)
		~depth:(!Option.iteration_depth)
		graph !sstart)
	else
	  Fixpoint.analysis_std
	    fpmanager graph !sstart
	    (Fixpoint.make_strategy_default
	      ~vertex_dummy:Equation.vertex_dummy
	      ~hedge_dummy:Equation.hedge_dummy
	      ~widening_start:(!Option.widening_start)
	      ~widening_descend:(!Option.widening_descend)
	      ~depth:(!Option.iteration_depth)
	      graph !sstart)
      in
      fp
    end
end


let print_apron_scalar fmt scalar =
  let res = Apron.Scalar.is_infty scalar in
  if res<>0 then
    pp_print_string fmt
      (if res<0 then "-oo" else "+oo")
  else begin
    match scalar with
    | Apron.Scalar.Float _ | Apron.Scalar.Mpfrf _ ->
	Apron.Scalar.print fmt scalar
    | Apron.Scalar.Mpqf mpqf ->
	Apron.Scalar.print fmt (Apron.Scalar.Float (Mpqf.to_float mpqf))
  end

let print_apron_interval fmt itv =
  Format.fprintf fmt "[@[<hv>%a;@,%a@]]"
    print_apron_scalar itv.Apron.Interval.inf
    print_apron_scalar itv.Apron.Interval.sup

let print_apron_box fmt box =
  let tinterval = box.Apron.Abstract1.interval_array in
  let env = box.Apron.Abstract1.box1_env in
  let first = ref true in
  fprintf fmt "[|@[";
  Array.iteri
    (begin fun i interval ->
      if not (Apron.Interval.is_top interval) then begin
	if not !first then fprintf fmt ";@ ";
	let var = Apron.Environment.var_of_dim env i in
	let name = Apron.Var.to_string var in
	fprintf fmt "%s in %a" name
	  print_apron_interval interval;
	first := false
      end;
    end)
    tinterval
  ;
  fprintf fmt "@]|]"

let print_abstract1 fmt abs =
  if !Option.print_box then
      let man = Apron.Abstract1.manager abs in
      let box = Apron.Abstract1.to_box man abs in
      print_apron_box fmt box;
  else
    Apron.Abstract1.print fmt abs

let print_output prog fmt fp =
  fprintf fmt "@[<v>%a@]@."
    (PSpl_syn.print_program
      begin fun fmt (point:Spl_syn.point) ->
	let abs = PSHGraph.attrvertex fp point in
	fprintf fmt "@[<hov>%s%a@ %a%s@]"
	  (!Option.displaytags).Option.precolorR
	  PSpl_syn.print_point point
	  print_abstract1 abs
	  (!Option.displaytags).Option.postcolor
      end)
    prog

(* Bertrand Jeannet. This file is released under LGPL license. *)

(** Example of use of Fixpoint library *)

(** Compile this with [make example] and type [./example].  You'll
    get a DOT output on the file [t.dot]. Type
    [dot -Tps t.dot >t.ps] and use a PostScript viewer to view the
    iteration steps.
*)

open Format

(** {2 The abstract domain: intervals on integers} *)

module A1 = struct
  type t = (int * int) option ref
  type manager = unit

  let copy x = ref (!x)
  let bottom man = ref None
  let top man = ref (Some(min_int,max_int))
  let canonical man (x:t) = match !x with
    | Some(a,b) when a>b ->  x := None
    | _ -> ()
  let is_bottom man (x:t) =
    canonical man x;
    !x=None
  let is_top man (x:t) =
    canonical man x;
    match !x with
    | None -> false
    | Some(a,b) when a>min_int || b<max_int -> false
    | _ -> true
  let is_leq man (x:t) y =
    canonical man x; canonical man y;
    match (!x,!y) with
    | (None,_) -> true
    | (Some _, None) -> false
    | (Some(a1,b1),Some(a2,b2)) ->
	a1>=a2 && b1<=b2
  let join man (x:t) y =
    canonical man x; canonical man y;
    match (!x,!y) with
    | (None,_) -> copy y
    | (_,None) -> copy x
    | (Some(a1,b1),Some(a2,b2)) ->
	ref (Some((min a1 a2),(max b1 b2)))
  let join_list man tx =
    List.fold_left (fun res x ->
      join man res x) (bottom man) tx
  let widening man (x:t) y =
    canonical man x; canonical man y;
    match (!x,!y) with
    | (None,_) -> copy y
    | (_,None) -> failwith ""
    | (Some(a1,b1),Some(a2,b2)) ->
	ref (Some(
	  (if a2<a1 then min_int else a2),
	  (if b2>b1 then max_int else b2)))
  let print man fmt (x:t) =
    canonical man x;
    match !x with
    | Some(a,b) ->
	if is_top man x then pp_print_string fmt "top"
	else
	  fprintf fmt "[%i,%i]" a b
    | None -> pp_print_string fmt "bot"
  let meet man (x:t) y =
    canonical man x; canonical man y;
    match (!x,!y) with
    | (None,_) -> ref None
    | (_,None) -> ref None
    | (Some(a1,b1),Some(a2,b2)) ->
	let a = max a1 a2 in
	let b = min b1 b2 in
	ref (if a>b then None else Some(a,b))
  let setcst man (x:t) (cst:int) =
    canonical man x;
    match !x with
    | None -> x
    | Some(a,b) -> ref (Some(cst,cst))
  let addcst man (x:t) (cst:int) =
    canonical man x;
    match !x with
    | None -> x
    | Some(a,b) -> ref (Some(
	(if a=min_int then a else a+cst),
	(if b=max_int then b else b+cst)))
  let leqcst man (x:t) (cst:int) =
    canonical man x;
    match !x with
    | None -> x
    | Some(a,b) ->
	let i = ref(Some(min_int,cst)) in
	meet man (x:t) i
  let geqcst man (x:t) (cst:int) =
    canonical man x;
    match !x with
    | None -> x
    | Some(a,b) ->
	let i = ref(Some(cst,max_int)) in
	meet man x i
end

(** {2 Abstract domain: pairs of intervals on integers} *)

module A2 = struct
  type t = A1.t * A1.t
  type manager = unit

  let bottom man =
    let bot = A1.bottom man in (bot,bot)
  let top man =
    let top = A1.top man in (top,top)
  let is_bottom man (x,y) =
    A1.is_bottom man x || A1.is_bottom man y
  let canonical man ((x,y) as abs) =
    A1.canonical man x; A1.canonical man y;
    if is_bottom man abs then begin
      x := None; y := None
    end
  let is_leq man (x1,y1) (x2,y2) =
    A1.is_leq man x1 x2 && A1.is_leq man y1 y2
  let join man (x1,y1) (x2,y2) =
    (A1.join man x1 x2, A1.join man y1 y2)
  let join_list man tx =
    List.fold_left (fun res x ->
      join man res x) (bottom man) tx
  let widening man (x1,y1) (x2,y2) =
    (A1.widening man x1 x2, A1.widening man y1 y2)
  let print man fmt ((x,y) as v) =
    canonical man v;
    if is_bottom man v then pp_print_string fmt "bot"
    else fprintf fmt "(%a,%a)" (A1.print man) x (A1.print man) y
  let meet man (x1,y1) (x2,y2) =
    (A1.meet man x1 x2, A1.meet man y1 y2)
  let setcst man ((x,y) as v) (dim:int) (cst:int) =
    if is_bottom man v
    then v
    else if dim=0 then (A1.setcst man x cst, A1.copy y)
    else if dim=1 then (A1.copy x, A1.setcst man y cst)
    else failwith ""
(*
  let assignvar man ((x,y) as v) (dim1:int) (dim2:int) =
    if is_bottom man v || dim1==dim2
    then v
    else if dim1=0 then (y,y)
    else if dim1=1 then (x,x)
    else failwith ""
*)
  let addcst man ((x,y) as v) (dim:int) (cst:int) =
    if is_bottom man v || cst==0
    then v
    else if dim=0 then (A1.addcst man x cst, A1.copy y)
    else if dim=1 then (A1.copy x, A1.addcst man y cst)
    else failwith ""
  let leqcst man ((x,y) as v) (dim:int) (cst:int) =
    if is_bottom man v
    then v
    else if dim=0 then (A1.leqcst man x cst, A1.copy y)
    else if dim=1 then (A1.copy x, A1.leqcst man y cst)
    else failwith ""
  let geqcst man ((x,y) as v) (dim:int) (cst:int) =
    if is_bottom man v
    then v
    else if dim=0 then (A1.geqcst man x cst, A1.copy y)
    else if dim=1 then (A1.copy x, A1.geqcst man y cst)
    else failwith ""

end

(** {2 The equation system, modelled as an hypergraph} *)

(* Creation of the following equation graph:
   X0: x=0;
   X1: y=0;
   X2: while (x<=99) do
   X3:   incr x;
   X4:   if (x<=49) then
   X5:     incr y;
	else
   X7      decr y;
	endif
   X9  done
   X10

*)

let initial_info = ();;
let (g:(int,int,unit,unit,unit) PSHGraph.t) = PSHGraph.create PSHGraph.stdcompare 10 initial_info;;

let attr_vertex = () and attr_hedge = () in
for i=0 to 10 do PSHGraph.add_vertex g i attr_vertex done;
PSHGraph.add_hedge g 01 attr_hedge ~pred:[|0|] ~succ:[|1|];
PSHGraph.add_hedge g 12 attr_hedge ~pred:[|1|] ~succ:[|2|];
PSHGraph.add_hedge g 23 attr_hedge ~pred:[|2|] ~succ:[|3|];
PSHGraph.add_hedge g 210 attr_hedge ~pred:[|2|] ~succ:[|10|];
PSHGraph.add_hedge g 34 attr_hedge ~pred:[|3|] ~succ:[|4|];
PSHGraph.add_hedge g 45 attr_hedge ~pred:[|4|] ~succ:[|5|];
PSHGraph.add_hedge g 59 attr_hedge ~pred:[|5|] ~succ:[|9|];
PSHGraph.add_hedge g 47 attr_hedge ~pred:[|4|] ~succ:[|7|];
PSHGraph.add_hedge g 79 attr_hedge ~pred:[|7|] ~succ:[|9|];
PSHGraph.add_hedge g 92 attr_hedge ~pred:[|9|] ~succ:[|2|];
;;

let apply hedge tabs =
  let abs = tabs.(0) in
  let nabs =
    match hedge with
    | 01 -> A2.setcst () abs 0 0
    | 12 -> A2.setcst () abs 1 0
    | 23 -> A2.leqcst () abs 0 99
    | 210 -> A2.geqcst () abs 0 100
    | 34 -> A2.addcst () abs 0 1
    | 45 -> A2.leqcst () abs 0 49
    | 59 -> A2.addcst () abs 1 1
    | 47 -> A2.geqcst () abs 0 50
    | 79 -> A2.addcst () abs 1 (-1)
    | 92 -> abs
    | _ -> failwith ""
  in
  ((),nabs)

let vertex_dummy =(-1);;
    (** dummy value *)
let hedge_dummy=(-1);;
    (** dummy value *)


(** {2 The fixpoint manager } *)

let dot_file = open_out "t.dot";;
let dot_fmt = Format.formatter_of_out_channel dot_file;;

let (manager:(int,int,A2.t,unit) Fixpoint.manager) = {
  Fixpoint.bottom = begin fun vertex -> A2.bottom () end;
  Fixpoint.canonical = begin fun vertex abs -> A2.canonical () abs end;
  Fixpoint.is_bottom = begin fun vertex abs -> A2.is_bottom () abs end;
  Fixpoint.is_leq = begin fun vertex abs1 abs2 -> A2.is_leq () abs1 abs2 end;
  Fixpoint.join = begin fun vertex abs1 abs2 -> A2.join () abs1 abs2 end;
  Fixpoint.join_list = begin fun vertex labs -> A2.join_list () labs end;
  Fixpoint.widening = begin fun vertex abs1 abs2 -> A2.widening () abs1 abs2 end;
  Fixpoint.odiff = None;
  Fixpoint.apply= apply;
  Fixpoint.arc_init = begin fun hedge -> () end;
  Fixpoint.abstract_init= begin fun vertex -> if vertex=0 then A2.top () else A2.bottom () end;

  Fixpoint.print_abstract=(A2.print ());
  Fixpoint.print_arc=(fun fmt () -> ());
  Fixpoint.print_vertex=pp_print_int;
  Fixpoint.print_hedge=pp_print_int;

  Fixpoint.accumulate = false;
  Fixpoint.print_fmt = Format.std_formatter;
  Fixpoint.print_analysis=true;
  Fixpoint.print_component=true;
  Fixpoint.print_step=true;
  Fixpoint.print_state=true;
  Fixpoint.print_postpre=true;
  Fixpoint.print_workingsets=true;

  Fixpoint.dot_fmt = Some dot_fmt;
  Fixpoint.dot_vertex = (fun fmt v -> fprintf fmt "v%i" v);
  Fixpoint.dot_hedge = (fun fmt h -> fprintf fmt "h%i" h);
  Fixpoint.dot_attrvertex = pp_print_int;
  Fixpoint.dot_attrhedge = pp_print_int;
}
;;

let essai1 () =
  let compare_no_closured = PSHGraph.stdcompare.PSHGraph.comparev in
  let sinit = PSette.singleton compare_no_closured 0 in
  let strategy = Fixpoint.make_strategy_default
    ~widening_start:1 ~widening_descend:2
    ~vertex_dummy ~hedge_dummy
    g sinit in
  printf "strategy=%a@." (Fixpoint.print_strategy manager) strategy;

  let output = Fixpoint.analysis_std manager g sinit strategy in
  printf "output=%a@." (Fixpoint.print_output manager) output;
  PSHGraph.iter_vertex output
    (begin fun vtx abs ~pred ~succ ->
      printf "acc(%i) = %a@."
	vtx (A2.print ()) abs
     end)
  ;
  ()

let essai2 () =
  let compare_no_closured = PSHGraph.stdcompare.PSHGraph.comparev in
  let sinit = PSette.singleton compare_no_closured 0 in
  let make_strategy =
    fun is_active ->
      Fixpoint.make_strategy_default
	~widening_start:1 ~widening_descend:2
	~priority:(PSHGraph.Filter is_active)
	~vertex_dummy ~hedge_dummy
	g sinit
  in
  let output = Fixpoint.analysis_guided
    manager g sinit make_strategy
  in
  printf "output=%a@." (Fixpoint.print_output manager) output;
  PSHGraph.iter_vertex output
    (begin fun vtx abs ~pred ~succ ->
      printf "acc(%i) = %a@."
	vtx (A2.print ()) abs
    end)
  ;
  ()

let essai3 () =
  let compare_no_closured = PSHGraph.stdcompare.PSHGraph.comparev in
  let sinit = PSette.singleton compare_no_closured 0 in
  let equation = Fixpoint.equation_of_graph g in
  let make_strategy (graph:(int,int,'a,'b,'c) PSHGraph.t) =
    Fixpoint.make_strategy_default
      ~widening_start:1 ~widening_descend:2
      ~vertex_dummy ~hedge_dummy graph sinit
  in
  let output = Fixpoint.analysis_dyn
    PSHGraph.stdcompare
    ~guided:false
    manager equation sinit make_strategy
  in
  printf "output=%a@." (Fixpoint.print_output manager) output;
  PSHGraph.iter_vertex output
    (begin fun vtx abs ~pred ~succ ->
      printf "acc(%i) = %a@."
	vtx (A2.print ()) abs
    end)
  ;
  ()

let _ =
  essai1();
  ()

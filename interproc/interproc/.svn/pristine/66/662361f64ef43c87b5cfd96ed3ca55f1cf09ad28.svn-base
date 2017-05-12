(** Solving the equations *)

(* This file is part of the Interproc analyzer, released under GPL license.
   Please read the COPYING file packaged in the distribution.

   Copyright (C) Mathias Argoud, Gaël Lalire, Bertrand Jeannet 2007.
*)

open Format

type 'a policy = 'a Apron.Policy.t Boolexpr.t

let policy_equal pmanager p1 p2 =
  Boolexpr.fold2
    (fun res p1 p2 -> res && (Apron.Policy.equal pmanager p1 p2))
    true p1 p2

let policy_print pman fmt p =
  Boolexpr.print (fun fmt p -> Apron.Policy.fdump pman p) fmt p

let hash_policy_print pman fmt p =
  Hashhe.iter
    (begin fun hedge policy ->
      fprintf fmt "hedge %i:@.%a" hedge
	(policy_print pman) policy
    end)
    p;
  fprintf fmt "policy end@."

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
    ~(output : (Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output option ref)
    ~(debug:int)
    ~(graph: Equation.graph)
    ~(policy:(Equation.hedge, 'a policy) Hashhe.t ref)
    ~(pman:'abstract Apron.Policy.man)
    ~(abstract_init : Spl_syn.point -> 'a Apron.Abstract1.t)
    ~(apply :
      Equation.graph ->
       output:(Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output option ref ->
       policy:(Equation.hedge, 'a policy) Hashhe.t ref ->
       'a Apron.Policy.man ->
       Equation.hedge ->
       'a Apron.Abstract1.t array -> unit * 'a Apron.Abstract1.t)
    :
    (Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.manager
    =
  let man = Apron.Policy.manager_get_manager pman in
  {
    begin
      Solving.make_fpmanager ~fmt ~output:None ~debug ~graph
      ~man
      ~abstract_init ~apply:(fun _ -> failwith "")
    end
  with
    (* Interpreting hyperedges *)
    Fixpoint.apply = begin fun hedge tx ->
      apply graph ~output ~policy pman hedge tx
    end;
  }

(** Make an output graph filled with bottom abstract values *)
let make_emptyoutput = Solving.make_emptyoutput
let environment_of_tvar = Solving.environment_of_tvar

let make_policy pmanager graph rooutput =
  let manager = Apron.Policy.manager_get_manager pmanager in
  let info = PSHGraph.info graph in
  let policy = Hashhe.create 31 in
  PSHGraph.iter_hedge graph
    (begin fun hedge transfer ~pred ~succ ->
      begin match transfer with
      | Equation.Condition cond ->
	  let env = Hashhe.find info.Equation.pointenv pred.(0) in
	  let abs = match !rooutput with
	    | None ->
		Apron.Abstract1.top manager env
	    | Some(output) ->
		PSHGraph.attrvertex output pred.(0)
	  in
	  let p =
	    Boolexpr.map
	      (fun conj ->
		Apron.Policy.Abstract1.meet_tcons_array_improve
		  pmanager None abs conj)
	      cond
	  in
	  Hashhe.add policy hedge p;
      | _ -> ()
      end
    end)
  ;
  ref policy

let apply_condition
    (pmanager:'a Apron.Policy.man)
    (bpolicy:'a Apron.Policy.t Boolexpr.t)
    (abstract:'a Apron.Abstract1.t)
    (expr:Apron.Tcons1.earray Boolexpr.t)
    (dest:'a Apron.Abstract1.t option)
    :
    'a Apron.Abstract1.t
    =
  let dabstract =
    Boolexpr.map2
      (fun policy conj ->
	Apron.Policy.Abstract1.meet_tcons_array_apply
	  pmanager policy abstract conj)
      bpolicy expr
  in
  let labstract = match dabstract with
    | Boolexpr.TRUE -> [abstract]
    | Boolexpr.DISJ l -> l
  in
  let manager = Apron.Policy.manager_get_manager pmanager in
  let labstract =
    match dest with
    | None -> labstract
    | Some dest ->
	List.map
	  (fun abstract -> Apron.Abstract1.meet manager abstract dest)
	  labstract
  in
  match labstract with
  | [] ->
      Apron.Abstract1.bottom manager (Apron.Abstract1.env abstract)
  | [x] -> x
  | _   -> Apron.Abstract1.join_array manager (Array.of_list labstract)

let improve_condition
    (pmanager:'a Apron.Policy.man)
    (obpolicy:'a Apron.Policy.t Boolexpr.t option)
    (abstract:'a Apron.Abstract1.t)
    (expr:Apron.Tcons1.earray Boolexpr.t)
    (dest:'a Apron.Abstract1.t option)
    :
    'a Apron.Policy.t Boolexpr.t
    =
  match obpolicy with
  | None ->
      Boolexpr.map
	(fun conj ->
	  Apron.Policy.Abstract1.meet_tcons_array_improve
	    pmanager None abstract conj)
	expr
  | Some bpolicy ->
      Boolexpr.map2
	(fun policy conj ->
	  Apron.Policy.Abstract1.meet_tcons_array_improve
	    pmanager (Some policy) abstract conj)
	bpolicy expr

(*  ********************************************************************** *)
(** {2 Forward semantics} *)
(*  ********************************************************************** *)

module Forward = struct

  (*  ===================================================================== *)
  (** {3 Transfer function} *)
  (*  ===================================================================== *)

  (** Main transfer function *)
  let apply
    (graph:Equation.graph)
    ~(output : (Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output option ref)
    ~(policy:(Equation.hedge, 'a policy) Hashhe.t ref)
    (pmanager:'a Apron.Policy.man)
    (hedge:int)
    (tabs:'a Apron.Abstract1.t array)
    :
    unit * 'a Apron.Abstract1.t
    =
    let transfer = PSHGraph.attrhedge graph hedge in
    let abs = tabs.(0) in
    let dest = match !output with
      | None -> None
      | Some(output) ->
	  let tdest = PSHGraph.succvertex graph hedge in
	  assert(Array.length tdest = 1);
	  let dest = PSHGraph.attrvertex output tdest.(0) in
	  Some dest
    in
    let manager = Apron.Policy.manager_get_manager pmanager in
    let res =
      match transfer with
      | Equation.Tassign(var,expr) ->
	  Solving.Forward.apply_tassign manager abs var expr dest
      | Equation.Lassign _ ->
	  failwith ""
      | Equation.Condition cond ->
	  let policy = Hashhe.find !policy hedge in
	  apply_condition pmanager policy abs cond dest
      | Equation.Call(callerinfo,calleeinfo,tin,tout) ->
	  Solving.Forward.apply_call manager abs calleeinfo tin dest
      | Equation.Return(callerinfo,calleeinfo,tin,tout) ->
	  Solving.Forward.apply_return manager abs tabs.(1) calleeinfo tin tout dest
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
      (pmanager:'a Apron.Policy.man)
      ~(debug:int)
      :
      (Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output
      =
    let manager = Apron.Policy.manager_get_manager pmanager in
    let info = PSHGraph.info graph in

    let output = ref output in
    let sstart =
      let maininfo = Hashhe.find info.Equation.procinfo "" in
      let start = maininfo.Equation.pstart in
      begin match !output with
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
	begin match !output with
	| None ->
	    Apron.Abstract1.top manager (Hashhe.find info.Equation.pointenv vertex)
	| Some(output) ->
	    PSHGraph.attrvertex output vertex
	end
      end
      in
      let policy = make_policy pmanager graph output in
      let fpmanager =
	make_fpmanager ~fmt ~output ~debug ~graph
	  ~policy
	  ~pman:pmanager
	  ~abstract_init ~apply
      in
      let result = ref None in
      let loop = ref true in
      while !loop do
	let fp =
	  if !Option.iteration_guided then
	    Fixpoint.analysis_guided
	      fpmanager graph sstart
	      (fun filter  ->
		Fixpoint.make_strategy_default
		  ~vertex_dummy:Equation.vertex_dummy
		  ~hedge_dummy:Equation.hedge_dummy
		  ~priority:(PSHGraph.Filter filter)
		  graph sstart)
	  else
	    Fixpoint.analysis_std
	      fpmanager graph sstart
	      (Fixpoint.make_strategy_default
		~vertex_dummy:Equation.vertex_dummy
		~hedge_dummy:Equation.hedge_dummy
		graph sstart)
	in
	result := Some fp;
	(* Display *)
	if !Option.debug>0 then begin
	  printf "policy=%a" (hash_policy_print pmanager) !policy;
	  Solving.print_output prog fmt fp;
	end;
	(* Now try to modify the policy *)
	loop := false;
	policy :=
	  Hashhe.map
	    (begin fun hedge oldpolicy ->
	      let predvertex = (PSHGraph.predvertex graph hedge).(0) in
	      let abs = PSHGraph.attrvertex fp predvertex in
	      let transfer = PSHGraph.attrhedge graph hedge in
	      let policy =
		begin match transfer with
		| Equation.Condition cond ->
		    improve_condition pmanager (Some oldpolicy) abs cond None
		| _ -> failwith ""
		end
	      in
	      loop := !loop || (not (policy_equal pmanager oldpolicy policy));
	      policy
	    end)
	    !policy
	;
	(* In the next iteration, intersect with the previous one *)
	output := !result;
       done;
      begin match !result with
      | Some x -> x
      | None -> failwith ""
      end
    end

end
(*  ********************************************************************** *)
(** {2 Bacward semantics} *)
(*  ********************************************************************** *)

module Backward = struct

  (*  ===================================================================== *)
  (** {3 Transfer function} *)
  (*  ===================================================================== *)

  (** Main transfer function *)
  let apply
    (graph:Equation.graph)
    ~(output : (Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output option ref)
    ~(policy:(Equation.hedge, 'a policy) Hashhe.t ref)
    (pmanager:'a Apron.Policy.man)
    (hedge:int)
    (tabs:'a Apron.Abstract1.t array)
    :
    unit * 'a Apron.Abstract1.t
    =
    let manager = Apron.Policy.manager_get_manager pmanager in
    let transfer = PSHGraph.attrhedge graph hedge in
    let abs = tabs.(0) in
    let dest = match !output with
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
	  Solving.Backward.apply_tassign manager abs var expr dest
      | Equation.Lassign _ ->
	  failwith ""
      | Equation.Condition cond ->
	  let policy = Hashhe.find !policy hedge in
	  apply_condition pmanager policy abs cond dest
      | Equation.Call(callerinfo,calleeinfo,tin,tout) ->
	  Solving.Backward.apply_call manager abs callerinfo calleeinfo tin dest
      | Equation.Return(callerinfo,calleeinfo,tin,tout) ->
	  Solving.Backward.apply_return manager abs callerinfo calleeinfo tin tout dest
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
      (pmanager:'a Apron.Policy.man)
      ~(debug:int)
      :
      (Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output
      =
    let manager = Apron.Policy.manager_get_manager pmanager in
    let info = PSHGraph.info graph in

    let output = ref output in
    let sstart = ref (PSette.empty Equation.compare_point) in
    List.iter
      (begin fun procedure ->
	Spl_syn.iter_eltinstr
	  (begin fun (bpoint,instr) ->
	    if instr.Spl_syn.instruction = Spl_syn.FAIL then begin
	      let ok = match !output with
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
	begin match !output with
	| None ->
	    Apron.Abstract1.top manager (Hashhe.find info.Equation.pointenv vertex)
	| Some(output) ->
	    PSHGraph.attrvertex output vertex
	end
      end
      in
      let policy = make_policy pmanager graph output in
      let fpmanager =
	make_fpmanager ~fmt ~output ~debug ~graph
	  ~policy
	  ~pman:pmanager
	  ~abstract_init ~apply
      in
      let result = ref None in
      let loop = ref true in
      while !loop do
	let fp =
	  if !Option.iteration_guided then
	    Fixpoint.analysis_guided
	      fpmanager graph !sstart
	      (fun filter  ->
		Fixpoint.make_strategy_default
		  ~vertex_dummy:Equation.vertex_dummy
		  ~hedge_dummy:Equation.hedge_dummy
		  ~priority:(PSHGraph.Filter filter)
		  graph !sstart)
	  else
	    Fixpoint.analysis_std
	      fpmanager graph !sstart
	      (Fixpoint.make_strategy_default
		~vertex_dummy:Equation.vertex_dummy
		~hedge_dummy:Equation.hedge_dummy
		graph !sstart)
	in
	result := Some fp;
	(* Display *)
	if !Option.debug >0 then begin
	  printf "policy=%a" (hash_policy_print pmanager) !policy;
	  Solving.print_output prog fmt fp;
	end;
	(* Now try to modify the policy *)
	loop := false;
	policy :=
	  Hashhe.map
	    (begin fun hedge oldpolicy ->
	      let predvertex = (PSHGraph.predvertex graph hedge).(0) in
	      let abs = PSHGraph.attrvertex fp predvertex in
	      let transfer = PSHGraph.attrhedge graph hedge in
	      let policy =
		begin match transfer with
		| Equation.Condition cond ->
		    improve_condition pmanager (Some oldpolicy) abs cond None
		| _ -> failwith ""
		end
	      in
	      loop := !loop || (not (policy_equal pmanager oldpolicy policy));
	      policy
	    end)
	    !policy
	;
	(* In the next iteration, intersect with the previous one *)
	output := !result;
      done;
      begin match !result with
      | Some x -> x
      | None -> failwith ""
      end
    end
end

(** Generating equations from abstract syntax tree *)

(* This file is part of the Interproc analyzer, released under GPL license.
   Please read the COPYING file packaged in the distribution.

   Copyright (C) Mathias Argoud, Gaël Lalire, Bertrand Jeannet 2007.
*)

open Spl_syn
open Format

(*  ********************************************************************** *)
(** {2 Useful Information for generating equations} *)
(*  ********************************************************************** *)

(*  ---------------------------------------------------------------------- *)
(** {3 Utility functions} *)
(*  ---------------------------------------------------------------------- *)

(** Last element of a list *)
let rec last_of_list = function
  | [] -> failwith ""
  | [x] -> x
  | x::l -> last_of_list l

(** Exit point of a block *)
let exit_of_block block =
  if block.instrs=[] then
    block.bpoint
  else begin
    let instr = last_of_list block.instrs in
    instr.ipoint
  end

(** Extract an array of variables from variable declaration list *)
let convert (lvartyp:(var*typ) list) : var array
  =
  Array.of_list
    (List.map (fun (var,typ) -> var) lvartyp)

(** Add to an environment a list of variables *)
let add_env
  (env:Apron.Environment.t)
  (lvartyp:(var*typ) list)
  :
  Apron.Environment.t
  =
  let (lint,lreal) =
    List.fold_left
      (begin fun (lint,lreal) (var,typ) ->
	if typ = INT then
	  (var::lint,lreal)
	else
	  (lint,var::lreal)
      end)
      ([],[])
      lvartyp
  in
  Apron.Environment.add env
    (Array.of_list lint)
    (Array.of_list lreal)

(*  ---------------------------------------------------------------------- *)
(** {3 Building preprocessed information} *)
(*  ---------------------------------------------------------------------- *)

(** Build a [Equation.procinfo] object from [Spl_syn.procedure]. *)
let make_procinfo (proc:procedure) : Equation.procinfo
  =
  let (pcode:block) = proc.pcode in
  let pstart = pcode.bpoint in
  let pexit = exit_of_block pcode in

  let pinput = convert proc.Spl_syn.pinput in
  let poutput = convert proc.Spl_syn.poutput in
  let plocal = convert proc.Spl_syn.plocal in

  let penv = Apron.Environment.make [||] [||] in
  let penv = add_env penv proc.Spl_syn.pinput in
  let penv = add_env penv proc.Spl_syn.poutput in
  let penv = add_env penv proc.Spl_syn.plocal in

  let poutput_tmp =
    Array.mapi
      (begin fun i var ->
	Apron.Var.of_string (Format.sprintf "_%%out%i%%_" i)
      end)
      poutput
  in
  {
    Equation.pname = proc.pname;
    Equation.pstart = pstart;
    Equation.pexit = pexit;
    Equation.pinput = pinput;
    Equation.poutput = poutput;
    Equation.plocal = plocal;
    Equation.penv = penv;
    Equation.poutput_tmp = poutput_tmp;
  }

(** Build a [Equation.info] object from [Spl_syn.program]. *)
let make_info (prog:program) : Equation.info
  =
  let procinfo = Hashhe.create 3 in
  List.iter
    (begin fun proc ->
      let info = make_procinfo proc in
      Hashhe.add procinfo proc.pname info
    end)
    prog.procedures
  ;

  let callret = DHashhe.create 3 in
  List.iter
    (begin fun proc ->
      Spl_syn.iter_eltinstr
      (begin fun (bpoint,instr) ->
	begin match instr.instruction with
	| CALL _ -> DHashhe.add callret bpoint instr.ipoint
	| _ -> ()
	end
      end)
      proc.pcode
    end)
    prog.procedures
  ;
  let pointenv = Hashhe.create 3 in
  List.iter
    (begin fun proc ->
      let pinfo = Hashhe.find procinfo proc.pname in
      let env = pinfo.Equation.penv in
      Spl_syn.iter_instr
	(begin fun (point,instr) ->
	  if not (Hashhe.mem pointenv point) then
	    Hashhe.add pointenv point env;
	  if not (Hashhe.mem pointenv instr.ipoint) then
	    Hashhe.add pointenv instr.ipoint env;
	end)
	proc.pcode
    end)
    prog.procedures
  ;
  {
    Equation.procinfo = procinfo;
    Equation.callret = callret;
    Equation.pointenv = pointenv;
    Equation.counter = 0;
  }

(*  ********************************************************************** *)
(** {2 Translating expressions} *)
(*  ********************************************************************** *)

let negate_texpr (texpr:Apron.Texpr1.t) : Apron.Texpr1.t
  =
  let expr = Apron.Texpr1.to_expr texpr in
  let nexpr = match expr with
    | Apron.Texpr1.Unop(Apron.Texpr1.Neg,e,typ,round) ->
	e
    | _ ->
	Apron.Texpr1.Unop(
	  Apron.Texpr1.Neg, expr,
	  Apron.Texpr1.Real, Apron.Texpr1.Rnd
	)
  in
  let env = Apron.Texpr1.get_env texpr in
  Apron.Texpr1.of_expr env nexpr

let negate_tcons (tcons:Apron.Tcons1.t) : Apron.Tcons1.t
  =
  let texpr = Apron.Tcons1.get_texpr1 tcons in
  let (ntyp,ntexpr) = match Apron.Tcons1.get_typ tcons with
    | Apron.Tcons1.EQ -> (Apron.Tcons1.DISEQ,texpr)
    | Apron.Tcons1.DISEQ -> (Apron.Tcons1.EQ,texpr)
    | Apron.Tcons1.SUPEQ -> (Apron.Tcons1.SUP, negate_texpr texpr)
    | Apron.Tcons1.SUP -> (Apron.Tcons1.SUPEQ, negate_texpr texpr)
    | Apron.Tcons1.EQMOD _ -> failwith "EQMOD not supported now"
  in
  Apron.Tcons1.make ntexpr ntyp

let tcons_of_cons env (cons:Spl_syn.cons) : Apron.Tcons1.t
  =
  let (expr1,typ,expr2) = cons in
  let (typ,expr) = match typ with
  | EQ ->
      (Apron.Tcons1.EQ,
       Apron.Texpr1.Binop(Apron.Texpr1.Sub,expr1,expr2,Apron.Texpr1.Real, Apron.Texpr1.Rnd))
  | NEQ ->
      (Apron.Tcons1.DISEQ,
       Apron.Texpr1.Binop(Apron.Texpr1.Sub,expr1,expr2,Apron.Texpr1.Real, Apron.Texpr1.Rnd))
  | GEQ ->
      (Apron.Tcons1.SUPEQ,
       Apron.Texpr1.Binop(Apron.Texpr1.Sub,expr1,expr2,Apron.Texpr1.Real, Apron.Texpr1.Rnd))
  | GT ->
      (Apron.Tcons1.SUP,
       Apron.Texpr1.Binop(Apron.Texpr1.Sub,expr1,expr2,Apron.Texpr1.Real, Apron.Texpr1.Rnd))
  | LEQ ->
      (Apron.Tcons1.SUPEQ,
       Apron.Texpr1.Binop(Apron.Texpr1.Sub,expr2,expr1,Apron.Texpr1.Real, Apron.Texpr1.Rnd))
  | LT ->
      (Apron.Tcons1.SUP,
       Apron.Texpr1.Binop(Apron.Texpr1.Sub,expr2,expr1,Apron.Texpr1.Real, Apron.Texpr1.Rnd))
  in
  Apron.Tcons1.make (Apron.Texpr1.of_expr env expr) typ

let rec push_not (bexpr:Spl_syn.bexpr) : Spl_syn.bexpr
    =
  match bexpr with
  | TRUE | FALSE | BRANDOM | CONS _ ->
      bexpr
  | NOT(e) ->
      begin match e with
      | TRUE -> FALSE
      | FALSE -> TRUE
      | BRANDOM -> BRANDOM
      | CONS(cons) -> e
      | AND(e1,e2) -> OR(push_not (NOT e1), push_not (NOT e2))
      | OR(e1,e2) -> AND(push_not (NOT e1), push_not (NOT e2))
      | NOT(e) -> push_not e
      end
  | AND(e1,e2) -> AND(push_not e1, push_not e2)
  | OR(e1,e2) -> OR(push_not e1, push_not e2)

let boolexpr0_of_bexpr env (bexpr:Spl_syn.bexpr)
    :
    Apron.Tcons1.t array Boolexpr.t
    =
  let cand t1 t2 = Boolexpr.make_conjunction (Array.append t1 t2) in
  let rec translate bexpr =
    match bexpr with
    | TRUE | BRANDOM -> Boolexpr.make_cst true
    | FALSE -> Boolexpr.make_cst false
    | CONS(cons) ->
	let tcons = tcons_of_cons env cons in
	Boolexpr.make_conjunction [|tcons|]
    | AND(e1,e2) ->
	Boolexpr.make_and ~cand
	  (translate e1) (translate e2)
    | OR(e1,e2) ->
	Boolexpr.make_or (translate e1) (translate e2)
    | NOT(e) ->
	begin match e with
	| FALSE | BRANDOM -> Boolexpr.make_cst true
	| TRUE -> Boolexpr.make_cst false
	| CONS(cons) ->
	    let tcons = tcons_of_cons env cons in
	    let tcons = negate_tcons tcons in
	    Boolexpr.make_conjunction [|tcons|]
	| AND(e1,e2) ->
	    Boolexpr.make_or (translate (NOT e1)) (translate (NOT e2))
	| OR(e1,e2) ->
	    Boolexpr.make_and ~cand
	      (translate (NOT e1)) (translate (NOT e2))
	| NOT(e) -> translate e
	end
  in
  translate bexpr

let boolexpr_of_bexpr env (bexpr:Spl_syn.bexpr)
    :
    Apron.Tcons1.earray Boolexpr.t
    =
  let bexpr0 = boolexpr0_of_bexpr env bexpr in
  Boolexpr.map
    (begin fun tcons ->
      assert(tcons<>[||]);
      let res = Apron.Tcons1.array_make env (Array.length tcons) in
      Array.iteri
	(fun i cons -> Apron.Tcons1.array_set res i cons)
	tcons;
      res
    end)
    bexpr0

(*  ********************************************************************** *)
(** {2 Forward equations} *)
(*  ********************************************************************** *)

module Forward = struct
  let make (prog:Spl_syn.program) : Equation.graph =

    let info = make_info prog in
    let graph = Equation.create 3 info in

    let rec iter_block (procinfo:Equation.procinfo) (block:block) : unit
      =
      let env = procinfo.Equation.penv in
      ignore begin
	List.fold_left
	  (begin fun point instr ->
	    begin match instr.instruction with
	    | SKIP ->
		let transfer = Equation.Condition(Boolexpr.TRUE) in
		Equation.add_equation graph [|point|] transfer instr.ipoint;
	    | HALT
	    | FAIL ->
		(* We still put a dummy equation *)
		let transfer = Equation.Condition(Boolexpr.DISJ([])) in
		Equation.add_equation graph [|point|] transfer instr.ipoint;
		()
	    | ASSUME(bexpr) ->
		let cond = boolexpr_of_bexpr env bexpr in
		let transfer = Equation.Condition(cond) in
		Equation.add_equation graph [|point|] transfer instr.ipoint;
	    | ASSIGN(var,iexpr) ->
		let (texpr:Apron.Texpr1.t) =
		  Apron.Texpr1.of_expr env iexpr
		in
		let transfer = Equation.Tassign(var,texpr) in
		Equation.add_equation graph [|point|] transfer instr.ipoint;
	    | CALL(pout,name,pin) ->
		let callee = Hashhe.find info.Equation.procinfo name in
		let pin = Array.of_list pin in
		let pout = Array.of_list pout in
		let calltransfer = Equation.Call(procinfo,callee,pin,pout) in
		let rettransfer = Equation.Return(procinfo,callee, pin, pout) in
		Equation.add_equation graph
		  [|point|] calltransfer callee.Equation.pstart;
		Equation.add_equation graph
		  [|point; callee.Equation.pexit|] rettransfer instr.ipoint;
	    | IF(bexpr,block) ->
		let cond = boolexpr_of_bexpr env bexpr in
		let condnot = boolexpr_of_bexpr env (NOT bexpr) in
		let condtransfer = Equation.Condition(cond) in
		let condnottransfer = Equation.Condition(condnot) in
		Equation.add_equation graph
		  [|point|] condtransfer block.bpoint;
		Equation.add_equation graph
		  [|exit_of_block block|] (Equation.Condition(Boolexpr.make_cst true)) instr.ipoint;
		Equation.add_equation graph
		  [|point|]  condnottransfer instr.ipoint;
		iter_block procinfo block
	    | IFELSE(bexpr,block1,block2) ->
		let cond = boolexpr_of_bexpr env bexpr in
		let condnot = boolexpr_of_bexpr env (NOT bexpr) in
		let condtransfer = Equation.Condition(cond) in
		let condnottransfer = Equation.Condition(condnot) in
		Equation.add_equation graph
		  [|point|]  condtransfer block1.bpoint;
		Equation.add_equation graph
		  [|exit_of_block block1|] (Equation.Condition(Boolexpr.make_cst true)) instr.ipoint;
		Equation.add_equation graph
		  [|point|] condnottransfer block2.bpoint;
		Equation.add_equation graph
		  [|exit_of_block block2|] (Equation.Condition(Boolexpr.make_cst true)) instr.ipoint;
		iter_block procinfo block1;
		iter_block procinfo block2
	    | LOOP(bexpr,block) ->
		let cond = boolexpr_of_bexpr env bexpr in
		let condnot = boolexpr_of_bexpr env (NOT bexpr) in
		let condtransfer = Equation.Condition(cond) in
		let condnottransfer = Equation.Condition(condnot) in
		Equation.add_equation graph
		  [|point|] condtransfer block.bpoint;
		Equation.add_equation graph
		  [|exit_of_block block|] (Equation.Condition(Boolexpr.make_cst true)) point;
		Equation.add_equation graph
		  [|point|] condnottransfer instr.ipoint;
		iter_block procinfo block
	    end;
	    instr.ipoint
	  end)
	  block.bpoint
	  block.instrs
      end
    in

    List.iter
      (begin fun procedure ->
	let procinfo = Hashhe.find info.Equation.procinfo procedure.pname in
	iter_block procinfo procedure.pcode;
      end)
      prog.procedures;

    graph

end

(*  ********************************************************************** *)
(** {2 Backward equations} *)
(*  ********************************************************************** *)

module Backward = struct
  let make (prog:Spl_syn.program) : Equation.graph =

    let info = make_info prog in
    let graph = Equation.create 3 info in

    let rec iter_block (procinfo:Equation.procinfo) (block:block) : unit
      =
      let env = procinfo.Equation.penv in
      ignore begin
	List.fold_left
	  (begin fun point instr ->
	    begin match instr.instruction with
	    | SKIP ->
		let transfer = Equation.Condition(Boolexpr.make_cst true) in
		Equation.add_equation graph [|instr.ipoint|] transfer point;
	    | HALT
	    | FAIL ->
		(* We still put a dummy equation *)
		let transfer = Equation.Condition(Boolexpr.make_cst false) in
		Equation.add_equation graph [|instr.ipoint|] transfer point;
	    | ASSUME(bexpr) ->
		let cond = boolexpr_of_bexpr env bexpr in
		let transfer = Equation.Condition(cond) in
		Equation.add_equation graph [|instr.ipoint|] transfer point;
	    | ASSIGN(var,iexpr) ->
		let (texpr:Apron.Texpr1.t) =
		  Apron.Texpr1.of_expr env iexpr
		in
		let transfer = Equation.Tassign(var,texpr) in
		Equation.add_equation graph [|instr.ipoint|] transfer point;
	    | CALL(pout,name,pin) ->
		let callee = Hashhe.find info.Equation.procinfo name in
		let pin = Array.of_list pin in
		let pout = Array.of_list pout in
		let calltransfer = Equation.Call(procinfo,callee,pin,pout) in
		let rettransfer = Equation.Return(procinfo,callee,pin,pout) in
		Equation.add_equation graph
		  [|callee.Equation.pstart|] calltransfer point;
		Equation.add_equation graph
		  [|instr.ipoint|] rettransfer callee.Equation.pexit;
	    | IF(bexpr,block) ->
		let cond = boolexpr_of_bexpr env bexpr in
		let condnot = boolexpr_of_bexpr env (NOT bexpr) in
		let condtransfer = Equation.Condition(cond) in
		let condnottransfer = Equation.Condition(condnot) in
		Equation.add_equation graph
		  [|block.bpoint|] condtransfer point;
		Equation.add_equation graph
		  [|instr.ipoint|] (Equation.Condition(Boolexpr.make_cst true)) (exit_of_block block);
		Equation.add_equation graph
		  [|instr.ipoint|] condnottransfer point;
		iter_block procinfo block
	    | IFELSE(bexpr,block1,block2) ->
		let cond = boolexpr_of_bexpr env bexpr in
		let condnot = boolexpr_of_bexpr env (NOT bexpr) in
		let condtransfer = Equation.Condition(cond) in
		let condnottransfer = Equation.Condition(condnot) in
		Equation.add_equation graph
		  [|block1.bpoint|] condtransfer point;
		Equation.add_equation graph
		  [|instr.ipoint|] (Equation.Condition(Boolexpr.make_cst true)) (exit_of_block block1);
		Equation.add_equation graph
		  [|block2.bpoint|] condnottransfer point;
		Equation.add_equation graph
		  [|instr.ipoint|] (Equation.Condition(Boolexpr.make_cst true)) (exit_of_block block2);
		iter_block procinfo block1;
		iter_block procinfo block2
	    | LOOP(bexpr,block) ->
		let cond = boolexpr_of_bexpr env bexpr in
		let condnot = boolexpr_of_bexpr env (NOT bexpr) in
		let condtransfer = Equation.Condition(cond) in
		let condnottransfer = Equation.Condition(condnot) in
		Equation.add_equation graph
		  [|block.bpoint|] condtransfer point;
		Equation.add_equation graph
		  [|point|] (Equation.Condition(Boolexpr.make_cst true)) (exit_of_block block);
		Equation.add_equation graph
		  [|instr.ipoint|] condnottransfer point;
		iter_block procinfo block
	    end;
	    instr.ipoint
	  end)
	  block.bpoint
	  block.instrs
      end
    in

    List.iter
      (begin fun procedure ->
	let procinfo = Hashhe.find info.Equation.procinfo procedure.pname in
	iter_block procinfo procedure.pcode;
      end)
      prog.procedures;

    graph

end

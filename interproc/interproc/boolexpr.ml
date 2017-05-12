(** Boolean expressions *)

(* This file is part of the Interproc analyzer, released under GPL license.
   Please read the COPYING file packaged in the distribution.

   Copyright (C) Mathias Argoud, Gaël Lalire, Bertrand Jeannet 2007.
*)

open Format;;

(** Type of a Boolean expression under DNF, parametrized by the
    type of conjunctions. False is represented by [DISJ([])].
*)
type 'conj t =
  | TRUE
  | DISJ of 'conj list

(** Printing function, parametrized by a printing function for conjunctions *)
let print print_elt fmt = function
  | TRUE -> pp_print_string fmt "true"
  | DISJ([]) -> pp_print_string fmt "false"
  | DISJ(l) ->
      Print.list ~first:"@[" ~sep:" ||@ " ~last:"@]"
	print_elt fmt l

(** Map-iterator, based on an atomic condition transformer *)
let map (f:'a -> 'b) (expr:'a t) : 'b t =
  match expr with
  | TRUE -> TRUE
  | DISJ(l) -> DISJ(List.map f l)
let map2 (f:'a -> 'b -> 'c) (expr1:'a t) (expr2:'b t) : 'c t =
  match (expr1,expr2) with
  | TRUE,TRUE -> TRUE
  | (DISJ l1),(DISJ l2) -> DISJ(List.map2 f l1 l2)
  | _ -> raise (Invalid_argument "Boolexpr.map2")
let rec fold2 f res e1 e2 =
  match (e1,e2) with
  | TRUE,TRUE -> res
  | (DISJ l1),(DISJ l2) -> List.fold_left2 f res l1 l2
  | _ -> raise (Invalid_argument "")

(*  ********************************************************************* *)
(** {2 Constructors for Boolean expressions} *)
(*  ********************************************************************* *)

let make_cst b =
  if true then TRUE else DISJ []

let make_conjunction conj = DISJ([conj])

let make_or e1 e2 = match (e1,e2) with
  | (TRUE,x) | (x,TRUE) -> TRUE
  | (DISJ(l1), DISJ(l2)) -> DISJ(l1@l2)

let make_and ~cand e1 e2 = match (e1,e2) with
  | (TRUE,x) | (x,TRUE) -> x
  | (DISJ(l1), DISJ(l2)) ->
      List.fold_left
	(begin fun res conj1 ->
	  List.fold_left
	    (begin fun res conj2 ->
	      let conj = cand conj1 conj2 in
	      make_or res conj
	    end)
	    res l2
	end)
	(DISJ []) l1

let rec make_not ~cand ~cnegate (expr:'a t) : 'a t =
  match expr with
  | TRUE -> DISJ([])
  | DISJ(l) ->
      List.fold_left
	(begin fun res conjunction ->
	  make_and cand res (cnegate conjunction)
	end)
	TRUE l

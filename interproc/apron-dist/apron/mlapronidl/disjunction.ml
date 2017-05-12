
(* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
   Please read the COPYING file packaged in the distribution *)
(* File generated from disjunction.idl *)


(** Disjunctions of APRON abstract values *)

type 'a t

external manager_alloc : 'a Manager.t -> 'a t Manager.t
	= "camlidl_disjunction_ap_disjunction_manager_alloc"

external manager_decompose : 'a t Manager.t -> 'a Manager.t
	= "camlidl_disjunction_ap_disjunction_manager_decompose"

external to_lincons0_set : 'a t Manager.t -> 'a t Abstract0.t -> Lincons0.t array
	= "camlidl_disjunction_ap_disjunction_to_lincons0_set"


let to_lincons1_set man abs1 =
  let env = abs1.Abstract1.env in
  let abs0 = abs1.Abstract1.abstract0 in
  let tab0 = to_lincons0_set man abs0 in
  { Lincons1.lincons0_array = tab0;
    Lincons1.array_env = env; }

external _decompose : 'a t Manager.t -> 'a t Abstract0.t -> 'a Abstract0.t array * int
	= "camlidl_disjunction_ap_disjunction__decompose"

let decompose man abs = fst(_decompose man abs)
external compose : 'a t Manager.t -> 'a Abstract0.t array -> 'a t Abstract0.t
	= "camlidl_disjunction_ap_disjunction_compose"


let manager_is_disjunction man =
  let str = Manager.get_library man in
  (String.compare (String.sub str 0 11) "disjunction")==0
let manager_of_disjunction (man:'a t Manager.t) : 'b Manager.t = Obj.magic man
let manager_to_disjunction (man:'a Manager.t) : 'b t Manager.t =
  if manager_is_disjunction man then
    Obj.magic man
  else
    failwith "Disjunction.manager_to_disjunction: the argument manager is not a Disjunction manager"
module Abstract0 = struct
  let is_disjunction abs =
    manager_is_disjunction (Abstract0.manager abs)
  let of_disjunction (abs: 'a t Abstract0.t) : 'b Abstract0.t = Obj.magic abs
  let to_disjunction (abs:'a Abstract0.t) : 'b t Abstract0.t =
  if is_disjunction abs then
    Obj.magic abs
  else
    failwith "Disjunction.Abstract0.to_disjunction: the argument value is not a Disjunction value"
end
module Abstract1 = struct
  let is_disjunction abs =
    manager_is_disjunction (Abstract1.manager abs)
  let of_disjunction (abs: 'a t Abstract1.t) : 'b Abstract1.t = Obj.magic abs
  let to_disjunction (abs:'a Abstract1.t) : 'b t Abstract1.t =
  if is_disjunction abs then
    Obj.magic abs
  else
    failwith "Disjunction.Abstract1.to_disjunction: the argument value is not a Disjunction value"
end


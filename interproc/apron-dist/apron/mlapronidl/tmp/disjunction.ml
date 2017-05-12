(* File generated from disjunction.idl *)


(** Disjunctions of APRON abstract values *)

type 'a t

external ap_disjunction_manager_alloc : Manager.ap_manager_ptr -> Manager.ap_manager_ptr
	= "camlidl_disjunction_ap_disjunction_manager_alloc"

external ap_disjunction_manager_decompose : Manager.ap_manager_ptr -> Manager.ap_manager_ptr
	= "camlidl_disjunction_ap_disjunction_manager_decompose"

external ap_disjunction_to_lincons0_set : Manager.ap_manager_ptr -> Abstract0.ap_abstract0_ptr -> Lincons0.ap_lincons0_array_t
	= "camlidl_disjunction_ap_disjunction_to_lincons0_set"


let to_lincons1_set man abs1 =
  let env = abs1.Abstract1.env in
  let abs0 = abs1.Abstract1.abstract0 in
  let tab0 = to_lincons0_set man abs0 in
  { Lincons1.lincons0_array = tab0;
    Lincons1.array_env = env; }

external ap_disjunction__decompose : Manager.ap_manager_ptr -> Abstract0.ap_abstract0_ptr -> Abstract0.ap_abstract0_ptr array * int
	= "camlidl_disjunction_ap_disjunction__decompose"

let decompose man abs = fst(_decompose man abs)
external ap_disjunction_compose : Manager.ap_manager_ptr -> Abstract0.ap_abstract0_ptr array -> Abstract0.ap_abstract0_ptr
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


(* File generated from policy.idl *)

type ap_policy_manager_ptr
and ap_policy_ptr
and ap_policy_optr

(* ********************************************************************** *)
(** {2 Policy manager} *)
(* ********************************************************************** *)
external ap_policy_manager_get_manager : ap_policy_manager_ptr -> Manager.ap_manager_ptr
	= "camlidl_policy_ap_policy_manager_get_manager"

(* ********************************************************************** *)
(** {2 Policy, general} *)
(* ********************************************************************** *)
external ap_policy_manager : ap_policy_ptr -> ap_policy_manager_ptr
	= "camlidl_policy_ap_policy_manager"

external ap_policy_copy : ap_policy_manager_ptr -> ap_policy_ptr -> ap_policy_ptr
	= "camlidl_policy_ap_policy_copy"

external ap_policy_fdump : ap_policy_manager_ptr -> ap_policy_ptr -> unit
	= "camlidl_policy_ap_policy_fdump"

external ap_policy_to_string : ap_policy_manager_ptr -> ap_policy_ptr -> string
	= "camlidl_policy_ap_policy_to_string"

external ap_policy_dimension : ap_policy_manager_ptr -> ap_policy_ptr -> int
	= "camlidl_policy_ap_policy_dimension"

external ap_policy_equal : ap_policy_manager_ptr -> ap_policy_ptr -> ap_policy_ptr -> bool
	= "camlidl_policy_ap_policy_equal"

(* ********************************************************************** *)
(** {2 Policy, level 0} *)
(* ********************************************************************** *)


module Abstract0 : sig
external ap_abstract0_policy_meet_apply : ap_policy_manager_ptr -> ap_policy_ptr -> Abstract0.ap_abstract0_ptr -> Abstract0.ap_abstract0_ptr -> Abstract0.ap_abstract0_ptr
	= "camlidl_policy_ap_abstract0_policy_meet_apply"

external ap_abstract0_policy_meet_array_apply : ap_policy_manager_ptr -> ap_policy_ptr -> Abstract0.ap_abstract0_ptr array -> Abstract0.ap_abstract0_ptr
	= "camlidl_policy_ap_abstract0_policy_meet_array_apply"

external ap_abstract0_policy_meet_lincons_array_apply : ap_policy_manager_ptr -> ap_policy_ptr -> Abstract0.ap_abstract0_ptr -> Lincons0.ap_lincons0_array_t -> Abstract0.ap_abstract0_ptr
	= "camlidl_policy_ap_abstract0_policy_meet_lincons_array_apply"

external ap_abstract0_policy_meet_tcons_array_apply : ap_policy_manager_ptr -> ap_policy_ptr -> Abstract0.ap_abstract0_ptr -> Tcons0.ap_tcons0_array_t -> Abstract0.ap_abstract0_ptr
	= "camlidl_policy_ap_abstract0_policy_meet_tcons_array_apply"

external ap_abstract0_policy_meet_with_apply : ap_policy_manager_ptr -> ap_policy_ptr -> Abstract0.ap_abstract0_ptr -> Abstract0.ap_abstract0_ptr -> unit
	= "camlidl_policy_ap_abstract0_policy_meet_with_apply"

external ap_abstract0_policy_meet_lincons_array_with_apply : ap_policy_manager_ptr -> ap_policy_ptr -> Abstract0.ap_abstract0_ptr -> Lincons0.ap_lincons0_array_t -> unit
	= "camlidl_policy_ap_abstract0_policy_meet_lincons_array_with_apply"

external ap_abstract0_policy_meet_tcons_array_with_apply : ap_policy_manager_ptr -> ap_policy_ptr -> Abstract0.ap_abstract0_ptr -> Tcons0.ap_tcons0_array_t -> unit
	= "camlidl_policy_ap_abstract0_policy_meet_tcons_array_with_apply"

external ap_abstract0_policy_meet_improve : ap_policy_manager_ptr -> ap_policy_optr -> Abstract0.ap_abstract0_ptr -> Abstract0.ap_abstract0_ptr -> ap_policy_ptr
	= "camlidl_policy_ap_abstract0_policy_meet_improve"

external ap_abstract0_policy_meet_array_improve : ap_policy_manager_ptr -> ap_policy_optr -> Abstract0.ap_abstract0_ptr array -> ap_policy_ptr
	= "camlidl_policy_ap_abstract0_policy_meet_array_improve"

external ap_abstract0_policy_meet_lincons_array_improve : ap_policy_manager_ptr -> ap_policy_optr -> Abstract0.ap_abstract0_ptr -> Lincons0.ap_lincons0_array_t -> ap_policy_ptr
	= "camlidl_policy_ap_abstract0_policy_meet_lincons_array_improve"

external ap_abstract0_policy_meet_tcons_array_improve : ap_policy_manager_ptr -> ap_policy_optr -> Abstract0.ap_abstract0_ptr -> Tcons0.ap_tcons0_array_t -> ap_policy_ptr
	= "camlidl_policy_ap_abstract0_policy_meet_tcons_array_improve"

end
(* ********************************************************************** *)
(** {2 Policy, level 1} *)
(* ********************************************************************** *)


module Abstract1 : sig
external ap_abstract1_policy_meet_apply : ap_policy_manager_ptr -> ap_policy_ptr -> Abstract1.ap_abstract1_t -> Abstract1.ap_abstract1_t -> Abstract1.ap_abstract1_t
	= "camlidl_policy_ap_abstract1_policy_meet_apply"

external ap_abstract1_policy_meet_array_apply : ap_policy_manager_ptr -> ap_policy_ptr -> Abstract1.ap_abstract1_t array -> Abstract1.ap_abstract1_t
	= "camlidl_policy_ap_abstract1_policy_meet_array_apply"

external ap_abstract1_policy_meet_lincons_array_apply : ap_policy_manager_ptr -> ap_policy_ptr -> Abstract1.ap_abstract1_t -> Lincons1.ap_lincons1_array_t -> Abstract1.ap_abstract1_t
	= "camlidl_policy_ap_abstract1_policy_meet_lincons_array_apply"

external ap_abstract1_policy_meet_tcons_array_apply : ap_policy_manager_ptr -> ap_policy_ptr -> Abstract1.ap_abstract1_t -> Tcons1.ap_tcons1_array_t -> Abstract1.ap_abstract1_t
	= "camlidl_policy_ap_abstract1_policy_meet_tcons_array_apply"

external ap_abstract1_policy_meet_with_apply : ap_policy_manager_ptr -> ap_policy_ptr -> Abstract1.ap_abstract1_t -> Abstract1.ap_abstract1_t -> unit
	= "camlidl_policy_ap_abstract1_policy_meet_with_apply"

external ap_abstract1_policy_meet_lincons_array_with_apply : ap_policy_manager_ptr -> ap_policy_ptr -> Abstract1.ap_abstract1_t -> Lincons1.ap_lincons1_array_t -> unit
	= "camlidl_policy_ap_abstract1_policy_meet_lincons_array_with_apply"

external ap_abstract1_policy_meet_tcons_array_with_apply : ap_policy_manager_ptr -> ap_policy_ptr -> Abstract1.ap_abstract1_t -> Tcons1.ap_tcons1_array_t -> unit
	= "camlidl_policy_ap_abstract1_policy_meet_tcons_array_with_apply"

external ap_abstract1_policy_meet_improve : ap_policy_manager_ptr -> ap_policy_optr -> Abstract1.ap_abstract1_t -> Abstract1.ap_abstract1_t -> ap_policy_ptr
	= "camlidl_policy_ap_abstract1_policy_meet_improve"

external ap_abstract1_policy_meet_array_improve : ap_policy_manager_ptr -> ap_policy_optr -> Abstract1.ap_abstract1_t array -> ap_policy_ptr
	= "camlidl_policy_ap_abstract1_policy_meet_array_improve"

external ap_abstract1_policy_meet_lincons_array_improve : ap_policy_manager_ptr -> ap_policy_optr -> Abstract1.ap_abstract1_t -> Lincons1.ap_lincons1_array_t -> ap_policy_ptr
	= "camlidl_policy_ap_abstract1_policy_meet_lincons_array_improve"

external ap_abstract1_policy_meet_tcons_array_improve : ap_policy_manager_ptr -> ap_policy_optr -> Abstract1.ap_abstract1_t -> Tcons1.ap_tcons1_array_t -> ap_policy_ptr
	= "camlidl_policy_ap_abstract1_policy_meet_tcons_array_improve"

end

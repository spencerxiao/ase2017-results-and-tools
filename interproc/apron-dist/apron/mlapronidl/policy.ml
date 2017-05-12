
(* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
   Please read the COPYING file packaged in the distribution *)
(* File generated from policy.idl *)

type 'a man
and 'a t


(* ********************************************************************** *)
(** {2 Policy manager} *)
(* ********************************************************************** *)
external manager_get_manager : 'a man -> 'a Manager.t
	= "camlidl_policy_ap_policy_manager_get_manager"

(* ********************************************************************** *)
(** {2 Policy, general} *)
(* ********************************************************************** *)
external manager : 'a t -> 'a man
	= "camlidl_policy_ap_policy_manager"

external copy : 'a man -> 'a t -> 'a t
	= "camlidl_policy_ap_policy_copy"

external fdump : 'a man -> 'a t -> unit
	= "camlidl_policy_ap_policy_fdump"

external to_string : 'a man -> 'a t -> string
	= "camlidl_policy_ap_policy_to_string"

external dimension : 'a man -> 'a t -> int
	= "camlidl_policy_ap_policy_dimension"

external equal : 'a man -> 'a t -> 'a t -> bool
	= "camlidl_policy_ap_policy_equal"

(* ********************************************************************** *)
(** {2 Policy, level 0} *)
(* ********************************************************************** *)


module Abstract0 = struct
external meet_apply : 'a man -> 'a t -> 'a Abstract0.t -> 'a Abstract0.t -> 'a Abstract0.t
	= "camlidl_policy_ap_abstract0_policy_meet_apply"

external meet_array_apply : 'a man -> 'a t -> 'a Abstract0.t array -> 'a Abstract0.t
	= "camlidl_policy_ap_abstract0_policy_meet_array_apply"

external meet_lincons_array_apply : 'a man -> 'a t -> 'a Abstract0.t -> Lincons0.t array -> 'a Abstract0.t
	= "camlidl_policy_ap_abstract0_policy_meet_lincons_array_apply"

external meet_tcons_array_apply : 'a man -> 'a t -> 'a Abstract0.t -> Tcons0.t array -> 'a Abstract0.t
	= "camlidl_policy_ap_abstract0_policy_meet_tcons_array_apply"

external meet_with_apply : 'a man -> 'a t -> 'a Abstract0.t -> 'a Abstract0.t -> unit
	= "camlidl_policy_ap_abstract0_policy_meet_with_apply"

external meet_lincons_array_with_apply : 'a man -> 'a t -> 'a Abstract0.t -> Lincons0.t array -> unit
	= "camlidl_policy_ap_abstract0_policy_meet_lincons_array_with_apply"

external meet_tcons_array_with_apply : 'a man -> 'a t -> 'a Abstract0.t -> Tcons0.t array -> unit
	= "camlidl_policy_ap_abstract0_policy_meet_tcons_array_with_apply"

external meet_improve : 'a man -> 'a t option -> 'a Abstract0.t -> 'a Abstract0.t -> 'a t
	= "camlidl_policy_ap_abstract0_policy_meet_improve"

external meet_array_improve : 'a man -> 'a t option -> 'a Abstract0.t array -> 'a t
	= "camlidl_policy_ap_abstract0_policy_meet_array_improve"

external meet_lincons_array_improve : 'a man -> 'a t option -> 'a Abstract0.t -> Lincons0.t array -> 'a t
	= "camlidl_policy_ap_abstract0_policy_meet_lincons_array_improve"

external meet_tcons_array_improve : 'a man -> 'a t option -> 'a Abstract0.t -> Tcons0.t array -> 'a t
	= "camlidl_policy_ap_abstract0_policy_meet_tcons_array_improve"

end
(* ********************************************************************** *)
(** {2 Policy, level 1} *)
(* ********************************************************************** *)


module Abstract1 = struct
external meet_apply : 'a man -> 'a t -> 'a Abstract1.t -> 'a Abstract1.t -> 'a Abstract1.t
	= "camlidl_policy_ap_abstract1_policy_meet_apply"

external meet_array_apply : 'a man -> 'a t -> 'a Abstract1.t array -> 'a Abstract1.t
	= "camlidl_policy_ap_abstract1_policy_meet_array_apply"

external meet_lincons_array_apply : 'a man -> 'a t -> 'a Abstract1.t -> Lincons1.earray -> 'a Abstract1.t
	= "camlidl_policy_ap_abstract1_policy_meet_lincons_array_apply"

external meet_tcons_array_apply : 'a man -> 'a t -> 'a Abstract1.t -> Tcons1.earray -> 'a Abstract1.t
	= "camlidl_policy_ap_abstract1_policy_meet_tcons_array_apply"

external meet_with_apply : 'a man -> 'a t -> 'a Abstract1.t -> 'a Abstract1.t -> unit
	= "camlidl_policy_ap_abstract1_policy_meet_with_apply"

external meet_lincons_array_with_apply : 'a man -> 'a t -> 'a Abstract1.t -> Lincons1.earray -> unit
	= "camlidl_policy_ap_abstract1_policy_meet_lincons_array_with_apply"

external meet_tcons_array_with_apply : 'a man -> 'a t -> 'a Abstract1.t -> Tcons1.earray -> unit
	= "camlidl_policy_ap_abstract1_policy_meet_tcons_array_with_apply"

external meet_improve : 'a man -> 'a t option -> 'a Abstract1.t -> 'a Abstract1.t -> 'a t
	= "camlidl_policy_ap_abstract1_policy_meet_improve"

external meet_array_improve : 'a man -> 'a t option -> 'a Abstract1.t array -> 'a t
	= "camlidl_policy_ap_abstract1_policy_meet_array_improve"

external meet_lincons_array_improve : 'a man -> 'a t option -> 'a Abstract1.t -> Lincons1.earray -> 'a t
	= "camlidl_policy_ap_abstract1_policy_meet_lincons_array_improve"

external meet_tcons_array_improve : 'a man -> 'a t option -> 'a Abstract1.t -> Tcons1.earray -> 'a t
	= "camlidl_policy_ap_abstract1_policy_meet_tcons_array_improve"

end

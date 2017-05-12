(* File generated from manager.idl *)

type ap_funid_t = 
| Funid_unknown
| Funid_copy
| Funid_free
| Funid_asize
| Funid_minimize
| Funid_canonicalize
| Funid_hash
| Funid_approximate
| Funid_fprint
| Funid_fprintdiff
| Funid_fdump
| Funid_serialize_raw
| Funid_deserialize_raw
| Funid_bottom
| Funid_top
| Funid_of_box
| Funid_dimension
| Funid_is_bottom
| Funid_is_top
| Funid_is_leq
| Funid_is_eq
| Funid_is_dimension_unconstrained
| Funid_sat_interval
| Funid_sat_lincons
| Funid_sat_tcons
| Funid_bound_dimension
| Funid_bound_linexpr
| Funid_bound_texpr
| Funid_to_box
| Funid_to_lincons_array
| Funid_to_tcons_array
| Funid_to_generator_array
| Funid_meet
| Funid_meet_array
| Funid_meet_lincons_array
| Funid_meet_tcons_array
| Funid_join
| Funid_join_array
| Funid_add_ray_array
| Funid_assign_linexpr_array
| Funid_substitute_linexpr_array
| Funid_assign_texpr_array
| Funid_substitute_texpr_array
| Funid_add_dimensions
| Funid_remove_dimensions
| Funid_permute_dimensions
| Funid_forget_array
| Funid_expand
| Funid_fold
| Funid_widening
| Funid_closure
| Funid_change_environment
| Funid_rename_array

and ap_funopt_t = {
  algorithm: int;
  timeout: int;
  max_object_size: int;
  flag_exact_wanted: bool;
  flag_best_wanted: bool;
}
and ap_exc_t = 
| Exc_none
| Exc_timeout
| Exc_out_of_space
| Exc_overflow
| Exc_invalid_argument
| Exc_not_implemented

and ap_exclog_t = {
  exn: ap_exc_t;
  funid: ap_funid_t;
  msg: string;
}
and ap_manager_ptr

(** APRON Managers *)
(** The type parameter ['a] allows to distinguish managers allocated by different underlying abstract domains. *)

(** Concerning the other types,

- [funid] defines identifiers for the generic function working on abstrat values;

- [funopt] defines the options associated to generic functions; 

- [exc] defines the different kind of exceptions; 

- [exclog] defines the exceptions raised by APRON functions.

*)

(** Get the name of the effective library which allocated the manager *)
external ap_manager_get_library : ap_manager_ptr -> string
	= "camlidl_manager_ap_manager_get_library"

(** Get the version of the effective library which allocated the manager *)
external ap_manager_get_version : ap_manager_ptr -> string
	= "camlidl_manager_ap_manager_get_version"

(** Return the default options for any function ([0] or [false] for al fields) *)
external ap_funopt_make : unit -> ap_funopt_t
	= "camlidl_manager_ap_funopt_make"

(** Get the options sets for the function. The result is a copy of the internal structure and may be freely modified. [funid] should be different from [Funid_change_environment] and [Funid_rename_array] (no option associated to them). *)
external ap_manager_get_funopt : ap_manager_ptr -> ap_funid_t -> ap_funopt_t
	= "camlidl_manager_ap_manager_get_funopt"

(** Set the options for the function. [funid] should be different from [Funid_change_environment] and [Funid_rename_array] (no option associated to them). *)
external ap_manager_set_funopt : ap_manager_ptr -> ap_funid_t -> ap_funopt_t -> unit
	= "camlidl_manager_ap_manager_set_funopt"

(** Get the corresponding result flag *)
external ap_manager_get_flag_exact : ap_manager_ptr -> bool
	= "camlidl_manager_ap_manager_get_flag_exact"

(** Get the corresponding result flag *)
external ap_manager_get_flag_best : ap_manager_ptr -> bool
	= "camlidl_manager_ap_manager_get_flag_best"

(** Exception raised by functions of the interface *)
exception Error of ap_exclog_t
val string_of_funid: ap_funid_t -> string
val string_of_exc: ap_exc_t -> string
val print_funid: Format.formatter -> ap_funid_t -> unit
val print_funopt: Format.formatter -> ap_funopt_t -> unit
val print_exc: Format.formatter -> ap_exc_t -> unit
val print_exclog: Format.formatter -> ap_exclog_t -> unit
  (** Printing functions *)
(** Set / get the global manager used for deserialization *)
external ap_manager_set_deserialize : ap_manager_ptr -> unit
	= "camlidl_manager_ap_manager_set_deserialize"

external ap_manager_get_deserialize : unit -> ap_manager_ptr
	= "camlidl_manager_ap_manager_get_deserialize"


(* File generated from var.idl *)

type ap_var_t

(** APRON Variables *)

(** Constructor *)
external ap_var_of_string : string -> ap_var_t
	= "camlidl_var_ap_var_of_string"

(** Comparison function *)
external ap_var_compare : ap_var_t -> ap_var_t -> int
	= "camlidl_var_ap_var_compare"

(** Conversion to string *)
external ap_var_to_string : ap_var_t -> string
	= "camlidl_var_ap_var_to_string"

(** Hash function *)
external ap_var_hash : ap_var_t -> int
	= "camlidl_var_ap_var_hash"


(** Printing function *)
val print : Format.formatter -> t -> unit


(** Initialisation of abstract type operations in C library *)
external set_var_operations : unit -> unit = "camlidl_apron_set_var_operations"

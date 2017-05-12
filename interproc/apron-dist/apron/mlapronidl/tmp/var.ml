(* File generated from var.idl *)

type ap_var_t

(** APRON Variables *)

external ap_var_of_string : string -> ap_var_t
	= "camlidl_var_ap_var_of_string"

external ap_var_compare : ap_var_t -> ap_var_t -> int
	= "camlidl_var_ap_var_compare"

external ap_var_to_string : ap_var_t -> string
	= "camlidl_var_ap_var_to_string"

external ap_var_hash : ap_var_t -> int
	= "camlidl_var_ap_var_hash"


let print fmt v = Format.pp_print_string fmt (to_string v)


(** Initialisation of abstract type operations in C library *)
external set_var_operations : unit -> unit = "camlidl_apron_set_var_operations"

let _ = set_var_operations ()


(* File generated from linexpr0.idl *)

type ap_linexpr0_ptr

(** APRON Linear expressions of level 0 *)

(** Create a linear expression. Its representation is sparse if [None] is provided, dense of size [size] if [Some size] is provided. *)
external ap_linexpr0_make : int option -> ap_linexpr0_ptr
	= "camlidl_linexpr0_ap_linexpr0_make"


val of_list : int option -> (Coeff.t * Dim.t) list -> Coeff.t option -> t
(** Combines {!make} and {!set_list} (see below) *)
val of_array : int option -> (Coeff.t * Dim.t) array -> Coeff.t option -> t
(** Combines {!make} and {!set_array} (see below) *)

(** In case of sparse representation, remove zero coefficients *)
external ap_linexpr0_minimize : ap_linexpr0_ptr -> unit
	= "camlidl_linexpr0_ap_linexpr0_minimize"

(** Copy *)
external ap_linexpr0_copy : ap_linexpr0_ptr -> ap_linexpr0_ptr
	= "camlidl_linexpr0_ap_linexpr0_copy"

(** Comparison with lexicographic ordering using Coeff.cmp, terminating by constant *)
external ap_linexpr0_compare : ap_linexpr0_ptr -> ap_linexpr0_ptr -> int
	= "camlidl_linexpr0_ap_linexpr0_compare"

(** Hashing function *)
external ap_linexpr0_hash : ap_linexpr0_ptr -> int
	= "camlidl_linexpr0_ap_linexpr0_hash"

(** Get the size of the linear expression (which may be sparse or dense) *)
external ap_linexpr0_get_size : ap_linexpr0_ptr -> int
	= "camlidl_linexpr0_ap_linexpr0_get_size"

(** Get the constant *)
external ap_linexpr0_get_cst : ap_linexpr0_ptr -> Coeff.ap_coeff_t
	= "camlidl_linexpr0_ap_linexpr0_get_cst"

(** Get the coefficient corresponding to the dimension *)
external ap_linexpr0_get_coeff : ap_linexpr0_ptr -> int -> Coeff.ap_coeff_t
	= "camlidl_linexpr0_ap_linexpr0_get_coeff"


val set_list : t -> (Coeff.t * Dim.t) list -> Coeff.t option -> unit
(** Set simultaneously a number of coefficients.

[set_list expr [(c1,1); (c2,2)] (Some cst)] assigns coefficients [c1] 
to dimension 1, coefficient [c2] to dimension 2, and coefficient [cst]
to the constant. If [(Some cst)] is replaced by [None],
the constant coefficient is not assigned. *)
val set_array : t -> (Coeff.t * Dim.t) array -> Coeff.t option -> unit
(** Set simultaneously a number of coefficients, as [set_list]. *)

(** Set the constant *)
external ap_linexpr0_set_cst : ap_linexpr0_ptr -> Coeff.ap_coeff_t -> unit
	= "camlidl_linexpr0_ap_linexpr0_set_cst"

(** Set the coefficient corresponding to the dimension *)
external ap_linexpr0_set_coeff : ap_linexpr0_ptr -> int -> Coeff.ap_coeff_t -> unit
	= "camlidl_linexpr0_ap_linexpr0_set_coeff"

(** Iter the function on the pairs coefficient/dimension of the linear expression *)

external ap_linexpr0_iter: (Coeff.t -> Dim.t -> unit) -> ap_linexpr0_ptr -> unit = "camlidl_expr0_linexpr0_iter"
 

(** Print a linear expression, using a function converting from dimensions to names *)
val print : (Dim.t -> string) -> Format.formatter -> ap_linexpr0_ptr -> unit


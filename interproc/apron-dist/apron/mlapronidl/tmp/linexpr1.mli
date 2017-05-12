(* File generated from linexpr1.idl *)

type ap_linexpr1_t = {
  mutable_linexpr0: Linexpr0.ap_linexpr0_ptr;
  mutable_env: Environment.ap_environment_ptr;
}

(** APRON Expressions of level 1 *)


(** Build a linear expression defined on the given argument, which is sparse by
default. *)
val make: ?sparse:bool -> Environment.ap_environment_ptr -> t

(** In case of sparse representation, remove zero coefficients  *)
val minimize: t -> unit

(** Copy *)
val copy: t -> t

(** Print the linear expression *)
val print: Format.formatter -> t -> unit

val set_list : t -> (Coeff.t * Var.t) list -> Coeff.t option -> unit
(** Set simultaneously a number of coefficients.

[set_list expr [(c1,"x"); (c2,"y")] (Some cst)] assigns coefficients [c1] 
to variable ["x"], coefficient [c2] to variable ["y"], and coefficient [cst]
to the constant. If [(Some cst)] is replaced by [None],
the constant coefficient is not assigned. *)
val set_array : t -> (Coeff.t * Var.t) array -> Coeff.t option -> unit
(** Set simultaneously a number of coefficients, as [set_list]. *)

(** Iter the function on the pair coefficient/variable of the linear expression *)
val iter: (Coeff.t -> Var.t -> unit) -> t -> unit

(** Get the constant *)
val get_cst: t -> Coeff.t

(** Set the constant *)
val set_cst: t -> Coeff.t -> unit

(** Get the coefficient of the variable *)
external ap_linexpr1_get_coeff : ap_linexpr1_t -> Var.ap_var_t -> Coeff.ap_coeff_t
	= "camlidl_linexpr1_ap_linexpr1_get_coeff"

(** Set the coefficient of the variable *)
external ap_linexpr1_set_coeff : ap_linexpr1_t -> Var.ap_var_t -> Coeff.ap_coeff_t -> unit
	= "camlidl_linexpr1_ap_linexpr1_set_coeff"

(** Change the environment of the expression for a super-environment. Raise [Failure] if it is not the case *)
external ap_linexpr1_extend_environment : ap_linexpr1_t -> Environment.ap_environment_ptr -> ap_linexpr1_t
	= "camlidl_linexpr1_ap_linexpr1_extend_environment"

(** Side-effet version of the previous function *)
external ap_linexpr1_extend_environment_with : ap_linexpr1_t -> Environment.ap_environment_ptr -> unit
	= "camlidl_linexpr1_ap_linexpr1_extend_environment_with"

(** Does the linear expression depend only on integer variables ? *)
external ap_linexpr1_is_integer : ap_linexpr1_t -> bool
	= "camlidl_linexpr1_ap_linexpr1_is_integer"

(** Does the linear expression depend only on real variables ? *)
external ap_linexpr1_is_real : ap_linexpr1_t -> bool
	= "camlidl_linexpr1_ap_linexpr1_is_real"


(** Get the underlying expression of level 0 (which is not a copy). *)
val get_linexpr0: t -> Linexpr0.t

(** Get the environment of the expression *)
val get_env: t -> Environment.t



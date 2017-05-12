(* File generated from environment.idl *)

type typvar =
  | AP_INT
  | AP_REAL
and ap_environment_ptr

(** APRON Environments binding dimensions to names *)

(** Making an environment from a set of integer and real variables. Raise [Failure] in case of name conflict. *)
external ap_environment_make : Var.ap_var_t array -> Var.ap_var_t array -> ap_environment_ptr
	= "camlidl_environment_ap_environment_make"


(** Adding to an environment a set of integer and real variables. Raise [Failure] in case of name conflict. *)
external ap_environment_add : ap_environment_ptr -> Var.ap_var_t array -> Var.ap_var_t array -> ap_environment_ptr
	= "camlidl_environment_ap_environment_add"


(** Remove from an environment a set of variables. Raise [Failure] in case of non-existing variables. *)
external ap_environment_remove : ap_environment_ptr -> Var.ap_var_t array -> ap_environment_ptr
	= "camlidl_environment_ap_environment_remove"


(** Renaming in an environment a set of variables. Raise [Failure] in case of interferences with the variables that are not renamed. *)
external ap_environment_rename : ap_environment_ptr -> Var.ap_var_t array -> Var.ap_var_t array -> ap_environment_ptr
	= "camlidl_environment_ap_environment_rename"


(** Similar to previous function, but returns also 
the permutation on dimensions induced by the renaming. *)
external ap_environment_rename_perm : ap_environment_ptr -> Var.ap_var_t array -> Var.ap_var_t array -> ap_environment_ptr * Dim.ap_dimperm_t
	= "camlidl_environment_ap_environment_rename_perm"



(** Compute the least common environment of 2 environment, 
that is, the environment composed of all the variables 
of the 2 environments.
Raise [Failure] if the same variable has different types 
in the 2 environment.*)
external ap_environment_lce : ap_environment_ptr -> ap_environment_ptr -> ap_environment_ptr
	= "camlidl_environment_ap_environment_lce"



(** Similar to the previous function, but returns also the transformations 
required to convert from [e1] (resp. [e2]) 
to the lce. If [None] is returned, this means 
that [e1] (resp. [e2]) is identic to the lce.*)
external ap_environment_lce_change : ap_environment_ptr -> ap_environment_ptr -> ap_environment_ptr * Dim.ap_dimchange_t option * Dim.ap_dimchange_t option
	= "camlidl_environment_ap_environment_lce_change"



(** [dimchange e1 e2] computes the transformation for 
converting from an environment [e1] to a superenvironment 
[e2]. Raises [Failure] if [e2] is not a superenvironment.*)
external ap_environment_dimchange : ap_environment_ptr -> ap_environment_ptr -> Dim.ap_dimchange_t
	= "camlidl_environment_ap_environment_dimchange"



(** [dimchange2 e1 e2] computes the transformation for 
 converting from an environment [e1] to a (compatible) environment 
 [e2], by first adding (some) variables of [e2] and then removing 
(some) variables of [e1]. Raises [Failure] if the two environments 
are incompatible.
*)
external ap_environment_dimchange2 : ap_environment_ptr -> ap_environment_ptr -> Dim.ap_dimchange2_t
	= "camlidl_environment_ap_environment_dimchange2"


(** Test equality if two environments *)
external ap_environment_equal : ap_environment_ptr -> ap_environment_ptr -> bool
	= "camlidl_environment_ap_environment_equal"


(** Compare two environment. [compare env1 env2] return [-2] if the environments are not compatible (a variable has different types in the 2 environments), [-1] if [env1] is a subset of env2, [0] if equality,  [+1] if env1 is a superset of env2, and [+2] otherwise (the lce exists and is a strict superset of both) *)
external ap_environment_compare : ap_environment_ptr -> ap_environment_ptr -> int
	= "camlidl_environment_ap_environment_compare"


(** Hashing function for environments *)
external ap_environment_hash : ap_environment_ptr -> int
	= "camlidl_environment_ap_environment_hash"


(** Return the dimension of the environment *)
external ap_environment_dimension : ap_environment_ptr -> Dim.ap_dimension_t
	= "camlidl_environment_ap_environment_dimension"


(** Return the size of the environment *)
external ap_environment_size : ap_environment_ptr -> int
	= "camlidl_environment_ap_environment_size"


(** Return true if the variable is present in the environment. *)
external ap_environment_mem_var : ap_environment_ptr -> Var.ap_var_t -> bool
	= "camlidl_environment_ap_environment_mem_var"


(** Return the type of variables in the environment. If the variable does not belong to the environment, raise a [Failure] exception. *)
external ap_environment_typ_of_var : ap_environment_ptr -> Var.ap_var_t -> typvar
	= "camlidl_environment_ap_environment_typ_of_var"


(** Return the (lexicographically ordered) sets of integer and real variables in the environment *)
external ap_environment_vars : ap_environment_ptr -> Var.ap_var_t array * Var.ap_var_t array
	= "camlidl_environment_ap_environment_vars"


(** Return the variable corresponding to the given dimension in the environment. Raise [Failure] is the dimension is out of the range of the environment (greater than or equal to [dim env]) *)
external ap_environment_var_of_dim : ap_environment_ptr -> Dim.ap_dim_t -> Var.ap_var_t
	= "camlidl_environment_ap_environment_var_of_dim"


(** Return the dimension associated to the given variable in the environment. Raise [Failure] if the variable does not belong to the environment. *)
external ap_environment_dim_of_var : ap_environment_ptr -> Var.ap_var_t -> Dim.ap_dim_t
	= "camlidl_environment_ap_environment_dim_of_var"


(** Printing *)
val print :
?first:(unit, Format.formatter, unit) format ->
?sep:(unit, Format.formatter, unit) format ->
?last:(unit, Format.formatter, unit) format ->
Format.formatter -> t -> unit


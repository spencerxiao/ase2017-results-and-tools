(* File generated from tcons1.idl *)

type ap_tcons1_t = {
  mutable_tcons0: Tcons0.ap_tcons0_t;
  mutable_env: Environment.ap_environment_ptr;
}
and ap_tcons1_array_t = {
  mutable_tcons0_array: Tcons0.ap_tcons0_array_t;
  mutable_array_env: Environment.ap_environment_ptr;
}

(** APRON tree constraints and array of tree constraints of level 1 *)

type typ = Lincons0.typ =
| EQ
| SUPEQ
| SUP
| DISEQ
| EQMOD of Scalar.t


(** Make a tree expression constraint. Modifying later the linear expression ({e not
advisable}) modifies correspondingly the tree expression constraint and conversely,
except for changes of environments *)
val make: Texpr1.t -> typ -> t

(** Copy (deep copy) *)
val copy: t -> t

(** Convert a constraint type to a string ([=],[>=], or [>]) *)
val string_of_typ : typ -> string

(** Print the tree expression constraint *)
val print : Format.formatter -> t -> unit

(** Get the constraint type *)
val get_typ: t -> typ

(** Set the constraint type *)
val set_typ: t -> typ -> unit


(** Change the environment of the constraint for a super-environment. Raise [Failure] if it is not the case *)
external ap_tcons1_extend_environment : ap_tcons1_t -> Environment.ap_environment_ptr -> ap_tcons1_t
	= "camlidl_tcons1_ap_tcons1_extend_environment"

(** Side-effect version of the previous function *)
external ap_tcons1_extend_environment_with : ap_tcons1_t -> Environment.ap_environment_ptr -> unit
	= "camlidl_tcons1_ap_tcons1_extend_environment_with"


(** Get the environment of the tree expression constraint *)
val get_env: t -> Environment.t

(** Get the underlying linear expression. Modifying the linear expression ({e
not advisable}) modifies correspondingly the tree expression constraint and
conversely, except for changes of environments *)
val get_texpr1: t -> Texpr1.t

(** Get the underlying tree expression constraint of level 0. Modifying the constraint
of level 0 ({e not advisable}) modifies correspondingly the tree expression constraint
and conversely, except for changes of environments*)
val get_tcons0: t -> Tcons0.t


(* ====================================================================== *)
(** {2 Type array} *)
(* ====================================================================== *)

(** Make an array of tree expression constraints with the given size and defined on the
given environment. The elements are initialized with the constraint 0=0. *)
val array_make : Environment.t -> int -> earray

(** Print an array of constraints *)
val array_print :
?first:(unit, Format.formatter, unit) format ->
?sep:(unit, Format.formatter, unit) format ->
?last:(unit, Format.formatter, unit) format ->
Format.formatter -> earray -> unit

(** Get the size of the array *)
val array_length : earray -> int

(** Get the environment of the array *)
val array_get_env : earray -> Environment.t

(** Get the element of the given index (which is not a copy) *)
val array_get : earray -> int -> t

(** Set the element of the given index (without any copy). The array and the
constraint should be defined on the same environment; otherwise a [Failure]
exception is raised.*)
val array_set : earray -> int -> t -> unit

(** Change the environment of the array of constraints for a super-environment. Raise [Failure] if it is not the case*)
external ap_tcons1_array_extend_environment : ap_tcons1_array_t -> Environment.ap_environment_ptr -> ap_tcons1_array_t
	= "camlidl_tcons1_ap_tcons1_array_extend_environment"

(** Side-effect version of the previous function *)
external ap_tcons1_array_extend_environment_with : ap_tcons1_array_t -> Environment.ap_environment_ptr -> unit
	= "camlidl_tcons1_ap_tcons1_array_extend_environment_with"


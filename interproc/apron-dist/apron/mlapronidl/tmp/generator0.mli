(* File generated from generator0.idl *)

type gentyp =
  | LINE
  | RAY
  | VERTEX
  | LINEMOD
  | RAYMOD
and ap_generator0_t = {
  mutable_linexpr0: Linexpr0.ap_linexpr0_ptr;
  mutable_typ: gentyp;
}
and ap_generator0_array_t = ap_generator0_t array

(** APRON Generators of level 0 *)

(** Making a generator. The constant coefficient of the linear expression is
ignored. Modifying later the linear expression modifies correspondingly the
generator and conversely. *)
val make : Linexpr0.t -> typ -> t

(** Copy a generator (deep copy) *)
val copy : t -> t

(** Convert a generator type to a string ([LIN],[RAY], or [VTX]) *)
val string_of_typ : typ -> string

(** Print a generator *)
val print : (Dim.t -> string) -> Format.formatter -> t -> unit


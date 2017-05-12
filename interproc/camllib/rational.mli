(** Rational numbers *)

val gcd : int -> int -> int

type t = {
  num : int;
  den : int
}

val make : int -> int -> t

val inv : t -> t
val neg : t -> t
val add : t -> t -> t
val sub : t -> t -> t
val mul : t -> t -> t
val div : t -> t -> t

val to_string : t -> string
val print : Format.formatter -> t -> unit


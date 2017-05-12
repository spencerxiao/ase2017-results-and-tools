
(* This file is part of the MLGmpIDL interface, released under LGPL license with an exception allowing the redistribution of statically linked executables.
  Please read the COPYING file packaged in the distribution  *)(* File generated from mpq.idl *)

type 'a tt


(** GMP multi-precision rationals *)



type m (** Mutable tag *)
type f (** Functional (immutable) tag *)
type t = m tt (** Mutable multi-precision rationals *)

(** The following operations are mapped as much as possible to their C counterpart. In case of imperative functions (like [set], [add], ...) the first parameter of type [t] is an out-parameter and holds the result when the function returns. For instance, [add x y z] adds the values of [y] and [z] and stores the result in [x].

 These functions are as efficient as their C counterpart: they do not imply additional memory allocation, unlike the corresponding functions in the module {!Mpqf}. *)


external canonicalize : 'a tt -> unit
	= "camlidl_mpq_mpq_canonicalize"


(** {2 Pretty printing} *)

val print : Format.formatter -> 'a tt -> unit

(** {2 Initialization and Assignment Functions} *)
(** {{:http://gmplib.org/manual/Initializing-Rationals.html#Initializing-Rationals}C documentation} *)

external init : unit -> 'a tt
	= "camlidl_mpq_mpq_init"

external set : t -> 'a tt -> unit
	= "camlidl_mpq_mpq_set"

external set_z : t -> 'a Mpz.tt -> unit
	= "camlidl_mpq_mpq_set_z"

external set_si : t -> int -> int -> unit
	= "camlidl_mpq_mpq_set_si"

external _set_str : t -> string -> int -> unit
	= "camlidl_mpq_mpq__set_str"

val set_str : t -> string -> base:int -> unit
external swap : t -> t -> unit
	= "camlidl_mpq_mpq_swap"

(** {2 Additional Initialization and Assignements functions} *)

(** These functions are additions to or renaming of functions offered by the C library. *)

val init_set : 'a tt -> 'b tt
val init_set_z : 'a Mpz.tt -> 'b tt
val init_set_si : int -> int -> 'a tt
val init_set_str : string -> base:int -> 'a tt
val init_set_d : float -> 'a tt

(** {2 Conversion Functions} *)
(** {{:http://gmplib.org/manual/Rational-Conversions.html#Rational-Conversions}C documentation} *)

external get_d : 'a tt -> float
	= "camlidl_mpq_mpq_get_d"

external set_d : t -> float -> unit
	= "camlidl_mpq_mpq_set_d"


(* Replace Mpz.set_q: Mpz.t -> Mpq.t -> unit *)
external get_z : Mpz.t -> 'a tt -> unit
	= "camlidl_mpq_mpq_get_z"


(* For set_f: t -> Mpf.t -> unit, see Mpf.get_q *)


external _get_str : int -> 'a tt -> string
	= "camlidl_mpq_mpq__get_str"

val get_str : base:int -> t -> string

(** {2 User Conversions} *)

(** These functionss are additions to or renaming of functions offeered by the C library. *)

val to_string : 'a tt -> string
val to_float : 'a tt -> float
val of_string : string -> 'a tt
val of_float : float -> 'a tt
val of_int : int -> 'a tt
val of_frac : int -> int -> 'a tt
val of_mpz : 'a Mpz.tt -> 'b tt
val of_mpz2 : 'a Mpz.tt -> 'b Mpz.tt -> 'c tt

(** {2 Arithmetic Functions} *)
(** {{:http://gmplib.org/manual/Rational-Arithmetic.html#Rational-Arithmetic}C documentation} *)

external add : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpq_mpq_add"

external sub : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpq_mpq_sub"

external mul : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpq_mpq_mul"

external mul_2exp : t -> 'a tt -> int -> unit
	= "camlidl_mpq_mpq_mul_2exp"

external div : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpq_mpq_div"

external div_2exp : t -> 'a tt -> int -> unit
	= "camlidl_mpq_mpq_div_2exp"

external neg : t -> 'a tt -> unit
	= "camlidl_mpq_mpq_neg"

external abs : t -> 'a tt -> unit
	= "camlidl_mpq_mpq_abs"

external inv : t -> 'a tt -> unit
	= "camlidl_mpq_mpq_inv"


(** {2 Comparison Functions} *)
(** {{:http://gmplib.org/manual/Comparing-Rationals.html#Comparing-Rationals}C documentation} *)

external cmp : 'a tt -> 'b tt -> int
	= "camlidl_mpq_mpq_cmp"

external cmp_si : 'a tt -> int -> int -> int
	= "camlidl_mpq_mpq_cmp_si"

external sgn : 'a tt -> int
	= "camlidl_mpq_mpq_sgn"

external equal : 'a tt -> 'b tt -> bool
	= "camlidl_mpq_mpq_equal"


(** {2 Applying Integer Functions to Rationals} *)
(** {{:http://gmplib.org/manual/Applying-Integer-Functions.html#Applying-Integer-Functions}C documentation} *)

external get_num : Mpz.t -> 'a tt -> unit
	= "camlidl_mpq_mpq_get_num"

external get_den : Mpz.t -> 'a tt -> unit
	= "camlidl_mpq_mpq_get_den"

external set_num : t -> 'a Mpz.tt -> unit
	= "camlidl_mpq_mpq_set_num"

external set_den : t -> 'a Mpz.tt -> unit
	= "camlidl_mpq_mpq_set_den"


(** {2 Input and Output Functions: not interfaced} *)


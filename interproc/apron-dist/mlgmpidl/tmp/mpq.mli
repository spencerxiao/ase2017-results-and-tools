(* File generated from mpq.idl *)

type mpq_ptr
and mpq_ptrm

(** GMP multi-precision rationals *)



type m (** Mutable tag *)
type f (** Functional (immutable) tag *)
type t = m tt (** Mutable multi-precision rationals *)

(** The following operations are mapped as much as possible to their C counterpart. In case of imperative functions (like [set], [add], ...) the first parameter of type [t] is an out-parameter and holds the result when the function returns. For instance, [add x y z] adds the values of [y] and [z] and stores the result in [x].

 These functions are as efficient as their C counterpart: they do not imply additional memory allocation, unlike the corresponding functions in the module {!Mpqf}. *)


external mpq_canonicalize : mpq_ptr -> unit
	= "camlidl_mpq_mpq_canonicalize"


(** {2 Pretty printing} *)

val print : Format.formatter -> 'a tt -> unit

(** {2 Initialization and Assignment Functions} *)
(** {{:http://gmplib.org/manual/Initializing-Rationals.html#Initializing-Rationals}C documentation} *)

external mpq_init : unit -> mpq_ptr
	= "camlidl_mpq_mpq_init"

external mpq_set : mpq_ptrm -> mpq_ptr -> unit
	= "camlidl_mpq_mpq_set"

external mpq_set_z : mpq_ptrm -> Mpz.mpz_ptr -> unit
	= "camlidl_mpq_mpq_set_z"

external mpq_set_si : mpq_ptrm -> int -> int -> unit
	= "camlidl_mpq_mpq_set_si"

external mpq__set_str : mpq_ptrm -> string -> int -> unit
	= "camlidl_mpq_mpq__set_str"

val set_str : t -> string -> base:int -> unit
external mpq_swap : mpq_ptrm -> mpq_ptrm -> unit
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

external mpq_get_d : mpq_ptr -> float
	= "camlidl_mpq_mpq_get_d"

external mpq_set_d : mpq_ptrm -> float -> unit
	= "camlidl_mpq_mpq_set_d"


(* Replace Mpz.set_q: Mpz.t -> Mpq.t -> unit *)
external mpq_get_z : Mpz.mpz_ptrm -> mpq_ptr -> unit
	= "camlidl_mpq_mpq_get_z"


(* For set_f: t -> Mpf.t -> unit, see Mpf.get_q *)


external mpq__get_str : int -> mpq_ptr -> string
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

external mpq_add : mpq_ptrm -> mpq_ptr -> mpq_ptr -> unit
	= "camlidl_mpq_mpq_add"

external mpq_sub : mpq_ptrm -> mpq_ptr -> mpq_ptr -> unit
	= "camlidl_mpq_mpq_sub"

external mpq_mul : mpq_ptrm -> mpq_ptr -> mpq_ptr -> unit
	= "camlidl_mpq_mpq_mul"

external mpq_mul_2exp : mpq_ptrm -> mpq_ptr -> int -> unit
	= "camlidl_mpq_mpq_mul_2exp"

external mpq_div : mpq_ptrm -> mpq_ptr -> mpq_ptr -> unit
	= "camlidl_mpq_mpq_div"

external mpq_div_2exp : mpq_ptrm -> mpq_ptr -> int -> unit
	= "camlidl_mpq_mpq_div_2exp"

external mpq_neg : mpq_ptrm -> mpq_ptr -> unit
	= "camlidl_mpq_mpq_neg"

external mpq_abs : mpq_ptrm -> mpq_ptr -> unit
	= "camlidl_mpq_mpq_abs"

external mpq_inv : mpq_ptrm -> mpq_ptr -> unit
	= "camlidl_mpq_mpq_inv"


(** {2 Comparison Functions} *)
(** {{:http://gmplib.org/manual/Comparing-Rationals.html#Comparing-Rationals}C documentation} *)

external mpq_cmp : mpq_ptr -> mpq_ptr -> int
	= "camlidl_mpq_mpq_cmp"

external mpq_cmp_si : mpq_ptr -> int -> int -> int
	= "camlidl_mpq_mpq_cmp_si"

external mpq_sgn : mpq_ptr -> int
	= "camlidl_mpq_mpq_sgn"

external mpq_equal : mpq_ptr -> mpq_ptr -> bool
	= "camlidl_mpq_mpq_equal"


(** {2 Applying Integer Functions to Rationals} *)
(** {{:http://gmplib.org/manual/Applying-Integer-Functions.html#Applying-Integer-Functions}C documentation} *)

external mpq_get_num : Mpz.mpz_ptrm -> mpq_ptr -> unit
	= "camlidl_mpq_mpq_get_num"

external mpq_get_den : Mpz.mpz_ptrm -> mpq_ptr -> unit
	= "camlidl_mpq_mpq_get_den"

external mpq_set_num : mpq_ptrm -> Mpz.mpz_ptr -> unit
	= "camlidl_mpq_mpq_set_num"

external mpq_set_den : mpq_ptrm -> Mpz.mpz_ptr -> unit
	= "camlidl_mpq_mpq_set_den"


(** {2 Input and Output Functions: not interfaced} *)


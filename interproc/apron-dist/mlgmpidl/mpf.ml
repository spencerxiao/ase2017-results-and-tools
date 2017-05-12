
(* This file is part of the MLGmpIDL interface, released under LGPL license with an exception allowing the redistribution of statically linked executables.
  Please read the COPYING file packaged in the distribution  *)(* File generated from mpf.idl *)

type 'a tt


(** GMP multi-precision floating-point numbers *)



type m (** Mutable tag *)
type f (** Functional (immutable) tag *)
type t = m tt (** Mutable multi-precision floating-point numbers *)

(** The following operations are mapped as much as possible to their C counterpart. In case of imperative functions (like [set], [add], ...) the first parameter of type [t] is an out-parameter and holds the result when the function returns. For instance, [add x y z] adds the values of [y] and [z] and stores the result in [x].

 These functions are as efficient as their C counterpart: they do not imply additional memory allocation. *)



(** {2 Initialization Functions} *)
(** {{:http://gmplib.org/manual/Initializing-Floats.html#Initializing-Floats}C documentation} *)

external set_default_prec : int -> unit
	= "camlidl_mpf_mpf_set_default_prec"

external get_default_prec : unit -> int
	= "camlidl_mpf_mpf_get_default_prec"

external init : unit -> 'a tt
	= "camlidl_mpf_mpf_init"

external init2 : int -> 'a tt
	= "camlidl_mpf_mpf_init2"

external get_prec : 'a tt -> int
	= "camlidl_mpf_mpf_get_prec"

external set_prec : t -> int -> unit
	= "camlidl_mpf_mpf_set_prec"

external set_prec_raw : t -> int -> unit
	= "camlidl_mpf_mpf_set_prec_raw"


(** {2 Assignement Functions} *)
(** {{:http://gmplib.org/manual/Assigning-Floats.html#Assigning-Floats}C documentation} *)

external set : t -> 'a tt -> unit
	= "camlidl_mpf_mpf_set"

external set_si : t -> int -> unit
	= "camlidl_mpf_mpf_set_si"

external set_d : t -> float -> unit
	= "camlidl_mpf_mpf_set_d"

external set_z : t -> 'a Mpz.tt -> unit
	= "camlidl_mpf_mpf_set_z"

external set_q : t -> 'a Mpq.tt -> unit
	= "camlidl_mpf_mpf_set_q"

external _set_str : t -> string -> int -> unit
	= "camlidl_mpf_mpf__set_str"

let set_str a b ~base = _set_str a b base
external swap : t -> t -> unit
	= "camlidl_mpf_mpf_swap"


(** {2 Combined Initialization and Assignement Functions} *)
(** {{:http://gmplib.org/manual/Simultaneous-Float-Init-_0026-Assign.html#Simultaneous-Float-Init-_0026-Assign}C documentation} *)

external init_set : 'a tt -> 'b tt
	= "camlidl_mpf_mpf_init_set"

external init_set_si : int -> 'a tt
	= "camlidl_mpf_mpf_init_set_si"

external init_set_d : float -> 'a tt
	= "camlidl_mpf_mpf_init_set_d"

external _init_set_str : string -> int -> 'a tt
	= "camlidl_mpf_mpf__init_set_str"

let init_set_str a ~base = _init_set_str a base

(** {2 Conversion Functions} *)
(** {{:http://gmplib.org/manual/Converting-Floats.html#Converting-Floats}C documentation} *)

external get_d : 'a tt -> float
	= "camlidl_mpf_mpf_get_d"

external get_d_2exp : 'a tt -> float * int
	= "camlidl_mpf_mpf_get_d_2exp"

external get_si : 'a tt -> nativeint
	= "camlidl_mpf_mpf_get_si"

external get_int : 'a tt -> int
	= "camlidl_mpf_mpf_get_int"

external get_z : Mpz.t -> 'a tt -> unit
	= "camlidl_mpf_mpf_get_z"

external get_q : Mpq.t -> 'a tt -> unit
	= "camlidl_mpf_mpf_get_q"

external _get_str : int -> int -> 'a tt -> string * int
	= "camlidl_mpf_mpf__get_str"

let get_str ~base ~digits a = _get_str base digits a

(** {2 Arithmetic Functions} *)
(** {{:http://gmplib.org/manual/Float-Arithmetic.html#Float-Arithmetic}C documentation} *)

external add : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpf_mpf_add"

external add_ui : t -> 'a tt -> int -> unit
	= "camlidl_mpf_mpf_add_ui"

external sub : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpf_mpf_sub"

external ui_sub : t -> int -> 'a tt -> unit
	= "camlidl_mpf_mpf_ui_sub"

external sub_ui : t -> 'a tt -> int -> unit
	= "camlidl_mpf_mpf_sub_ui"

external mul : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpf_mpf_mul"

external mul_ui : t -> 'a tt -> int -> unit
	= "camlidl_mpf_mpf_mul_ui"

external mul_2exp : t -> 'a tt -> int -> unit
	= "camlidl_mpf_mpf_mul_2exp"

external div : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpf_mpf_div"

external ui_div : t -> int -> 'a tt -> unit
	= "camlidl_mpf_mpf_ui_div"

external div_ui : t -> 'a tt -> int -> unit
	= "camlidl_mpf_mpf_div_ui"

external div_2exp : t -> 'a tt -> int -> unit
	= "camlidl_mpf_mpf_div_2exp"

external sqrt : t -> 'a tt -> unit
	= "camlidl_mpf_mpf_sqrt"

external pow_ui : t -> 'a tt -> int -> unit
	= "camlidl_mpf_mpf_pow_ui"

external neg : t -> 'a tt -> unit
	= "camlidl_mpf_mpf_neg"

external abs : t -> 'a tt -> unit
	= "camlidl_mpf_mpf_abs"


(** {2 Comparison Functions} *)
(** {{:http://gmplib.org/manual/Float-Comparison.html#Float-Comparison}C documentation} *)

external cmp : 'a tt -> 'b tt -> int
	= "camlidl_mpf_mpf_cmp"

external cmp_d : 'a tt -> float -> int
	= "camlidl_mpf_mpf_cmp_d"

external cmp_si : 'a tt -> int -> int
	= "camlidl_mpf_mpf_cmp_si"

external sgn : 'a tt -> int
	= "camlidl_mpf_mpf_sgn"

external _equal : 'a tt -> 'b tt -> int -> bool
	= "camlidl_mpf_mpf__equal"

let equal a b ~bits = _equal a b bits
external reldiff : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpf_mpf_reldiff"


(** {2 Input and Output Functions: not interfaced} *)


(** {2 Random Number Functions: see {!Gmp_random} module} *)


(** {2 Miscellaneous Float Functions} *)
(** {{:http://gmplib.org/manual/Miscellaneous-Float-Functions.html#Miscellaneous-Float-Functions}C documentation} *)

external ceil : t -> 'a tt -> unit
	= "camlidl_mpf_mpf_ceil"

external floor : t -> 'a tt -> unit
	= "camlidl_mpf_mpf_floor"

external trunc : t -> 'a tt -> unit
	= "camlidl_mpf_mpf_trunc"

external integer_p : 'a tt -> bool
	= "camlidl_mpf_mpf_integer_p"

external fits_int_p : 'a tt -> bool
	= "camlidl_mpf_mpf_fits_int_p"

external fits_ulong_p : 'a tt -> bool
	= "camlidl_mpf_mpf_fits_ulong_p"

external fits_slong_p : 'a tt -> bool
	= "camlidl_mpf_mpf_fits_slong_p"

external fits_uint_p : 'a tt -> bool
	= "camlidl_mpf_mpf_fits_uint_p"

external fits_sint_p : 'a tt -> bool
	= "camlidl_mpf_mpf_fits_sint_p"

external fits_ushort_p : 'a tt -> bool
	= "camlidl_mpf_mpf_fits_ushort_p"

external fits_sshort_p : 'a tt -> bool
	= "camlidl_mpf_mpf_fits_sshort_p"


(** {2 Additional functions} *)

let to_string x = 
let (s,e) = get_str ~base:10 ~digits:0 x in 
if s="" 
then "0.0" 
else Format.sprintf "0.%se%i" s e 

let to_float = get_d
let of_string str = init_set_str str 10
let of_float = init_set_d
let of_int a = init_set_si a
let (_gen : m tt -> 'a tt) = Obj.magic
let of_mpz x = let res = init() in set_z res x; _gen res
let of_mpq x = let res = init() in set_q res x; _gen res
let is_integer = integer_p

(** {2 Pretty printing} *)

let print fmt x = 
let (s,e) = get_str ~base:10 ~digits:0 x in 
if s="" 
then Format.pp_print_string fmt "0.0" 
else Format.fprintf fmt "0.%se%i" s e 


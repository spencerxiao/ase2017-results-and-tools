
(* This file is part of the MLGmpIDL interface, released under LGPL license with an exception allowing the redistribution of statically linked executables.
  Please read the COPYING file packaged in the distribution  *)(* File generated from mpz.idl *)

type 'a tt


(** GMP multi-precision integers *)



type m (** Mutable tag *)
type f (** Functional (immutable) tag *)
type t = m tt (** Mutable multi-precision integer *)

(** The following operations are mapped as much as possible to their C counterpart. In case of imperative functions (like [set], [add], ...) the first parameter of type [t] is an out-parameter and holds the result when the function returns. For instance, [add x y z] adds the values of [y] and [z] and stores the result in [x].

 These functions are as efficient as their C counterpart: they do not imply additional memory allocation, unlike the corresponding functions in the module {!Mpzf}. *)



(** {2 Initialization Functions} *)
(** {{:http://gmplib.org/manual/Initializing-Integers.html#Initializing-Integers}C documentation} *)

external init : unit -> 'a tt
	= "camlidl_mpz_mpz_init"

external init2 : int -> 'a tt
	= "camlidl_mpz_mpz_init2"

external realloc2 : t -> int -> unit
	= "camlidl_mpz_mpz_realloc2"


(** {2 Assignement Functions} *)
(** {{:http://gmplib.org/manual/Assigning-Integers.html#Assigning-Integers}C documentation} *)


(** The first parameter holds the result. *)

external set : t -> 'a tt -> unit
	= "camlidl_mpz_mpz_set"

external set_si : t -> int -> unit
	= "camlidl_mpz_mpz_set_si"

external set_d : t -> float -> unit
	= "camlidl_mpz_mpz_set_d"

external _set_str : t -> string -> int -> unit
	= "camlidl_mpz_mpz__set_str"

let set_str a b ~base = _set_str a b base
external swap : t -> t -> unit
	= "camlidl_mpz_mpz_swap"


(** {2 Combined Initialization and Assignment Functions} *)
(** {{:http://gmplib.org/manual/Simultaneous-Integer-Init-_0026-Assign.html#Simultaneous-Integer-Init-_0026-Assign}C documentation} *)

external init_set : 'a tt -> 'b tt
	= "camlidl_mpz_mpz_init_set"

external init_set_si : int -> 'a tt
	= "camlidl_mpz_mpz_init_set_si"

external init_set_d : float -> 'a tt
	= "camlidl_mpz_mpz_init_set_d"

external _init_set_str : string -> int -> 'a tt
	= "camlidl_mpz_mpz__init_set_str"

let init_set_str a ~base = _init_set_str a base

(** {2 Conversion Functions} *)
(** {{:http://gmplib.org/manual/Converting-Integers.html#Converting-Integers}C documentation} *)

external get_si : 'a tt -> nativeint
	= "camlidl_mpz_mpz_get_si"

external get_int : 'a tt -> int
	= "camlidl_mpz_mpz_get_int"

external get_d : 'a tt -> float
	= "camlidl_mpz_mpz_get_d"

external get_d_2exp : 'a tt -> float * int
	= "camlidl_mpz_mpz_get_d_2exp"

external _get_str : int -> 'a tt -> string
	= "camlidl_mpz_mpz__get_str"

let get_str ~base a = _get_str base a


(** {2 User Conversions} *)

(** These functions are additions to or renaming of functions offered by the C library. *)

let to_string x = get_str 10 x
let to_float = get_d
let of_string str = init_set_str str 10
let of_float = init_set_d
let of_int = init_set_si

(** {2 Pretty printing} *)

let print fmt x = Format.pp_print_string fmt (get_str 10 x)

(** {2 Arithmetic Functions} *)
(** {{:http://gmplib.org/manual/Integer-Arithmetic.html#Integer-Arithmetic}C documentation} *)

(** The first parameter holds the result. *)

external add : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpz_mpz_add"

external add_ui : t -> 'a tt -> int -> unit
	= "camlidl_mpz_mpz_add_ui"

external sub : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpz_mpz_sub"

external sub_ui : t -> 'a tt -> int -> unit
	= "camlidl_mpz_mpz_sub_ui"

external ui_sub : t -> int -> 'a tt -> unit
	= "camlidl_mpz_mpz_ui_sub"

external mul : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpz_mpz_mul"

external mul_si : t -> 'a tt -> int -> unit
	= "camlidl_mpz_mpz_mul_si"

external addmul : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpz_mpz_addmul"

external addmul_ui : t -> 'a tt -> int -> unit
	= "camlidl_mpz_mpz_addmul_ui"

external submul : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpz_mpz_submul"

external submul_ui : t -> 'a tt -> int -> unit
	= "camlidl_mpz_mpz_submul_ui"

external mul_2exp : t -> 'a tt -> int -> unit
	= "camlidl_mpz_mpz_mul_2exp"

external neg : t -> 'a tt -> unit
	= "camlidl_mpz_mpz_neg"

external abs : t -> 'a tt -> unit
	= "camlidl_mpz_mpz_abs"


(** {2 Division Functions} *)
(** {{:http://gmplib.org/manual/Integer-Division.html#Integer-Division}C documentation} *)

(** [c] stands for ceiling, [f] for floor, and [t] for truncate (rounds toward 0).*)
(** {3 Ceiling division} *)

(** The first parameter holds the quotient. *)
external cdiv_q : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpz_mpz_cdiv_q"

(** The first parameter holds the remainder. *)
external cdiv_r : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpz_mpz_cdiv_r"

(** The two first parameters hold resp. the quotient and the remainder). *)
external cdiv_qr : t -> t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpz_mpz_cdiv_qr"

(** The first parameter holds the quotient. *)
external cdiv_q_ui : t -> 'a tt -> int -> int
	= "camlidl_mpz_mpz_cdiv_q_ui"

(** The first parameter holds the remainder. *)
external cdiv_r_ui : t -> 'a tt -> int -> int
	= "camlidl_mpz_mpz_cdiv_r_ui"

(** The two first parameters hold resp. the quotient and the remainder). *)
external cdiv_qr_ui : t -> t -> 'a tt -> int -> int
	= "camlidl_mpz_mpz_cdiv_qr_ui"

external cdiv_ui : 'a tt -> int -> int
	= "camlidl_mpz_mpz_cdiv_ui"

(** The first parameter holds the quotient. *)
external cdiv_q_2exp : t -> 'a tt -> int -> unit
	= "camlidl_mpz_mpz_cdiv_q_2exp"

(** The first parameter holds the remainder. *)
external cdiv_r_2exp : t -> 'a tt -> int -> unit
	= "camlidl_mpz_mpz_cdiv_r_2exp"

(** {3 Floor division} *)

external fdiv_q : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpz_mpz_fdiv_q"

external fdiv_r : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpz_mpz_fdiv_r"

external fdiv_qr : t -> t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpz_mpz_fdiv_qr"

external fdiv_q_ui : t -> 'a tt -> int -> int
	= "camlidl_mpz_mpz_fdiv_q_ui"

external fdiv_r_ui : t -> 'a tt -> int -> int
	= "camlidl_mpz_mpz_fdiv_r_ui"

external fdiv_qr_ui : t -> t -> 'a tt -> int -> int
	= "camlidl_mpz_mpz_fdiv_qr_ui"

external fdiv_ui : 'a tt -> int -> int
	= "camlidl_mpz_mpz_fdiv_ui"

external fdiv_q_2exp : t -> 'a tt -> int -> unit
	= "camlidl_mpz_mpz_fdiv_q_2exp"

external fdiv_r_2exp : t -> 'a tt -> int -> unit
	= "camlidl_mpz_mpz_fdiv_r_2exp"

(** {3 Truncate division} *)

external tdiv_q : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpz_mpz_tdiv_q"

external tdiv_r : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpz_mpz_tdiv_r"

external tdiv_qr : t -> t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpz_mpz_tdiv_qr"

external tdiv_q_ui : t -> 'a tt -> int -> int
	= "camlidl_mpz_mpz_tdiv_q_ui"

external tdiv_r_ui : t -> 'a tt -> int -> int
	= "camlidl_mpz_mpz_tdiv_r_ui"

external tdiv_qr_ui : t -> t -> 'a tt -> int -> int
	= "camlidl_mpz_mpz_tdiv_qr_ui"

external tdiv_ui : 'a tt -> int -> int
	= "camlidl_mpz_mpz_tdiv_ui"

external tdiv_q_2exp : t -> 'a tt -> int -> unit
	= "camlidl_mpz_mpz_tdiv_q_2exp"

external tdiv_r_2exp : t -> 'a tt -> int -> unit
	= "camlidl_mpz_mpz_tdiv_r_2exp"

(** {3 Other division-related functions} *)

external gmod : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpz_mpz_gmod"

external gmod_ui : t -> 'a tt -> int -> int
	= "camlidl_mpz_mpz_gmod_ui"

external divexact : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpz_mpz_divexact"

external divexact_ui : t -> 'a tt -> int -> unit
	= "camlidl_mpz_mpz_divexact_ui"

external divisible_p : 'a tt -> 'b tt -> bool
	= "camlidl_mpz_mpz_divisible_p"

external divisible_ui_p : 'a tt -> int -> bool
	= "camlidl_mpz_mpz_divisible_ui_p"

external divisible_2exp_p : 'a tt -> int -> bool
	= "camlidl_mpz_mpz_divisible_2exp_p"

external congruent_p : 'a tt -> 'b tt -> 'c tt -> bool
	= "camlidl_mpz_mpz_congruent_p"

external congruent_ui_p : 'a tt -> int -> int -> bool
	= "camlidl_mpz_mpz_congruent_ui_p"

external congruent_2exp_p : 'a tt -> 'b tt -> int -> bool
	= "camlidl_mpz_mpz_congruent_2exp_p"


(** {2 Exponentiation Functions} *)
(** {{:http://gmplib.org/manual/Integer-Exponentiation.html#Integer-Exponentiation}C documentation} *)

external _powm : t -> 'a tt -> 'b tt -> 'c tt -> unit
	= "camlidl_mpz_mpz__powm"

external _powm_ui : t -> 'a tt -> int -> 'b tt -> unit
	= "camlidl_mpz_mpz__powm_ui"

let powm a b c ~modulo = _powm a b c modulo
let powm_ui a b c ~modulo = _powm_ui a b c modulo

external pow_ui : t -> 'a tt -> int -> unit
	= "camlidl_mpz_mpz_pow_ui"

external ui_pow_ui : t -> int -> int -> unit
	= "camlidl_mpz_mpz_ui_pow_ui"


(** {2 Root Extraction Functions} *)
(** {{:http://gmplib.org/manual/Integer-Roots.html#Integer-Roots}C documentation} *)

external root : t -> 'a tt -> int -> bool
	= "camlidl_mpz_mpz_root"

external sqrt : t -> 'a tt -> unit
	= "camlidl_mpz_mpz_sqrt"

external _sqrtrem : t -> t -> 'a tt -> unit
	= "camlidl_mpz_mpz__sqrtrem"

let sqrtrem a ~remainder b = _sqrtrem a remainder b
external perfect_power_p : 'a tt -> bool
	= "camlidl_mpz_mpz_perfect_power_p"

external perfect_square_p : 'a tt -> bool
	= "camlidl_mpz_mpz_perfect_square_p"


(** {2 Number Theoretic  Functions} *)
(** {{:http://gmplib.org/manual/Number-Theoretic-Functions.html#Number-Theoretic-Functions}C documentation} *)

external probab_prime_p : 'a tt -> int -> int
	= "camlidl_mpz_mpz_probab_prime_p"

external nextprime : t -> 'a tt -> unit
	= "camlidl_mpz_mpz_nextprime"

external gcd : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpz_mpz_gcd"

external gcd_ui : t option -> 'a tt -> int -> int
	= "camlidl_mpz_mpz_gcd_ui"

external _gcdext : t -> t -> t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpz_mpz__gcdext"

let gcdext ~gcd ~alpha ~beta a b = _gcdext gcd alpha beta a b
external lcm : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpz_mpz_lcm"

external lcm_ui : t -> 'a tt -> int -> unit
	= "camlidl_mpz_mpz_lcm_ui"

external invert : t -> 'a tt -> 'b tt -> bool
	= "camlidl_mpz_mpz_invert"

external jacobi : 'a tt -> 'b tt -> int
	= "camlidl_mpz_mpz_jacobi"

external legendre : 'a tt -> 'b tt -> int
	= "camlidl_mpz_mpz_legendre"

external kronecker : 'a tt -> 'b tt -> int
	= "camlidl_mpz_mpz_kronecker"

external kronecker_si : 'a tt -> int -> int
	= "camlidl_mpz_mpz_kronecker_si"

external si_kronecker : int -> 'a tt -> int
	= "camlidl_mpz_mpz_si_kronecker"

external remove : t -> 'a tt -> 'b tt -> int
	= "camlidl_mpz_mpz_remove"

external fac_ui : t -> int -> unit
	= "camlidl_mpz_mpz_fac_ui"

external bin_ui : t -> 'a tt -> int -> unit
	= "camlidl_mpz_mpz_bin_ui"

external bin_uiui : t -> int -> int -> unit
	= "camlidl_mpz_mpz_bin_uiui"

external fib_ui : t -> int -> unit
	= "camlidl_mpz_mpz_fib_ui"

external fib2_ui : t -> t -> int -> unit
	= "camlidl_mpz_mpz_fib2_ui"

external lucnum_ui : t -> int -> unit
	= "camlidl_mpz_mpz_lucnum_ui"

external lucnum2_ui : t -> t -> int -> unit
	= "camlidl_mpz_mpz_lucnum2_ui"


(** {2 Comparison Functions} *)
(** {{:http://gmplib.org/manual/Integer-Comparisons.html#Integer-Comparisons}C documentation} *)

external cmp : 'a tt -> 'b tt -> int
	= "camlidl_mpz_mpz_cmp"

external cmp_d : 'a tt -> float -> int
	= "camlidl_mpz_mpz_cmp_d"

external cmp_si : 'a tt -> int -> int
	= "camlidl_mpz_mpz_cmp_si"

external cmpabs : 'a tt -> 'b tt -> int
	= "camlidl_mpz_mpz_cmpabs"

external cmpabs_d : 'a tt -> float -> int
	= "camlidl_mpz_mpz_cmpabs_d"

external cmpabs_ui : 'a tt -> int -> int
	= "camlidl_mpz_mpz_cmpabs_ui"

external sgn : 'a tt -> int
	= "camlidl_mpz_mpz_sgn"


(** {2 Logical and Bit Manipulation Functions} *)
(** {{:http://gmplib.org/manual/Integer-Logic-and-Bit-Fiddling.html#Integer-Logic-and-Bit-Fiddling}C documentation} *)

external gand : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpz_mpz_gand"

external ior : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpz_mpz_ior"

external xor : t -> 'a tt -> 'b tt -> unit
	= "camlidl_mpz_mpz_xor"

external com : t -> 'a tt -> unit
	= "camlidl_mpz_mpz_com"

external popcount : 'a tt -> int
	= "camlidl_mpz_mpz_popcount"

external hamdist : 'a tt -> 'b tt -> int
	= "camlidl_mpz_mpz_hamdist"

external scan0 : 'a tt -> int -> int
	= "camlidl_mpz_mpz_scan0"

external scan1 : 'a tt -> int -> int
	= "camlidl_mpz_mpz_scan1"

external setbit : t -> int -> unit
	= "camlidl_mpz_mpz_setbit"

external clrbit : t -> int -> unit
	= "camlidl_mpz_mpz_clrbit"

external tstbit : 'a tt -> int -> bool
	= "camlidl_mpz_mpz_tstbit"


(** {2 Input and Output Functions: not interfaced} *)


(** {2 Random Number Functions: see {!Gmp_random} module} *)


(** {2 Integer Import and Export Functions} *)
(** {{:ttp://gmplib.org/manual/Integer-Import-and-Export.html#Integer-Import-and-Export}C documentation} *)

external _import : t -> (int, Bigarray.int32_elt, Bigarray.c_layout) Bigarray.Array1.t -> int -> int -> unit
	= "camlidl_mpz_mpz__import"

external _export : 'a tt -> int -> int -> (int, Bigarray.int32_elt, Bigarray.c_layout) Bigarray.Array1.t
	= "camlidl_mpz_mpz__export"

let import ~dest array ~order ~endian = _import dest array order endian
let export x ~order ~endian = _export x order endian


(** {2 Miscellaneous Functions} *)
(** {{:http://gmplib.org/manual/Miscellaneous-Integer-Functions.html#Miscellaneous-Integer-Functions}C documentation} *)

external fits_int_p : 'a tt -> bool
	= "camlidl_mpz_mpz_fits_int_p"

external odd_p : 'a tt -> bool
	= "camlidl_mpz_mpz_odd_p"

external even_p : 'a tt -> bool
	= "camlidl_mpz_mpz_even_p"

external size : 'a tt -> int
	= "camlidl_mpz_mpz_size"

external sizeinbase : 'a tt -> int -> int
	= "camlidl_mpz_mpz_sizeinbase"

external fits_ulong_p : 'a tt -> bool
	= "camlidl_mpz_mpz_fits_ulong_p"

external fits_slong_p : 'a tt -> bool
	= "camlidl_mpz_mpz_fits_slong_p"

external fits_uint_p : 'a tt -> bool
	= "camlidl_mpz_mpz_fits_uint_p"

external fits_sint_p : 'a tt -> bool
	= "camlidl_mpz_mpz_fits_sint_p"

external fits_ushort_p : 'a tt -> bool
	= "camlidl_mpz_mpz_fits_ushort_p"

external fits_sshort_p : 'a tt -> bool
	= "camlidl_mpz_mpz_fits_sshort_p"


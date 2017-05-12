(* File generated from mpz.idl *)

type mpz_ptr
and mpz_ptrm

(** GMP multi-precision integers *)



type m (** Mutable tag *)
type f (** Functional (immutable) tag *)
type t = m tt (** Mutable multi-precision integer *)

(** The following operations are mapped as much as possible to their C counterpart. In case of imperative functions (like [set], [add], ...) the first parameter of type [t] is an out-parameter and holds the result when the function returns. For instance, [add x y z] adds the values of [y] and [z] and stores the result in [x].

 These functions are as efficient as their C counterpart: they do not imply additional memory allocation, unlike the corresponding functions in the module {!Mpzf}. *)



(** {2 Initialization Functions} *)
(** {{:http://gmplib.org/manual/Initializing-Integers.html#Initializing-Integers}C documentation} *)

external mpz_init : unit -> mpz_ptr
	= "camlidl_mpz_mpz_init"

external mpz_init2 : int -> mpz_ptr
	= "camlidl_mpz_mpz_init2"

external mpz_realloc2 : mpz_ptrm -> int -> unit
	= "camlidl_mpz_mpz_realloc2"


(** {2 Assignement Functions} *)
(** {{:http://gmplib.org/manual/Assigning-Integers.html#Assigning-Integers}C documentation} *)


(** The first parameter holds the result. *)

external mpz_set : mpz_ptrm -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_set"

external mpz_set_si : mpz_ptrm -> int -> unit
	= "camlidl_mpz_mpz_set_si"

external mpz_set_d : mpz_ptrm -> float -> unit
	= "camlidl_mpz_mpz_set_d"

external mpz__set_str : mpz_ptrm -> string -> int -> unit
	= "camlidl_mpz_mpz__set_str"

let set_str a b ~base = _set_str a b base
external mpz_swap : mpz_ptrm -> mpz_ptrm -> unit
	= "camlidl_mpz_mpz_swap"


(** {2 Combined Initialization and Assignment Functions} *)
(** {{:http://gmplib.org/manual/Simultaneous-Integer-Init-_0026-Assign.html#Simultaneous-Integer-Init-_0026-Assign}C documentation} *)

external mpz_init_set : mpz_ptr -> mpz_ptr
	= "camlidl_mpz_mpz_init_set"

external mpz_init_set_si : int -> mpz_ptr
	= "camlidl_mpz_mpz_init_set_si"

external mpz_init_set_d : float -> mpz_ptr
	= "camlidl_mpz_mpz_init_set_d"

external mpz__init_set_str : string -> int -> mpz_ptr
	= "camlidl_mpz_mpz__init_set_str"

let init_set_str a ~base = _init_set_str a base

(** {2 Conversion Functions} *)
(** {{:http://gmplib.org/manual/Converting-Integers.html#Converting-Integers}C documentation} *)

external mpz_get_si : mpz_ptr -> nativeint
	= "camlidl_mpz_mpz_get_si"

external mpz_get_int : mpz_ptr -> int
	= "camlidl_mpz_mpz_get_int"

external mpz_get_d : mpz_ptr -> float
	= "camlidl_mpz_mpz_get_d"

external mpz_get_d_2exp : mpz_ptr -> float * int
	= "camlidl_mpz_mpz_get_d_2exp"

external mpz__get_str : int -> mpz_ptr -> string
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

external mpz_add : mpz_ptrm -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_add"

external mpz_add_ui : mpz_ptrm -> mpz_ptr -> int -> unit
	= "camlidl_mpz_mpz_add_ui"

external mpz_sub : mpz_ptrm -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_sub"

external mpz_sub_ui : mpz_ptrm -> mpz_ptr -> int -> unit
	= "camlidl_mpz_mpz_sub_ui"

external mpz_ui_sub : mpz_ptrm -> int -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_ui_sub"

external mpz_mul : mpz_ptrm -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_mul"

external mpz_mul_si : mpz_ptrm -> mpz_ptr -> int -> unit
	= "camlidl_mpz_mpz_mul_si"

external mpz_addmul : mpz_ptrm -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_addmul"

external mpz_addmul_ui : mpz_ptrm -> mpz_ptr -> int -> unit
	= "camlidl_mpz_mpz_addmul_ui"

external mpz_submul : mpz_ptrm -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_submul"

external mpz_submul_ui : mpz_ptrm -> mpz_ptr -> int -> unit
	= "camlidl_mpz_mpz_submul_ui"

external mpz_mul_2exp : mpz_ptrm -> mpz_ptr -> int -> unit
	= "camlidl_mpz_mpz_mul_2exp"

external mpz_neg : mpz_ptrm -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_neg"

external mpz_abs : mpz_ptrm -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_abs"


(** {2 Division Functions} *)
(** {{:http://gmplib.org/manual/Integer-Division.html#Integer-Division}C documentation} *)

(** [c] stands for ceiling, [f] for floor, and [t] for truncate (rounds toward 0).*)
(** {3 Ceiling division} *)

(** The first parameter holds the quotient. *)
external mpz_cdiv_q : mpz_ptrm -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_cdiv_q"

(** The first parameter holds the remainder. *)
external mpz_cdiv_r : mpz_ptrm -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_cdiv_r"

(** The two first parameters hold resp. the quotient and the remainder). *)
external mpz_cdiv_qr : mpz_ptrm -> mpz_ptrm -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_cdiv_qr"

(** The first parameter holds the quotient. *)
external mpz_cdiv_q_ui : mpz_ptrm -> mpz_ptr -> int -> int
	= "camlidl_mpz_mpz_cdiv_q_ui"

(** The first parameter holds the remainder. *)
external mpz_cdiv_r_ui : mpz_ptrm -> mpz_ptr -> int -> int
	= "camlidl_mpz_mpz_cdiv_r_ui"

(** The two first parameters hold resp. the quotient and the remainder). *)
external mpz_cdiv_qr_ui : mpz_ptrm -> mpz_ptrm -> mpz_ptr -> int -> int
	= "camlidl_mpz_mpz_cdiv_qr_ui"

external mpz_cdiv_ui : mpz_ptr -> int -> int
	= "camlidl_mpz_mpz_cdiv_ui"

(** The first parameter holds the quotient. *)
external mpz_cdiv_q_2exp : mpz_ptrm -> mpz_ptr -> int -> unit
	= "camlidl_mpz_mpz_cdiv_q_2exp"

(** The first parameter holds the remainder. *)
external mpz_cdiv_r_2exp : mpz_ptrm -> mpz_ptr -> int -> unit
	= "camlidl_mpz_mpz_cdiv_r_2exp"

(** {3 Floor division} *)

external mpz_fdiv_q : mpz_ptrm -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_fdiv_q"

external mpz_fdiv_r : mpz_ptrm -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_fdiv_r"

external mpz_fdiv_qr : mpz_ptrm -> mpz_ptrm -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_fdiv_qr"

external mpz_fdiv_q_ui : mpz_ptrm -> mpz_ptr -> int -> int
	= "camlidl_mpz_mpz_fdiv_q_ui"

external mpz_fdiv_r_ui : mpz_ptrm -> mpz_ptr -> int -> int
	= "camlidl_mpz_mpz_fdiv_r_ui"

external mpz_fdiv_qr_ui : mpz_ptrm -> mpz_ptrm -> mpz_ptr -> int -> int
	= "camlidl_mpz_mpz_fdiv_qr_ui"

external mpz_fdiv_ui : mpz_ptr -> int -> int
	= "camlidl_mpz_mpz_fdiv_ui"

external mpz_fdiv_q_2exp : mpz_ptrm -> mpz_ptr -> int -> unit
	= "camlidl_mpz_mpz_fdiv_q_2exp"

external mpz_fdiv_r_2exp : mpz_ptrm -> mpz_ptr -> int -> unit
	= "camlidl_mpz_mpz_fdiv_r_2exp"

(** {3 Truncate division} *)

external mpz_tdiv_q : mpz_ptrm -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_tdiv_q"

external mpz_tdiv_r : mpz_ptrm -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_tdiv_r"

external mpz_tdiv_qr : mpz_ptrm -> mpz_ptrm -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_tdiv_qr"

external mpz_tdiv_q_ui : mpz_ptrm -> mpz_ptr -> int -> int
	= "camlidl_mpz_mpz_tdiv_q_ui"

external mpz_tdiv_r_ui : mpz_ptrm -> mpz_ptr -> int -> int
	= "camlidl_mpz_mpz_tdiv_r_ui"

external mpz_tdiv_qr_ui : mpz_ptrm -> mpz_ptrm -> mpz_ptr -> int -> int
	= "camlidl_mpz_mpz_tdiv_qr_ui"

external mpz_tdiv_ui : mpz_ptr -> int -> int
	= "camlidl_mpz_mpz_tdiv_ui"

external mpz_tdiv_q_2exp : mpz_ptrm -> mpz_ptr -> int -> unit
	= "camlidl_mpz_mpz_tdiv_q_2exp"

external mpz_tdiv_r_2exp : mpz_ptrm -> mpz_ptr -> int -> unit
	= "camlidl_mpz_mpz_tdiv_r_2exp"

(** {3 Other division-related functions} *)

external mpz_gmod : mpz_ptrm -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_gmod"

external mpz_gmod_ui : mpz_ptrm -> mpz_ptr -> int -> int
	= "camlidl_mpz_mpz_gmod_ui"

external mpz_divexact : mpz_ptrm -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_divexact"

external mpz_divexact_ui : mpz_ptrm -> mpz_ptr -> int -> unit
	= "camlidl_mpz_mpz_divexact_ui"

external mpz_divisible_p : mpz_ptr -> mpz_ptr -> bool
	= "camlidl_mpz_mpz_divisible_p"

external mpz_divisible_ui_p : mpz_ptr -> int -> bool
	= "camlidl_mpz_mpz_divisible_ui_p"

external mpz_divisible_2exp_p : mpz_ptr -> int -> bool
	= "camlidl_mpz_mpz_divisible_2exp_p"

external mpz_congruent_p : mpz_ptr -> mpz_ptr -> mpz_ptr -> bool
	= "camlidl_mpz_mpz_congruent_p"

external mpz_congruent_ui_p : mpz_ptr -> int -> int -> bool
	= "camlidl_mpz_mpz_congruent_ui_p"

external mpz_congruent_2exp_p : mpz_ptr -> mpz_ptr -> int -> bool
	= "camlidl_mpz_mpz_congruent_2exp_p"


(** {2 Exponentiation Functions} *)
(** {{:http://gmplib.org/manual/Integer-Exponentiation.html#Integer-Exponentiation}C documentation} *)

external mpz__powm : mpz_ptrm -> mpz_ptr -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz__powm"

external mpz__powm_ui : mpz_ptrm -> mpz_ptr -> int -> mpz_ptr -> unit
	= "camlidl_mpz_mpz__powm_ui"

let powm a b c ~modulo = _powm a b c modulo
let powm_ui a b c ~modulo = _powm_ui a b c modulo

external mpz_pow_ui : mpz_ptrm -> mpz_ptr -> int -> unit
	= "camlidl_mpz_mpz_pow_ui"

external mpz_ui_pow_ui : mpz_ptrm -> int -> int -> unit
	= "camlidl_mpz_mpz_ui_pow_ui"


(** {2 Root Extraction Functions} *)
(** {{:http://gmplib.org/manual/Integer-Roots.html#Integer-Roots}C documentation} *)

external mpz_root : mpz_ptrm -> mpz_ptr -> int -> bool
	= "camlidl_mpz_mpz_root"

external mpz_sqrt : mpz_ptrm -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_sqrt"

external mpz__sqrtrem : mpz_ptrm -> mpz_ptrm -> mpz_ptr -> unit
	= "camlidl_mpz_mpz__sqrtrem"

let sqrtrem a ~remainder b = _sqrtrem a remainder b
external mpz_perfect_power_p : mpz_ptr -> bool
	= "camlidl_mpz_mpz_perfect_power_p"

external mpz_perfect_square_p : mpz_ptr -> bool
	= "camlidl_mpz_mpz_perfect_square_p"


(** {2 Number Theoretic  Functions} *)
(** {{:http://gmplib.org/manual/Number-Theoretic-Functions.html#Number-Theoretic-Functions}C documentation} *)

external mpz_probab_prime_p : mpz_ptr -> int -> int
	= "camlidl_mpz_mpz_probab_prime_p"

external mpz_nextprime : mpz_ptrm -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_nextprime"

external mpz_gcd : mpz_ptrm -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_gcd"

external mpz_gcd_ui : mpz_ptrm option -> mpz_ptr -> int -> int
	= "camlidl_mpz_mpz_gcd_ui"

external mpz__gcdext : mpz_ptrm -> mpz_ptrm -> mpz_ptrm -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz__gcdext"

let gcdext ~gcd ~alpha ~beta a b = _gcdext gcd alpha beta a b
external mpz_lcm : mpz_ptrm -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_lcm"

external mpz_lcm_ui : mpz_ptrm -> mpz_ptr -> int -> unit
	= "camlidl_mpz_mpz_lcm_ui"

external mpz_invert : mpz_ptrm -> mpz_ptr -> mpz_ptr -> bool
	= "camlidl_mpz_mpz_invert"

external mpz_jacobi : mpz_ptr -> mpz_ptr -> int
	= "camlidl_mpz_mpz_jacobi"

external mpz_legendre : mpz_ptr -> mpz_ptr -> int
	= "camlidl_mpz_mpz_legendre"

external mpz_kronecker : mpz_ptr -> mpz_ptr -> int
	= "camlidl_mpz_mpz_kronecker"

external mpz_kronecker_si : mpz_ptr -> int -> int
	= "camlidl_mpz_mpz_kronecker_si"

external mpz_si_kronecker : int -> mpz_ptr -> int
	= "camlidl_mpz_mpz_si_kronecker"

external mpz_remove : mpz_ptrm -> mpz_ptr -> mpz_ptr -> int
	= "camlidl_mpz_mpz_remove"

external mpz_fac_ui : mpz_ptrm -> int -> unit
	= "camlidl_mpz_mpz_fac_ui"

external mpz_bin_ui : mpz_ptrm -> mpz_ptr -> int -> unit
	= "camlidl_mpz_mpz_bin_ui"

external mpz_bin_uiui : mpz_ptrm -> int -> int -> unit
	= "camlidl_mpz_mpz_bin_uiui"

external mpz_fib_ui : mpz_ptrm -> int -> unit
	= "camlidl_mpz_mpz_fib_ui"

external mpz_fib2_ui : mpz_ptrm -> mpz_ptrm -> int -> unit
	= "camlidl_mpz_mpz_fib2_ui"

external mpz_lucnum_ui : mpz_ptrm -> int -> unit
	= "camlidl_mpz_mpz_lucnum_ui"

external mpz_lucnum2_ui : mpz_ptrm -> mpz_ptrm -> int -> unit
	= "camlidl_mpz_mpz_lucnum2_ui"


(** {2 Comparison Functions} *)
(** {{:http://gmplib.org/manual/Integer-Comparisons.html#Integer-Comparisons}C documentation} *)

external mpz_cmp : mpz_ptr -> mpz_ptr -> int
	= "camlidl_mpz_mpz_cmp"

external mpz_cmp_d : mpz_ptr -> float -> int
	= "camlidl_mpz_mpz_cmp_d"

external mpz_cmp_si : mpz_ptr -> int -> int
	= "camlidl_mpz_mpz_cmp_si"

external mpz_cmpabs : mpz_ptr -> mpz_ptr -> int
	= "camlidl_mpz_mpz_cmpabs"

external mpz_cmpabs_d : mpz_ptr -> float -> int
	= "camlidl_mpz_mpz_cmpabs_d"

external mpz_cmpabs_ui : mpz_ptr -> int -> int
	= "camlidl_mpz_mpz_cmpabs_ui"

external mpz_sgn : mpz_ptr -> int
	= "camlidl_mpz_mpz_sgn"


(** {2 Logical and Bit Manipulation Functions} *)
(** {{:http://gmplib.org/manual/Integer-Logic-and-Bit-Fiddling.html#Integer-Logic-and-Bit-Fiddling}C documentation} *)

external mpz_gand : mpz_ptrm -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_gand"

external mpz_ior : mpz_ptrm -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_ior"

external mpz_xor : mpz_ptrm -> mpz_ptr -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_xor"

external mpz_com : mpz_ptrm -> mpz_ptr -> unit
	= "camlidl_mpz_mpz_com"

external mpz_popcount : mpz_ptr -> int
	= "camlidl_mpz_mpz_popcount"

external mpz_hamdist : mpz_ptr -> mpz_ptr -> int
	= "camlidl_mpz_mpz_hamdist"

external mpz_scan0 : mpz_ptr -> int -> int
	= "camlidl_mpz_mpz_scan0"

external mpz_scan1 : mpz_ptr -> int -> int
	= "camlidl_mpz_mpz_scan1"

external mpz_setbit : mpz_ptrm -> int -> unit
	= "camlidl_mpz_mpz_setbit"

external mpz_clrbit : mpz_ptrm -> int -> unit
	= "camlidl_mpz_mpz_clrbit"

external mpz_tstbit : mpz_ptr -> int -> bool
	= "camlidl_mpz_mpz_tstbit"


(** {2 Input and Output Functions: not interfaced} *)


(** {2 Random Number Functions: see {!Gmp_random} module} *)


(** {2 Integer Import and Export Functions} *)
(** {{:ttp://gmplib.org/manual/Integer-Import-and-Export.html#Integer-Import-and-Export}C documentation} *)

external mpz__import : mpz_ptrm -> (int, Bigarray.int32_elt, Bigarray.c_layout) Bigarray.Array1.t -> int -> int -> unit
	= "camlidl_mpz_mpz__import"

external mpz__export : mpz_ptr -> int -> int -> (int, Bigarray.int32_elt, Bigarray.c_layout) Bigarray.Array1.t
	= "camlidl_mpz_mpz__export"

let import ~dest array ~order ~endian = _import dest array order endian
let export x ~order ~endian = _export x order endian


(** {2 Miscellaneous Functions} *)
(** {{:http://gmplib.org/manual/Miscellaneous-Integer-Functions.html#Miscellaneous-Integer-Functions}C documentation} *)

external mpz_fits_int_p : mpz_ptr -> bool
	= "camlidl_mpz_mpz_fits_int_p"

external mpz_odd_p : mpz_ptr -> bool
	= "camlidl_mpz_mpz_odd_p"

external mpz_even_p : mpz_ptr -> bool
	= "camlidl_mpz_mpz_even_p"

external mpz_size : mpz_ptr -> int
	= "camlidl_mpz_mpz_size"

external mpz_sizeinbase : mpz_ptr -> int -> int
	= "camlidl_mpz_mpz_sizeinbase"

external mpz_fits_ulong_p : mpz_ptr -> bool
	= "camlidl_mpz_mpz_fits_ulong_p"

external mpz_fits_slong_p : mpz_ptr -> bool
	= "camlidl_mpz_mpz_fits_slong_p"

external mpz_fits_uint_p : mpz_ptr -> bool
	= "camlidl_mpz_mpz_fits_uint_p"

external mpz_fits_sint_p : mpz_ptr -> bool
	= "camlidl_mpz_mpz_fits_sint_p"

external mpz_fits_ushort_p : mpz_ptr -> bool
	= "camlidl_mpz_mpz_fits_ushort_p"

external mpz_fits_sshort_p : mpz_ptr -> bool
	= "camlidl_mpz_mpz_fits_sshort_p"


(* File generated from mpf.idl *)

type mpf_ptr
and mpf_ptrm

(** GMP multi-precision floating-point numbers *)



type m (** Mutable tag *)
type f (** Functional (immutable) tag *)
type t = m tt (** Mutable multi-precision floating-point numbers *)

(** The following operations are mapped as much as possible to their C counterpart. In case of imperative functions (like [set], [add], ...) the first parameter of type [t] is an out-parameter and holds the result when the function returns. For instance, [add x y z] adds the values of [y] and [z] and stores the result in [x].

 These functions are as efficient as their C counterpart: they do not imply additional memory allocation. *)



(** {2 Initialization Functions} *)
(** {{:http://gmplib.org/manual/Initializing-Floats.html#Initializing-Floats}C documentation} *)

external mpf_set_default_prec : int -> unit
	= "camlidl_mpf_mpf_set_default_prec"

external mpf_get_default_prec : unit -> int
	= "camlidl_mpf_mpf_get_default_prec"

external mpf_init : unit -> mpf_ptr
	= "camlidl_mpf_mpf_init"

external mpf_init2 : int -> mpf_ptr
	= "camlidl_mpf_mpf_init2"

external mpf_get_prec : mpf_ptr -> int
	= "camlidl_mpf_mpf_get_prec"

external mpf_set_prec : mpf_ptrm -> int -> unit
	= "camlidl_mpf_mpf_set_prec"

external mpf_set_prec_raw : mpf_ptrm -> int -> unit
	= "camlidl_mpf_mpf_set_prec_raw"


(** {2 Assignement Functions} *)
(** {{:http://gmplib.org/manual/Assigning-Floats.html#Assigning-Floats}C documentation} *)

external mpf_set : mpf_ptrm -> mpf_ptr -> unit
	= "camlidl_mpf_mpf_set"

external mpf_set_si : mpf_ptrm -> int -> unit
	= "camlidl_mpf_mpf_set_si"

external mpf_set_d : mpf_ptrm -> float -> unit
	= "camlidl_mpf_mpf_set_d"

external mpf_set_z : mpf_ptrm -> Mpz.mpz_ptr -> unit
	= "camlidl_mpf_mpf_set_z"

external mpf_set_q : mpf_ptrm -> Mpq.mpq_ptr -> unit
	= "camlidl_mpf_mpf_set_q"

external mpf__set_str : mpf_ptrm -> string -> int -> unit
	= "camlidl_mpf_mpf__set_str"

let set_str a b ~base = _set_str a b base
external mpf_swap : mpf_ptrm -> mpf_ptrm -> unit
	= "camlidl_mpf_mpf_swap"


(** {2 Combined Initialization and Assignement Functions} *)
(** {{:http://gmplib.org/manual/Simultaneous-Float-Init-_0026-Assign.html#Simultaneous-Float-Init-_0026-Assign}C documentation} *)

external mpf_init_set : mpf_ptr -> mpf_ptr
	= "camlidl_mpf_mpf_init_set"

external mpf_init_set_si : int -> mpf_ptr
	= "camlidl_mpf_mpf_init_set_si"

external mpf_init_set_d : float -> mpf_ptr
	= "camlidl_mpf_mpf_init_set_d"

external mpf__init_set_str : string -> int -> mpf_ptr
	= "camlidl_mpf_mpf__init_set_str"

let init_set_str a ~base = _init_set_str a base

(** {2 Conversion Functions} *)
(** {{:http://gmplib.org/manual/Converting-Floats.html#Converting-Floats}C documentation} *)

external mpf_get_d : mpf_ptr -> float
	= "camlidl_mpf_mpf_get_d"

external mpf_get_d_2exp : mpf_ptr -> float * int
	= "camlidl_mpf_mpf_get_d_2exp"

external mpf_get_si : mpf_ptr -> nativeint
	= "camlidl_mpf_mpf_get_si"

external mpf_get_int : mpf_ptr -> int
	= "camlidl_mpf_mpf_get_int"

external mpf_get_z : Mpz.mpz_ptrm -> mpf_ptr -> unit
	= "camlidl_mpf_mpf_get_z"

external mpf_get_q : Mpq.mpq_ptrm -> mpf_ptr -> unit
	= "camlidl_mpf_mpf_get_q"

external mpf__get_str : int -> int -> mpf_ptr -> string * int
	= "camlidl_mpf_mpf__get_str"

let get_str ~base ~digits a = _get_str base digits a

(** {2 Arithmetic Functions} *)
(** {{:http://gmplib.org/manual/Float-Arithmetic.html#Float-Arithmetic}C documentation} *)

external mpf_add : mpf_ptrm -> mpf_ptr -> mpf_ptr -> unit
	= "camlidl_mpf_mpf_add"

external mpf_add_ui : mpf_ptrm -> mpf_ptr -> int -> unit
	= "camlidl_mpf_mpf_add_ui"

external mpf_sub : mpf_ptrm -> mpf_ptr -> mpf_ptr -> unit
	= "camlidl_mpf_mpf_sub"

external mpf_ui_sub : mpf_ptrm -> int -> mpf_ptr -> unit
	= "camlidl_mpf_mpf_ui_sub"

external mpf_sub_ui : mpf_ptrm -> mpf_ptr -> int -> unit
	= "camlidl_mpf_mpf_sub_ui"

external mpf_mul : mpf_ptrm -> mpf_ptr -> mpf_ptr -> unit
	= "camlidl_mpf_mpf_mul"

external mpf_mul_ui : mpf_ptrm -> mpf_ptr -> int -> unit
	= "camlidl_mpf_mpf_mul_ui"

external mpf_mul_2exp : mpf_ptrm -> mpf_ptr -> int -> unit
	= "camlidl_mpf_mpf_mul_2exp"

external mpf_div : mpf_ptrm -> mpf_ptr -> mpf_ptr -> unit
	= "camlidl_mpf_mpf_div"

external mpf_ui_div : mpf_ptrm -> int -> mpf_ptr -> unit
	= "camlidl_mpf_mpf_ui_div"

external mpf_div_ui : mpf_ptrm -> mpf_ptr -> int -> unit
	= "camlidl_mpf_mpf_div_ui"

external mpf_div_2exp : mpf_ptrm -> mpf_ptr -> int -> unit
	= "camlidl_mpf_mpf_div_2exp"

external mpf_sqrt : mpf_ptrm -> mpf_ptr -> unit
	= "camlidl_mpf_mpf_sqrt"

external mpf_pow_ui : mpf_ptrm -> mpf_ptr -> int -> unit
	= "camlidl_mpf_mpf_pow_ui"

external mpf_neg : mpf_ptrm -> mpf_ptr -> unit
	= "camlidl_mpf_mpf_neg"

external mpf_abs : mpf_ptrm -> mpf_ptr -> unit
	= "camlidl_mpf_mpf_abs"


(** {2 Comparison Functions} *)
(** {{:http://gmplib.org/manual/Float-Comparison.html#Float-Comparison}C documentation} *)

external mpf_cmp : mpf_ptr -> mpf_ptr -> int
	= "camlidl_mpf_mpf_cmp"

external mpf_cmp_d : mpf_ptr -> float -> int
	= "camlidl_mpf_mpf_cmp_d"

external mpf_cmp_si : mpf_ptr -> int -> int
	= "camlidl_mpf_mpf_cmp_si"

external mpf_sgn : mpf_ptr -> int
	= "camlidl_mpf_mpf_sgn"

external mpf__equal : mpf_ptr -> mpf_ptr -> int -> bool
	= "camlidl_mpf_mpf__equal"

let equal a b ~bits = _equal a b bits
external mpf_reldiff : mpf_ptrm -> mpf_ptr -> mpf_ptr -> unit
	= "camlidl_mpf_mpf_reldiff"


(** {2 Input and Output Functions: not interfaced} *)


(** {2 Random Number Functions: see {!Gmp_random} module} *)


(** {2 Miscellaneous Float Functions} *)
(** {{:http://gmplib.org/manual/Miscellaneous-Float-Functions.html#Miscellaneous-Float-Functions}C documentation} *)

external mpf_ceil : mpf_ptrm -> mpf_ptr -> unit
	= "camlidl_mpf_mpf_ceil"

external mpf_floor : mpf_ptrm -> mpf_ptr -> unit
	= "camlidl_mpf_mpf_floor"

external mpf_trunc : mpf_ptrm -> mpf_ptr -> unit
	= "camlidl_mpf_mpf_trunc"

external mpf_integer_p : mpf_ptr -> bool
	= "camlidl_mpf_mpf_integer_p"

external mpf_fits_int_p : mpf_ptr -> bool
	= "camlidl_mpf_mpf_fits_int_p"

external mpf_fits_ulong_p : mpf_ptr -> bool
	= "camlidl_mpf_mpf_fits_ulong_p"

external mpf_fits_slong_p : mpf_ptr -> bool
	= "camlidl_mpf_mpf_fits_slong_p"

external mpf_fits_uint_p : mpf_ptr -> bool
	= "camlidl_mpf_mpf_fits_uint_p"

external mpf_fits_sint_p : mpf_ptr -> bool
	= "camlidl_mpf_mpf_fits_sint_p"

external mpf_fits_ushort_p : mpf_ptr -> bool
	= "camlidl_mpf_mpf_fits_ushort_p"

external mpf_fits_sshort_p : mpf_ptr -> bool
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


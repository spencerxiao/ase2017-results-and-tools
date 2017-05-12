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

let set_str a b ~base = _set_str a b base
external mpq_swap : mpq_ptrm -> mpq_ptrm -> unit
	= "camlidl_mpq_mpq_swap"


(** {2 Conversion Functions} *)
(** {{:http://gmplib.org/manual/Rational-Conversions.html#Rational-Conversions}C documentation} *)

external mpq_get_d : mpq_ptr -> float
	= "camlidl_mpq_mpq_get_d"

external mpq_set_d : mpq_ptrm -> float -> unit
	= "camlidl_mpq_mpq_set_d"

external mpq_get_z : Mpz.mpz_ptrm -> mpq_ptr -> unit
	= "camlidl_mpq_mpq_get_z"

external mpq__get_str : int -> mpq_ptr -> string
	= "camlidl_mpq_mpq__get_str"

let get_str ~base a = _get_str base a

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


(** {2 Pretty printing} *)

let print fmt x = Format.pp_print_string fmt (get_str 10 x)
let (_gen : m tt -> 'a tt) = Obj.magic
let init_set x = let y = init() in set y x; _gen y
let init_set_z z = let x = init() in set_z x z; _gen x
let init_set_si n d = let x = init() in set_si x n d; _gen x
let init_set_str str ~base = let x = init() in ignore (set_str x str ~base); _gen x
let init_set_d d = let x = init() in set_d x d; _gen x
let to_string x = get_str 10 x
let to_float = get_d
let of_string str = init_set_str str 10
let of_float = init_set_d
let of_int a = init_set_si a 1
let of_frac = init_set_si
let of_mpz = init_set_z
let of_mpz2 num den = let res = init() in set_num res num; set_den res den; canonicalize res; _gen res

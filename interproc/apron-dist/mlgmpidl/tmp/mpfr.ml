(* File generated from mpfr.idl *)

type mpfr_ptr
and mpfr_ptrm
and mpfr_rnd_t = 
  | Near
  | Zero
  | Up
  | Down
  | Away
  | Faith
  | NearAway

(** MPFR multi-precision floating-point numbers *)



type m (** Mutable tag *)
type f (** Functional (immutable) tag *)
type t = m tt (** Mutable multi-precision floating-point numbers *)

(** The following operations are mapped as much as possible to their C counterpart. In case of imperative functions (like [set], [add], ...) the first parameter of type [t] is an out-parameter and holds the result when the function returns. For instance, [add x y z] adds the values of [y] and [z] and stores the result in [x].

 These functions are as efficient as their C counterpart: they do not imply additional memory allocation. *)



(** {2 Rounding Modes} *)
(** {{:http://www.mpfr.org/mpfr-current/mpfr.html#Rounding-Related-Functions}C documentation} *)

external mpfr_set_default_rounding_mode : mpfr_rnd_t -> unit
	= "camlidl_mpfr_mpfr_set_default_rounding_mode"

external mpfr_get_default_rounding_mode : unit -> mpfr_rnd_t
	= "camlidl_mpfr_mpfr_get_default_rounding_mode"

external mpfr_round_prec : mpfr_ptrm -> mpfr_rnd_t -> int -> int
	= "camlidl_mpfr_mpfr_round_prec"


(** {2 Exceptions} *)
(** {{:http://www.mpfr.org/mpfr-current/mpfr.html#Exception-Related-Functions}C documentation} *)

external mpfr_get_emin : unit -> int
	= "camlidl_mpfr_mpfr_get_emin"

external mpfr_get_emax : unit -> int
	= "camlidl_mpfr_mpfr_get_emax"

external mpfr_set_emin : int -> unit
	= "camlidl_mpfr_mpfr_set_emin"

external mpfr_set_emax : int -> unit
	= "camlidl_mpfr_mpfr_set_emax"

external mpfr_check_range : mpfr_ptrm -> int -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_check_range"

external mpfr_clear_underflow : unit -> unit
	= "camlidl_mpfr_mpfr_clear_underflow"

external mpfr_clear_overflow : unit -> unit
	= "camlidl_mpfr_mpfr_clear_overflow"

external mpfr_clear_nanflag : unit -> unit
	= "camlidl_mpfr_mpfr_clear_nanflag"

external mpfr_clear_inexflag : unit -> unit
	= "camlidl_mpfr_mpfr_clear_inexflag"

external mpfr_clear_flags : unit -> unit
	= "camlidl_mpfr_mpfr_clear_flags"

external mpfr_underflow_p : unit -> bool
	= "camlidl_mpfr_mpfr_underflow_p"

external mpfr_overflow_p : unit -> bool
	= "camlidl_mpfr_mpfr_overflow_p"

external mpfr_nanflag_p : unit -> bool
	= "camlidl_mpfr_mpfr_nanflag_p"

external mpfr_inexflag_p : unit -> bool
	= "camlidl_mpfr_mpfr_inexflag_p"


(** {2 Initialization Functions} *)
(** {{:http://www.mpfr.org/mpfr-current/mpfr.html#Initialization-Functions}C documentation} *)

external mpfr_set_default_prec : int -> unit
	= "camlidl_mpfr_mpfr_set_default_prec"

external mpfr_get_default_prec : unit -> int
	= "camlidl_mpfr_mpfr_get_default_prec"

external mpfr_init : unit -> mpfr_ptr
	= "camlidl_mpfr_mpfr_init"

external mpfr_init2 : int -> mpfr_ptr
	= "camlidl_mpfr_mpfr_init2"

external mpfr_get_prec : mpfr_ptr -> int
	= "camlidl_mpfr_mpfr_get_prec"

external mpfr_set_prec : mpfr_ptrm -> int -> unit
	= "camlidl_mpfr_mpfr_set_prec"

external mpfr_set_prec_raw : mpfr_ptrm -> int -> unit
	= "camlidl_mpfr_mpfr_set_prec_raw"


(** {2 Assignment Functions} *)
(** {{:http://www.mpfr.org/mpfr-current/mpfr.html#Assignment-Functions}C documentation} *)

external mpfr_set : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_set"

external mpfr_set_si : mpfr_ptrm -> int -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_set_si"

external mpfr_set_d : mpfr_ptrm -> float -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_set_d"

external mpfr_set_z : mpfr_ptrm -> Mpz.mpz_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_set_z"

external mpfr_set_q : mpfr_ptrm -> Mpq.mpq_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_set_q"

external mpfr__set_str : mpfr_ptrm -> string -> int -> mpfr_rnd_t -> unit
	= "camlidl_mpfr_mpfr__set_str"

let set_str a b ~base round = _set_str a b base round
external mpfr__strtofr : mpfr_ptrm -> string -> int -> mpfr_rnd_t -> int * int
	= "camlidl_mpfr_mpfr__strtofr"

let strtofr a b ~base round = _strtofr a b base round
external mpfr_set_f : mpfr_ptrm -> Mpf.mpf_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_set_f"

external mpfr_set_si_2exp : mpfr_ptrm -> int -> int -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_set_si_2exp"

external mpfr_set_inf : mpfr_ptrm -> int -> unit
	= "camlidl_mpfr_mpfr_set_inf"

external mpfr_set_nan : mpfr_ptrm -> unit
	= "camlidl_mpfr_mpfr_set_nan"

external mpfr_swap : mpfr_ptrm -> mpfr_ptrm -> unit
	= "camlidl_mpfr_mpfr_swap"


(** {2 Combined Initialization and Assignment Functions} *)
(** {{:http://www.mpfr.org/mpfr-current/mpfr.html#Combined-Initialization-and-Assignment-Functions}C documentation} *)

external mpfr_init_set : mpfr_ptr -> mpfr_rnd_t -> int * mpfr_ptr
	= "camlidl_mpfr_mpfr_init_set"

external mpfr_init_set_si : int -> mpfr_rnd_t -> int * mpfr_ptr
	= "camlidl_mpfr_mpfr_init_set_si"

external mpfr_init_set_d : float -> mpfr_rnd_t -> int * mpfr_ptr
	= "camlidl_mpfr_mpfr_init_set_d"

external mpfr_init_set_f : Mpf.mpf_ptr -> mpfr_rnd_t -> int * mpfr_ptr
	= "camlidl_mpfr_mpfr_init_set_f"

external mpfr_init_set_z : Mpz.mpz_ptr -> mpfr_rnd_t -> int * mpfr_ptr
	= "camlidl_mpfr_mpfr_init_set_z"

external mpfr_init_set_q : Mpq.mpq_ptr -> mpfr_rnd_t -> int * mpfr_ptr
	= "camlidl_mpfr_mpfr_init_set_q"

external mpfr__init_set_str : string -> int -> mpfr_rnd_t -> mpfr_ptr
	= "camlidl_mpfr_mpfr__init_set_str"

let init_set_str a ~base round = _init_set_str a base round

(** {2 Conversion Functions} *)
(** {{:http://www.mpfr.org/mpfr-current/mpfr.html#Conversion-Functions}C documentation} *)

external mpfr_get_d : mpfr_ptr -> mpfr_rnd_t -> float
	= "camlidl_mpfr_mpfr_get_d"

external mpfr_get_d1 : mpfr_ptr -> float
	= "camlidl_mpfr_mpfr_get_d1"

external mpfr_get_z_exp : Mpz.mpz_ptrm -> mpfr_ptr -> int
	= "camlidl_mpfr_mpfr_get_z_exp"

external mpfr_get_z : Mpz.mpz_ptrm -> mpfr_ptr -> mpfr_rnd_t -> unit
	= "camlidl_mpfr_mpfr_get_z"

external mpfr__get_str : int -> int -> mpfr_ptr -> mpfr_rnd_t -> string * int
	= "camlidl_mpfr_mpfr__get_str"

let get_str ~base ~digits a round = _get_str base digits a round

(** {2 Basic Arithmetic Functions} *)
(** {{:http://www.mpfr.org/mpfr-current/mpfr.html#Basic-Arithmetic-Functions}C documentation} *)

external mpfr_add : mpfr_ptrm -> mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_add"

external mpfr_add_ui : mpfr_ptrm -> mpfr_ptr -> int -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_add_ui"

external mpfr_add_z : mpfr_ptrm -> mpfr_ptr -> Mpz.mpz_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_add_z"

external mpfr_add_q : mpfr_ptrm -> mpfr_ptr -> Mpq.mpq_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_add_q"

external mpfr_sub : mpfr_ptrm -> mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_sub"

external mpfr_ui_sub : mpfr_ptrm -> int -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_ui_sub"

external mpfr_sub_ui : mpfr_ptrm -> mpfr_ptr -> int -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_sub_ui"

external mpfr_sub_z : mpfr_ptrm -> mpfr_ptr -> Mpz.mpz_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_sub_z"

external mpfr_sub_q : mpfr_ptrm -> mpfr_ptr -> Mpq.mpq_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_sub_q"

external mpfr_mul : mpfr_ptrm -> mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_mul"

external mpfr_mul_ui : mpfr_ptrm -> mpfr_ptr -> int -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_mul_ui"

external mpfr_mul_z : mpfr_ptrm -> mpfr_ptr -> Mpz.mpz_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_mul_z"

external mpfr_mul_q : mpfr_ptrm -> mpfr_ptr -> Mpq.mpq_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_mul_q"

external mpfr_mul_2ui : mpfr_ptrm -> mpfr_ptr -> int -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_mul_2ui"

external mpfr_mul_2si : mpfr_ptrm -> mpfr_ptr -> int -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_mul_2si"

external mpfr_mul_2exp : mpfr_ptrm -> mpfr_ptr -> int -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_mul_2exp"

external mpfr_div : mpfr_ptrm -> mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_div"

external mpfr_ui_div : mpfr_ptrm -> int -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_ui_div"

external mpfr_div_ui : mpfr_ptrm -> mpfr_ptr -> int -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_div_ui"

external mpfr_div_z : mpfr_ptrm -> mpfr_ptr -> Mpz.mpz_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_div_z"

external mpfr_div_q : mpfr_ptrm -> mpfr_ptr -> Mpq.mpq_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_div_q"

external mpfr_div_2ui : mpfr_ptrm -> mpfr_ptr -> int -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_div_2ui"

external mpfr_div_2si : mpfr_ptrm -> mpfr_ptr -> int -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_div_2si"

let div_2exp = div_2ui
external mpfr_sqrt : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> bool
	= "camlidl_mpfr_mpfr_sqrt"

external mpfr_sqrt_ui : mpfr_ptrm -> int -> mpfr_rnd_t -> bool
	= "camlidl_mpfr_mpfr_sqrt_ui"

external mpfr_pow_ui : mpfr_ptrm -> mpfr_ptr -> int -> mpfr_rnd_t -> bool
	= "camlidl_mpfr_mpfr_pow_ui"

external mpfr_pow_si : mpfr_ptrm -> mpfr_ptr -> int -> mpfr_rnd_t -> bool
	= "camlidl_mpfr_mpfr_pow_si"

external mpfr_ui_pow_ui : mpfr_ptrm -> int -> int -> mpfr_rnd_t -> bool
	= "camlidl_mpfr_mpfr_ui_pow_ui"

external mpfr_ui_pow : mpfr_ptrm -> int -> mpfr_ptr -> mpfr_rnd_t -> bool
	= "camlidl_mpfr_mpfr_ui_pow"

external mpfr_pow : mpfr_ptrm -> mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> bool
	= "camlidl_mpfr_mpfr_pow"

external mpfr_neg : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_neg"

external mpfr_abs : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_abs"


(** {2 Comparison Functions} *)
(** {{:http://www.mpfr.org/mpfr-current/mpfr.html#Comparison-Functions}C documentation} *)

external mpfr_cmp : mpfr_ptr -> mpfr_ptr -> int
	= "camlidl_mpfr_mpfr_cmp"

external mpfr_cmp_si : mpfr_ptr -> int -> int
	= "camlidl_mpfr_mpfr_cmp_si"

external mpfr_cmp_si_2exp : mpfr_ptr -> int -> int -> int
	= "camlidl_mpfr_mpfr_cmp_si_2exp"

external mpfr_sgn : mpfr_ptr -> int
	= "camlidl_mpfr_mpfr_sgn"

external mpfr__equal : mpfr_ptr -> mpfr_ptr -> int -> bool
	= "camlidl_mpfr_mpfr__equal"

let equal a b ~bits = _equal a b bits
external mpfr_nan_p : mpfr_ptr -> bool
	= "camlidl_mpfr_mpfr_nan_p"

external mpfr_inf_p : mpfr_ptr -> bool
	= "camlidl_mpfr_mpfr_inf_p"

external mpfr_number_p : mpfr_ptr -> bool
	= "camlidl_mpfr_mpfr_number_p"

external mpfr_reldiff : mpfr_ptrm -> mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> unit
	= "camlidl_mpfr_mpfr_reldiff"


(** {2 Special Functions} *)
(** {{:http://www.mpfr.org/mpfr-current/mpfr.html#Special-Functions}C documentation} *)

external mpfr_log : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_log"

external mpfr_log2 : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_log2"

external mpfr_log10 : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_log10"

external mpfr_exp : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_exp"

external mpfr_exp2 : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_exp2"

external mpfr_exp10 : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_exp10"

external mpfr_cos : mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_cos"

external mpfr_sin : mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_sin"

external mpfr_tan : mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_tan"

external mpfr_sec : mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_sec"

external mpfr_csc : mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_csc"

external mpfr_cot : mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_cot"

external mpfr_sin_cos : mpfr_ptr -> mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> bool
	= "camlidl_mpfr_mpfr_sin_cos"

external mpfr_acos : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_acos"

external mpfr_asin : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_asin"

external mpfr_atan : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_atan"

external mpfr_atan2 : mpfr_ptrm -> mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_atan2"

external mpfr_cosh : mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_cosh"

external mpfr_sinh : mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_sinh"

external mpfr_tanh : mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_tanh"

external mpfr_sech : mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_sech"

external mpfr_csch : mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_csch"

external mpfr_coth : mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_coth"

external mpfr_acosh : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_acosh"

external mpfr_asinh : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_asinh"

external mpfr_atanh : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_atanh"

external mpfr_fac_ui : mpfr_ptrm -> int -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_fac_ui"

external mpfr_log1p : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_log1p"

external mpfr_expm1 : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_expm1"

external mpfr_eint : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_eint"

external mpfr_gamma : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_gamma"

external mpfr_lngamma : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_lngamma"

external mpfr_zeta : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_zeta"

external mpfr_erf : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_erf"

external mpfr_erfc : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_erfc"

external mpfr_j0 : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_j0"

external mpfr_j1 : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_j1"

external mpfr_jn : mpfr_ptrm -> int -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_jn"

external mpfr_y0 : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_y0"

external mpfr_y1 : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_y1"

external mpfr_yn : mpfr_ptrm -> int -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_yn"

external mpfr_fma : mpfr_ptrm -> mpfr_ptr -> mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_fma"

external mpfr_fms : mpfr_ptrm -> mpfr_ptr -> mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_fms"

external mpfr_agm : mpfr_ptrm -> mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_agm"

external mpfr_hypot : mpfr_ptrm -> mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_hypot"

external mpfr_const_log2 : mpfr_ptrm -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_const_log2"

external mpfr_const_pi : mpfr_ptrm -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_const_pi"

external mpfr_const_euler : mpfr_ptrm -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_const_euler"

external mpfr_const_catalan : mpfr_ptrm -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_const_catalan"


(** {2 Input and Output Functions: not interfaced} *)


(** {2 Miscellaneous Float Functions} *)
(** {{:http://www.mpfr.org/mpfr-current/mpfr.html#Rounding-Related-Functions}C documentation} *)

external mpfr_rint : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_rint"

external mpfr_ceil : mpfr_ptrm -> mpfr_ptr -> int
	= "camlidl_mpfr_mpfr_ceil"

external mpfr_floor : mpfr_ptrm -> mpfr_ptr -> int
	= "camlidl_mpfr_mpfr_floor"

external mpfr_round : mpfr_ptrm -> mpfr_ptr -> int
	= "camlidl_mpfr_mpfr_round"

external mpfr_trunc : mpfr_ptrm -> mpfr_ptr -> int
	= "camlidl_mpfr_mpfr_trunc"

external mpfr_frac : mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_frac"

external mpfr_modf : mpfr_ptrm -> mpfr_ptrm -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_modf"

external mpfr_fmod : mpfr_ptrm -> mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_fmod"

external mpfr_remainder : mpfr_ptrm -> mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_remainder"

external mpfr_integer_p : mpfr_ptr -> bool
	= "camlidl_mpfr_mpfr_integer_p"

external mpfr_nexttoward : mpfr_ptrm -> mpfr_ptr -> unit
	= "camlidl_mpfr_mpfr_nexttoward"

external mpfr_nextabove : mpfr_ptrm -> unit
	= "camlidl_mpfr_mpfr_nextabove"

external mpfr_nextbelow : mpfr_ptrm -> unit
	= "camlidl_mpfr_mpfr_nextbelow"

external mpfr_min : mpfr_ptrm -> mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_min"

external mpfr_max : mpfr_ptrm -> mpfr_ptr -> mpfr_ptr -> mpfr_rnd_t -> int
	= "camlidl_mpfr_mpfr_max"

external mpfr_get_exp : mpfr_ptr -> int
	= "camlidl_mpfr_mpfr_get_exp"

external mpfr_set_exp : mpfr_ptrm -> int -> int
	= "camlidl_mpfr_mpfr_set_exp"


(** {2 Additional functions} *)

let to_string x = 
let (s,e) = get_str ~base:10 ~digits:0 x Near in 
if s="" 
then "0." 
else if s.[0] = '-' then begin
  s.[0] <- '.';
  Format.sprintf "-0%sE%i" s e
end
else Format.sprintf "0.%sE%i" s e 


(** {2 Pretty printing} *)

let print fmt x = 
let (s,e) = get_str ~base:10 ~digits:0 x Near in 
if s="" 
then Format.pp_print_string fmt "0.0" 
else Format.fprintf fmt "0.%sE%i" s e 

let string_of_round = function
| Near -> "Near"
| Zero -> "Zero"
| Up -> "Up"
| Down -> "Down"
| Away -> "Away"
| Faith -> "Faith"
| NearAway -> "NearAway"
let print_round fmt x = Format.pp_print_string fmt (string_of_round x)

let to_float ?round x = 
  match round with
  | None -> get_d1 x
  | Some r -> get_d x r

let to_mpq x = 
   let num,den = Mpz.init(), Mpz.init_set_si 1 in
   let e = get_z_exp num x in
   Mpz.mul_2exp den den e;
   Mpq.of_mpz2 num den

let of_int x r = snd (init_set_si x r)
let of_float x r = snd (init_set_d x r)
let of_mpz x r = snd (init_set_z x r)
let of_mpq x r = snd (init_set_q x r)
let of_string x r = init_set_str x ~base:10 r
let of_frac n d r = let mpq = Mpq.of_frac n d in of_mpq mpq r
let of_mpz2 n d r = let mpq = Mpq.of_mpz2 n d in of_mpq mpq r

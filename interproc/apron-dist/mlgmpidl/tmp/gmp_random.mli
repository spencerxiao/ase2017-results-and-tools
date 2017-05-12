(* File generated from gmp_random.idl *)

type gmp_randstate_ptr

(** GMP random generation functions *)


(** {2 Random State Initialization} *)
(** {{:http://gmplib.org/manual/Random-State-Initialization.html#Random-State-Initialization}C documentation} *)

external gmp_randinit_default : unit -> gmp_randstate_ptr
	= "camlidl_gmp_random_gmp_randinit_default"

external gmp_randinit_lc_2exp : Mpz.mpz_ptr -> int -> int -> gmp_randstate_ptr
	= "camlidl_gmp_random_gmp_randinit_lc_2exp"

external gmp_randinit_lc_2exp_size : int -> gmp_randstate_ptr
	= "camlidl_gmp_random_gmp_randinit_lc_2exp_size"

(** {2 Random State Seeding} *)
(** {{:http://gmplib.org/manual/Random-State-Seeding.html#Random-State-Seeding}C documentation} *)

external gmp_randseed : gmp_randstate_ptr -> Mpz.mpz_ptr -> unit
	= "camlidl_gmp_random_gmp_randseed"

external gmp_randseed_ui : gmp_randstate_ptr -> int -> unit
	= "camlidl_gmp_random_gmp_randseed_ui"

(** {2 Random Number Functions} *)

(** {3 Integers ({!Mpz})} *)
(** {{:http://gmplib.org/manual/Integer-Random-Numbers.html#Integer-Random-Numbers}C documentation} *)

module Mpz : sig
external mpz_urandomb : Mpz.mpz_ptrm -> gmp_randstate_ptr -> int -> unit
	= "camlidl_gmp_random_mpz_urandomb"

external mpz_urandomm : Mpz.mpz_ptrm -> gmp_randstate_ptr -> Mpz.mpz_ptr -> unit
	= "camlidl_gmp_random_mpz_urandomm"

external mpz_rrandomb : Mpz.mpz_ptrm -> gmp_randstate_ptr -> int -> unit
	= "camlidl_gmp_random_mpz_rrandomb"

end

(** {3 Floating-point ({!Mpf})} *)
(** {{:http://gmplib.org/manual/Miscellaneous-Float-Functions.html#Miscellaneous-Float-Functions}C documentation} *)

module Mpf : sig
external mpf_urandomb : Mpf.mpf_ptrm -> gmp_randstate_ptr -> int -> unit
	= "camlidl_gmp_random_mpf_urandomb"

end

(** {3 Floating-point ({!Mpfr})} *)
(** {{:http://www.mpfr.org/mpfr-current/mpfr.html#Miscellaneous-Functions}C documentation} *)

module Mpfr : sig
external mpfr_urandomb : Mpfr.mpfr_ptrm -> gmp_randstate_ptr -> unit
	= "camlidl_gmp_random_mpfr_urandomb"

external mpfr_urandom : Mpfr.mpfr_ptr -> gmp_randstate_ptr -> Mpfr.mpfr_rnd_t -> unit
	= "camlidl_gmp_random_mpfr_urandom"

end


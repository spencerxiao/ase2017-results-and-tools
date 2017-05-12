
(* This file is part of the MLGmpIDL interface, released under LGPL license with an exception allowing the redistribution of statically linked executables.
  Please read the COPYING file packaged in the distribution  *)(* File generated from gmp_random.idl *)

type state

(** GMP random generation functions *)


(** {2 Random State Initialization} *)
(** {{:http://gmplib.org/manual/Random-State-Initialization.html#Random-State-Initialization}C documentation} *)

external init_default : unit -> state
	= "camlidl_gmp_random_gmp_randinit_default"

external init_lc_2exp : 'a Mpz.tt -> int -> int -> state
	= "camlidl_gmp_random_gmp_randinit_lc_2exp"

external init_lc_2exp_size : int -> state
	= "camlidl_gmp_random_gmp_randinit_lc_2exp_size"

(** {2 Random State Seeding} *)
(** {{:http://gmplib.org/manual/Random-State-Seeding.html#Random-State-Seeding}C documentation} *)

external seed : state -> 'a Mpz.tt -> unit
	= "camlidl_gmp_random_gmp_randseed"

external seed_ui : state -> int -> unit
	= "camlidl_gmp_random_gmp_randseed_ui"

(** {2 Random Number Functions} *)

(** {3 Integers ({!Mpz})} *)
(** {{:http://gmplib.org/manual/Integer-Random-Numbers.html#Integer-Random-Numbers}C documentation} *)

module Mpz = struct
external urandomb : Mpz.t -> state -> int -> unit
	= "camlidl_gmp_random_mpz_urandomb"

external urandomm : Mpz.t -> state -> 'a Mpz.tt -> unit
	= "camlidl_gmp_random_mpz_urandomm"

external rrandomb : Mpz.t -> state -> int -> unit
	= "camlidl_gmp_random_mpz_rrandomb"

end

(** {3 Floating-point ({!Mpf})} *)
(** {{:http://gmplib.org/manual/Miscellaneous-Float-Functions.html#Miscellaneous-Float-Functions}C documentation} *)

module Mpf = struct
external urandomb : Mpf.t -> state -> int -> unit
	= "camlidl_gmp_random_mpf_urandomb"

end

(** {3 Floating-point ({!Mpfr})} *)
(** {{:http://www.mpfr.org/mpfr-current/mpfr.html#Miscellaneous-Functions}C documentation} *)

module Mpfr = struct
external urandomb : Mpfr.t -> state -> unit
	= "camlidl_gmp_random_mpfr_urandomb"

external urandom : 'a Mpfr.tt -> state -> Mpfr.round -> unit
	= "camlidl_gmp_random_mpfr_urandom"

end


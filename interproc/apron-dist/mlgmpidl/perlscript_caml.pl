print "\n(* This file is part of the MLGmpIDL interface, released under LGPL license with an exception allowing the redistribution of statically linked executables.\n  Please read the COPYING file packaged in the distribution  *)";
while (<>) {
    s/and mpz_ptrm//g;
    s/mpz_ptrm/t/g;
    s/mpz_ptrm/t/g;
    s/mpz_ptr -> mpz_ptr -> mpz_ptr/'a tt -> 'b tt -> 'c tt/g;
    s/mpz_ptr -> mpz_ptr/'a tt -> 'b tt/g;
    s/mpz_ptr -> int -> mpz_ptr/'a tt -> int -> 'b tt/g;
    s/Mpz.mpz_ptr/'a Mpz.tt/g;
    s/mpz_ptr/'a tt/g;
    s/external mpz_/external /g; 
    s/and mpq_ptrm//g;
    s/mpq_ptrm/t/g;
    s/mpq_ptr -> mpq_ptr -> mpq_ptr/'a tt -> 'b tt -> 'c tt/g;
    s/mpq_ptr -> mpq_ptr/'a tt -> 'b tt/g;
    s/mpq_ptr -> int -> mpq_ptr/'a tt -> int -> 'b tt/g;
    s/Mpq.mpq_ptr/'a Mpq.tt/g;
    s/mpq_ptr/'a tt/g;
    s/external mpq_/external /g; 
    s/and mpf_ptrm//g;
    s/mpf_ptrm/t/g;
    s/mpf_ptr -> mpf_ptr -> mpf_ptr/'a tt -> 'b tt -> 'c tt/g;
s/mpf_ptr -> mpf_ptr/'a tt -> 'b tt/g;
    s/mpf_ptr -> int -> mpf_ptr/'a tt -> int -> 'b tt/g;
    s/Mpf.mpf_ptr/'a Mpf.tt/g;
    s/mpf_ptr/'a tt/g;
    s/external mpf_/external /g; 
    s/and mpfr_ptrm//g;
    s/mpfr_ptrm/t/g;
    s/mpfr_ptr -> mpfr_ptr -> mpfr_ptr/'a tt -> 'b tt -> 'c tt/g;
    s/mpfr_ptr -> mpfr_ptr/'a tt -> 'b tt/g;
    s/mpfr_ptr -> int -> mpfr_ptr/'a tt -> int -> 'b tt/g;
    s/mpfr_ptr -> mpfr_rnd_t -> int \* mpfr_ptr/'a tt -> round -> int * 'b tt/g;
    s/'a Mpf.tt -> mpfr_rnd_t -> int \* mpfr_ptr/'a Mpf.tt -> round -> int * 'b tt/g;
    s/'a Mpz.tt -> mpfr_rnd_t -> int \* mpfr_ptr/'a Mpz.tt -> round -> int * 'b tt/g;
    s/'a Mpq.tt -> mpfr_rnd_t -> int \* mpfr_ptr/'a Mpq.tt -> round -> int * 'b tt/g;
    s/Mpfr.mpfr_ptr/'a Mpfr.tt/g;
    s/mpfr_ptr/'a tt/g;
    s/external mpfr_/external /g; 
    s/mpfr_rnd_t/round/g; 
    s/gmp_randstate_ptr/state/g; 
    s/external gmp_randstate_/external /g; 
    s/external gmp_rand/external /g; 
    print;
}
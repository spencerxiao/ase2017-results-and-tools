(** APRON Library *)
(**
{2 Introduction}

Coefficients:
- {!Scalar}, {!Interval}, {!Coeff} (either scalars or intervals)

Managers and Abstract Domains:
- {!Manager}
- {!Box}: intervals
- {!Oct}: octagons
- {!Polka}: convex polyhedra and linear equalities
- {!T1p}: Taylor1plus abstract domain;
- {!Ppl}: interface to PPL convex polyhedra and linear congruences (currently)
- {!PolkaGrid}: reduced product of convex polyhedra and linear congruences

Level 1 of the interface (user-level):
- {!Var}, {!Environment}
- {!Linexpr1}, {!Lincons1}, {!Generator1}: linear expressions, constraints and generators;
- {!Texpr1}, {!Tcons1}: general expressions and constraints;
- {!Abstract1}: abstract properties
- {!Parser}: converting strings to APRON expressions

Level 0 of the interface:
- {!Dim}
- {!Linexpr0}, {!Lincons0}, {!Generator0}
- {!Texpr0}, {!Tcons0}
- {!Abstract0}
*)

(** {2 Module [ Scalar]: APRON Scalar numbers.} *)

module Scalar : sig
  
  (* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
     Please read the COPYING file packaged in the distribution *)
  (* File generated from scalar.idl *)
  
  type t = Float of float | Mpqf of Mpqf.t | Mpfrf of Mpfrf.t
  
  
  
  (** APRON Scalar numbers. *)
  
  (** See {!Mpqf} for operations on GMP multiprecision rational numbers and {!Mpfr} for operations on MPFR multi-precision floating-point numbers. *)
  
  
  
  val of_mpq : Mpq.t -> t
  val of_mpqf : Mpqf.t -> t
  val of_int : int -> t
  val of_frac : int -> int -> t
  (** Create a scalar of type [Mpqf] from resp.
  - A multi-precision rational [Mpq.t] 
  - A multi-precision rational [Mpqf.t] 
  - an integer 
  - a fraction [x/y]
  *)
  
  val of_mpfr : Mpfr.t -> t
  val of_mpfrf : Mpfrf.t -> t
  (** Create a scalar of type [Mpfrf] with the given value *)
  val of_float : float -> t
  (** Create a scalar of type [Float] with the given value *)
  val of_infty : int -> t 
  (** Create a scalar of type [Float] with the value multiplied by
  infinity (resulting in minus infinity, zero, or infinity 
  *)
  val is_infty : t -> int
  (** Infinity test.
  [is_infty x] returns [-1] if x is [-oo], [1] if x is [+oo], and [0] if [x] is
  finite. *)
  
  val sgn : t -> int
  (** Return the sign of the coefficient, which may be a negative value, zero
  or a positive value. *)
  
  val cmp : t -> t -> int
  (** Compare two coefficients, possibly converting to [Mpqf.t].
  [compare x y] returns a negative number if [x] is less than [y], 
  [0] if they ar equal, and a positive number if [x] is greater than [y].
  *)
  
  val cmp_int : t -> int -> int
  (** Compare a coefficient with an integer *)
  
  val equal : t -> t -> bool
  (** Equality test, possibly using a conversion to [Mpqf.t].
  Return [true] if the 2 values are equal. Two infinite values of the same
  signs are considered as equal. *)
  
  val equal_int : t -> int -> bool
  (** Equality test with an integer *)
  
  val neg : t -> t
  (** Negation *)
  val to_string : t -> string
  (** Conversion to string, using [string_of_double], [Mpqf.to_string] or [Mpfr.to_string]
  *)
  
  val print : Format.formatter -> t -> unit
  (** Print a coefficient *)
  
end


(** {2 Module [ Interval]: APRON Intervals on scalars} *)

module Interval : sig
  
  (* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
     Please read the COPYING file packaged in the distribution *)
  (* File generated from interval.idl *)
  
  type t = {
    mutable inf: Scalar.t;
    mutable sup: Scalar.t;
  }
  
  
  
  (** APRON Intervals on scalars *)
  
  
  
  val of_scalar : Scalar.t -> Scalar.t -> t
  (** Build an interval from a lower and an upper bound *)
  val of_infsup : Scalar.t -> Scalar.t -> t
  (** depreciated *)
  
  val of_mpq : Mpq.t -> Mpq.t -> t
  val of_mpqf : Mpqf.t -> Mpqf.t -> t
  val of_int : int -> int -> t
  val of_frac : int -> int -> int -> int -> t
  val of_float : float -> float -> t
  val of_mpfr : Mpfr.t -> Mpfr.t -> t
  (** Create an interval from resp. two
  - multi-precision rationals [Mpq.t] 
  - multi-precision rationals [Mpqf.t] 
  - integers 
  - fractions [x/y] and [z/w]
  - machine floats
  - Mpfr floats
  *)
  
  val is_top : t -> bool
  (** Does the interval represent the universe ([[-oo,+oo]]) ? *)
  
  val is_bottom : t -> bool
  (** Does the interval contain no value ([[a,b]] with a>b) ? *)
  
  val is_leq : t -> t -> bool
  (** Inclusion test. [is_leq x y] returns [true] if [x] is included in [y] *)
  
  val cmp : t -> t -> int
  (** Non Total Comparison:
  0: equality
  -1: i1 included in i2
  +1: i2 included in i1
  -2: i1.inf less than or equal to i2.inf
  +2: i1.inf greater than i2.inf
  *)
  val equal : t -> t -> bool
  (** Equality test *)
  val is_zero : t -> bool
  (** Is the interval equal to [0,0] ? *)
  val equal_int : t -> int -> bool
  (** Is the interval equal to [i,i] ? *)
  val neg : t -> t
  (** Negation *)
  val top : t
  val bottom : t
  (** Top and bottom intervals (using [DOUBLE] coefficients) *)
  
  val set_infsup : t -> Scalar.t -> Scalar.t -> unit
  (** Fill the interval with the given lower and upper bouunds *)
  
  val set_top : t -> unit
  val set_bottom : t -> unit
  (** Fill the interval with top (resp. bottom) value *)
  
  val print : Format.formatter -> t -> unit
  (** Print an interval, under the format [[inf,sup]] *)
  
end


(** {2 Module [ Coeff]: APRON Coefficients (either scalars or intervals)} *)

module Coeff : sig
  
  (* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
     Please read the COPYING file packaged in the distribution *)
  (* File generated from coeff.idl *)
  
  type union_5 =
    | Scalar of Scalar.t
    | Interval of Interval.t
  and t = union_5
  
  (** APRON Coefficients (either scalars or intervals) *)
  
  val s_of_mpq : Mpq.t -> t
  val s_of_mpqf : Mpqf.t -> t
  val s_of_int : int -> t
  val s_of_frac : int -> int -> t
  (** Create a scalar coefficient of type [Mpqf.t] from resp.
  - A multi-precision rational [Mpq.t] 
  - A multi-precision rational [Mpqf.t] 
  - an integer 
  - a fraction [x/y]
  *)
  
  val s_of_float : float -> t
  (** Create an interval coefficient of type [Float] with the given value *)
  val s_of_mpfr : Mpfr.t -> t
  (** Create an interval coefficient of type [Mpfr] with the given value *)
  val i_of_scalar : Scalar.t -> Scalar.t -> t
  (** Build an interval from a lower and an upper bound *)
  val i_of_mpq : Mpq.t -> Mpq.t -> t
  val i_of_mpqf : Mpqf.t -> Mpqf.t -> t
  val i_of_int : int -> int -> t
  val i_of_frac : int -> int -> int -> int -> t
  val i_of_float : float -> float -> t
  val i_of_mpfr : Mpfr.t -> Mpfr.t -> t
  (** Create an interval coefficient from resp. two
  - multi-precision rationals [Mpq.t] 
  - multi-precision rationals [Mpqf.t] 
  - integers 
  - fractions [x/y] and [z/w]
  - machine floats
  - Mpfr floats
  *)
  
  val is_scalar : t -> bool
  val is_interval : t -> bool
  val cmp : t -> t -> int
  (** Non Total Comparison:
  - If the 2 coefficients are both scalars, corresp. to Scalar.cmp
  - If the 2 coefficients are both intervals, corresp. to Interval.cmp
  - otherwise, -3 if the first is a scalar, 3 otherwise
  *)
  val equal : t -> t -> bool
  (** Equality test *)
  val is_zero : t -> bool
  (** Is the coefficient equal to scalar 0 or interval [0,0] ? *)
  val equal_int : t -> int -> bool
  (** Is the coefficient equal to scalar b or interval [b,b] ? *)
  val neg : t -> t
  (** Negation *)
  val reduce : t -> t
  (** Convert interval to scalar if possible *)
  val print : Format.formatter -> t -> unit
  (** Printing *)
  
end


(** {2 Module [ Dim]: APRON Dimensions and related types} *)

module Dim : sig
  
  (* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
     Please read the COPYING file packaged in the distribution *)
  (* File generated from dim.idl *)
  
  type t = int
  and change = {
    dim : int array;
    intdim : int;
    realdim : int;
  }
  and change2 = {
    add: change option;
    remove: change option;
  }
  and perm = int array
  and dimension = {
    intd: int;
    reald: int;
  }
  
  (** APRON Dimensions and related types *)
  
  (**
  
  {ul
  {- [t=int] is the type of dimensions.}
  {- The semantics of an object [(change:change)] is the following one:
  {ul
  {- [change.intdim] and [change.realdim] indicate the number of integer and
     real dimensions to add or to remove}
  {- In case of the addition of dimensions,
  
     [change.dim[i]=k] means: add one dimension at dimension k and shift the
     already existing dimensions greater than or equal to k one step on the
     right (or increment them).
  
     if k is equal to the size of the vector, then it means: add a dimension at
     the end.
  
     Repetition are allowed, and means that one inserts more than one dimensions.
  
     Example:
     [add_dimensions [i0 i1 r0 r1] { dim=[0 1 2 2 4]; intdim=3; realdim=1 }]
     returns [0 i0 0 i1 0 0 r0 r1 0], considered as a vector with 6 integer
     dimensions and 3 real dimensions.}
  {- In case of the removal of dimensions,
  
     dimchange.dim[i]=k means: remove the dimension k and shift the dimensions
     greater than k one step on the left (or decrement them).
  
     Repetitions are meaningless (and are not correct specification)
  
     Example: [remove_dimensions [i0 i1 i2 r0 r1 r2] { dim=[0 2 4]; intdim=2;
     realdim=1 }] returns [i1 r0 r2], considered as a vector with 1 integer
     dimensions and 2 real dimensions.
  }}}
  {- The semantics of an object [(change2:change2)] is the combination of the
  two following transformations:
  {ul
  {- [change2.add] indicates an optional addition of dimensions.}
  {- [change2.remove] indicates an optional removal of dimensions.}
  }}
  {- [perm] defines a permutation.}
  {- [dimension] defines the dimensionality of an abstract value (number of
  integer and real dimensions).
  }}
  *)
  
  
  (** Assuming a transformation for add_dimensions, invert it in-place to
      obtain the inverse transformation using remove_dimensions *)
  val change_add_invert : change -> unit
  
  (** [perm_compose perm1 perm2] composes the 2 permutations perm1 and perm2
    (in this order). The sizes of permutations are supposed to be equal. *)
  val perm_compose : perm -> perm -> perm
  
  (** Invert a permutation *)
  val perm_invert : perm -> perm
  
end


(** {2 Module [ Linexpr0]: APRON Linear expressions of level 0} *)

module Linexpr0 : sig
  
  (* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
     Please read the COPYING file packaged in the distribution *)
  (* File generated from linexpr0.idl *)
  
  type t
  
  (** APRON Linear expressions of level 0 *)
  
  (** Create a linear expression. Its representation is sparse if [None] is provided, dense of size [size] if [Some size] is provided. *)
  external make : int option -> t
  	= "camlidl_linexpr0_ap_linexpr0_make"
  
  
  val of_list : int option -> (Coeff.t * Dim.t) list -> Coeff.t option -> t
  (** Combines {!make} and {!set_list} (see below) *)
  val of_array : int option -> (Coeff.t * Dim.t) array -> Coeff.t option -> t
  (** Combines {!make} and {!set_array} (see below) *)
  
  (** In case of sparse representation, remove zero coefficients *)
  external minimize : t -> unit
  	= "camlidl_linexpr0_ap_linexpr0_minimize"
  
  (** Copy *)
  external copy : t -> t
  	= "camlidl_linexpr0_ap_linexpr0_copy"
  
  (** Comparison with lexicographic ordering using Coeff.cmp, terminating by constant *)
  external compare : t -> t -> int
  	= "camlidl_linexpr0_ap_linexpr0_compare"
  
  (** Hashing function *)
  external hash : t -> int
  	= "camlidl_linexpr0_ap_linexpr0_hash"
  
  (** Get the size of the linear expression (which may be sparse or dense) *)
  external get_size : t -> int
  	= "camlidl_linexpr0_ap_linexpr0_get_size"
  
  (** Get the constant *)
  external get_cst : t -> Coeff.t
  	= "camlidl_linexpr0_ap_linexpr0_get_cst"
  
  (** Get the coefficient corresponding to the dimension *)
  external get_coeff : t -> int -> Coeff.t
  	= "camlidl_linexpr0_ap_linexpr0_get_coeff"
  
  
  val set_list : t -> (Coeff.t * Dim.t) list -> Coeff.t option -> unit
  (** Set simultaneously a number of coefficients.
  
  [set_list expr [(c1,1); (c2,2)] (Some cst)] assigns coefficients [c1] 
  to dimension 1, coefficient [c2] to dimension 2, and coefficient [cst]
  to the constant. If [(Some cst)] is replaced by [None],
  the constant coefficient is not assigned. *)
  val set_array : t -> (Coeff.t * Dim.t) array -> Coeff.t option -> unit
  (** Set simultaneously a number of coefficients, as [set_list]. *)
  
  (** Set the constant *)
  external set_cst : t -> Coeff.t -> unit
  	= "camlidl_linexpr0_ap_linexpr0_set_cst"
  
  (** Set the coefficient corresponding to the dimension *)
  external set_coeff : t -> int -> Coeff.t -> unit
  	= "camlidl_linexpr0_ap_linexpr0_set_coeff"
  
  (** Iter the function on the pairs coefficient/dimension of the linear expression *)
  
  external iter: (Coeff.t -> Dim.t -> unit) -> t -> unit = "camlidl_expr0_linexpr0_iter"
   
  
  (** Print a linear expression, using a function converting from dimensions to names *)
  val print : (Dim.t -> string) -> Format.formatter -> t -> unit
  
end


(** {2 Module [ Lincons0]: APRON Linear constraints of level 0} *)

module Lincons0 : sig
  
  (* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
     Please read the COPYING file packaged in the distribution *)
  (* File generated from lincons0.idl *)
  
  type t = {
    mutable linexpr0 : Linexpr0.t;
    mutable typ : typ;
  }
  
  
  (** APRON Linear constraints of level 0 *)
  and typ =
    | EQ
    | SUPEQ
    | SUP
    | DISEQ
    | EQMOD of Scalar.t
  
  
  (** Make a linear constraint. Modifying later the linear expression
  modifies correspondingly the linear constraint and conversely *)
  val make : Linexpr0.t -> typ -> t
  
  (** Copy a linear constraint (deep copy) *)
  val copy : t -> t
  
  (** Convert a constraint type to a string ([=],[>=], or [>]) *)
  val string_of_typ : typ -> string
  
  (** Print a constraint *)
  val print : (Dim.t -> string) -> Format.formatter -> t -> unit
  
end


(** {2 Module [ Generator0]: APRON Generators of level 0} *)

module Generator0 : sig
  
  (* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
     Please read the COPYING file packaged in the distribution *)
  (* File generated from generator0.idl *)
  
  type typ =
    | LINE
    | RAY
    | VERTEX
    | LINEMOD
    | RAYMOD
  and t = {
    mutable linexpr0: Linexpr0.t;
    mutable typ: typ;
  }
  
  
  (** APRON Generators of level 0 *)
  
  (** Making a generator. The constant coefficient of the linear expression is
  ignored. Modifying later the linear expression modifies correspondingly the
  generator and conversely. *)
  val make : Linexpr0.t -> typ -> t
  
  (** Copy a generator (deep copy) *)
  val copy : t -> t
  
  (** Convert a generator type to a string ([LIN],[RAY], or [VTX]) *)
  val string_of_typ : typ -> string
  
  (** Print a generator *)
  val print : (Dim.t -> string) -> Format.formatter -> t -> unit
  
end


(** {2 Module [ Texpr0]: Unary operators} *)

module Texpr0 : sig
  
  (* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
     Please read the COPYING file packaged in the distribution *)
  (* File generated from texpr0.idl *)
  
  type t
  and unop = 
    | Neg
    | Cast
    | Sqrt (** *)
    (** Unary operators *)
  and binop = 
    | Add
    | Sub
    | Mul
    | Div
    | Mod
    | Pow (** *)
    (** Binary operators *)
  and typ = 
    | Real
    | Int
    | Single
    | Double
    | Extended
    | Quad (** *)
    (** Destination type for rounding *)
  and round = 
    | Near
    | Zero
    | Up
    | Down
    | Rnd (** *)
    (** Rounding direction *)
  
  (** APRON tree expressions of level 0 *)
  
  
  (** User type for tree expressions *) 
  type expr = 
  | Cst of Coeff.t 
  | Dim of Dim.t 
  | Unop of unop * expr * typ * round 
  | Binop of binop * expr * expr * typ * round 
  
  (** {3 Constructors and Destructor} *)
  (** General constructor (actually the most efficient *)
  external of_expr : expr -> t = "camlidl_texpr0_ap_texpr0_of_expr"
  
  (** Copy *)
  external copy : t -> t
  	= "camlidl_texpr0_ap_texpr0_copy"
  
  (** Conversion *)
  external of_linexpr : Linexpr0.t -> t
  	= "camlidl_texpr0_ap_texpr0_of_linexpr"
  
  (** General destructor *)
  external to_expr : t -> expr = "camlidl_texpr0_ap_texpr0_to_expr"
  
  
  (** {4 Incremental constructors} *)
  
  external cst : Coeff.t -> t
  	= "camlidl_texpr0_ap_texpr0_cst"
  
  external dim : Dim.t -> t
  	= "camlidl_texpr0_ap_texpr0_dim"
  
  external unop : unop -> t -> typ -> round -> t
  	= "camlidl_texpr0_ap_texpr0_unop"
  
  external binop : binop -> typ -> round -> t -> t -> t
  	= "camlidl_texpr0_ap_texpr0_binop"
  
  
  (** {3 Tests} *)
  
  external is_interval_cst : t -> bool
  	= "camlidl_texpr0_ap_texpr0_is_interval_cst"
  
  external is_interval_linear : t -> bool
  	= "camlidl_texpr0_ap_texpr0_is_interval_linear"
  
  external is_interval_polynomial : t -> bool
  	= "camlidl_texpr0_ap_texpr0_is_interval_polynomial"
  
  external is_interval_polyfrac : t -> bool
  	= "camlidl_texpr0_ap_texpr0_is_interval_polyfrac"
  
  external is_scalar : t -> bool
  	= "camlidl_texpr0_ap_texpr0_is_scalar"
  
  
  (** {3 Printing} *)
  
  
  val string_of_unop  : unop  -> string
  val string_of_binop : binop -> string
  val string_of_typ   : typ   -> string
  val string_of_round : round -> string
  val print_unop  :  Format.formatter -> unop  -> unit
  val print_binop :  Format.formatter -> binop -> unit
  val print_typ   :  Format.formatter -> typ   -> unit
  val print_round :  Format.formatter -> round -> unit
  val print_expr : (Dim.t -> string) -> Format.formatter -> expr -> unit
  (** Print a tree expression, using a function converting from dimensions to names *)
  val print : (Dim.t -> string) -> Format.formatter -> t -> unit
  (** Print an abstract tree expression, using a function converting from dimensions to names *)
  
  (** {3 Internal usage for level 1} *)
  
  val print_sprint_unop : unop -> typ -> round -> string
  val print_sprint_binop : binop -> typ -> round -> string
  val print_precedence_of_unop : unop -> int
  val print_precedence_of_binop : binop -> int
  
end


(** {2 Module [ Tcons0]: APRON tree expressions constraints of level 0} *)

module Tcons0 : sig
  
  (* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
     Please read the COPYING file packaged in the distribution *)
  (* File generated from tcons0.idl *)
  
  type t = {
    mutable texpr0 : Texpr0.t;
    mutable typ : Lincons0.typ;
  }
  
  
  (** APRON tree expressions constraints of level 0 *)
  
  type typ = Lincons0.typ =
  | EQ
  | SUPEQ
  | SUP
  | DISEQ
  | EQMOD of Scalar.t
  
  
  (** Make a tree expression constraint. Modifying later the tree expression expression
  modifies correspondingly the tree expression constraint and conversely *)
  val make : Texpr0.t -> typ -> t
  
  (** Copy a tree expression constraint (deep copy) *)
  val copy : t -> t
  
  (** Convert a constraint type to a string ([=],[>=], or [>]) *)
  val string_of_typ : typ -> string
  
  (** Print a constraint *)
  val print : (Dim.t -> string) -> Format.formatter -> t -> unit
  
end


(** {2 Module [ Manager]: APRON Managers} *)

module Manager : sig
  
  (* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
     Please read the COPYING file packaged in the distribution *)
  (* File generated from manager.idl *)
  
  type funid = 
  | Funid_unknown
  | Funid_copy
  | Funid_free
  | Funid_asize
  | Funid_minimize
  | Funid_canonicalize
  | Funid_hash
  | Funid_approximate
  | Funid_fprint
  | Funid_fprintdiff
  | Funid_fdump
  | Funid_serialize_raw
  | Funid_deserialize_raw
  | Funid_bottom
  | Funid_top
  | Funid_of_box
  | Funid_dimension
  | Funid_is_bottom
  | Funid_is_top
  | Funid_is_leq
  | Funid_is_eq
  | Funid_is_dimension_unconstrained
  | Funid_sat_interval
  | Funid_sat_lincons
  | Funid_sat_tcons
  | Funid_bound_dimension
  | Funid_bound_linexpr
  | Funid_bound_texpr
  | Funid_to_box
  | Funid_to_lincons_array
  | Funid_to_tcons_array
  | Funid_to_generator_array
  | Funid_meet
  | Funid_meet_array
  | Funid_meet_lincons_array
  | Funid_meet_tcons_array
  | Funid_join
  | Funid_join_array
  | Funid_add_ray_array
  | Funid_assign_linexpr_array
  | Funid_substitute_linexpr_array
  | Funid_assign_texpr_array
  | Funid_substitute_texpr_array
  | Funid_add_dimensions
  | Funid_remove_dimensions
  | Funid_permute_dimensions
  | Funid_forget_array
  | Funid_expand
  | Funid_fold
  | Funid_widening
  | Funid_closure
  | Funid_change_environment
  | Funid_rename_array
  
  and funopt = {
    algorithm: int;
    timeout: int;
    max_object_size: int;
    flag_exact_wanted: bool;
    flag_best_wanted: bool;
  }
  and exc = 
  | Exc_none
  | Exc_timeout
  | Exc_out_of_space
  | Exc_overflow
  | Exc_invalid_argument
  | Exc_not_implemented
  
  and exclog = {
    exn: exc;
    funid: funid;
    msg: string;
  }
  and 'a t
  
  (** APRON Managers *)
  (** The type parameter ['a] allows to distinguish managers allocated by different underlying abstract domains. *)
  
  (** Concerning the other types,
  
  - [funid] defines identifiers for the generic function working on abstrat values;
  
  - [funopt] defines the options associated to generic functions; 
  
  - [exc] defines the different kind of exceptions; 
  
  - [exclog] defines the exceptions raised by APRON functions.
  
  *)
  
  (** Get the name of the effective library which allocated the manager *)
  external get_library : 'a t -> string
  	= "camlidl_manager_ap_manager_get_library"
  
  (** Get the version of the effective library which allocated the manager *)
  external get_version : 'a t -> string
  	= "camlidl_manager_ap_manager_get_version"
  
  (** Return the default options for any function ([0] or [false] for al fields) *)
  external funopt_make : unit -> funopt
  	= "camlidl_manager_ap_funopt_make"
  
  (** Get the options sets for the function. The result is a copy of the internal structure and may be freely modified. [funid] should be different from [Funid_change_environment] and [Funid_rename_array] (no option associated to them). *)
  external get_funopt : 'a t -> funid -> funopt
  	= "camlidl_manager_ap_manager_get_funopt"
  
  (** Set the options for the function. [funid] should be different from [Funid_change_environment] and [Funid_rename_array] (no option associated to them). *)
  external set_funopt : 'a t -> funid -> funopt -> unit
  	= "camlidl_manager_ap_manager_set_funopt"
  
  (** Get the corresponding result flag *)
  external get_flag_exact : 'a t -> bool
  	= "camlidl_manager_ap_manager_get_flag_exact"
  
  (** Get the corresponding result flag *)
  external get_flag_best : 'a t -> bool
  	= "camlidl_manager_ap_manager_get_flag_best"
  
  (** Exception raised by functions of the interface *)
  exception Error of exclog
  val string_of_funid: funid -> string
  val string_of_exc: exc -> string
  val print_funid: Format.formatter -> funid -> unit
  val print_funopt: Format.formatter -> funopt -> unit
  val print_exc: Format.formatter -> exc -> unit
  val print_exclog: Format.formatter -> exclog -> unit
    (** Printing functions *)
  (** Set / get the global manager used for deserialization *)
  external set_deserialize : 'a t -> unit
  	= "camlidl_manager_ap_manager_set_deserialize"
  
  external get_deserialize : unit -> 'a t
  	= "camlidl_manager_ap_manager_get_deserialize"
  
end


(** {2 Module [ Abstract0]: APRON Abstract value of level 0} *)

module Abstract0 : sig
  
  (* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
     Please read the COPYING file packaged in the distribution *)
  (* File generated from abstract0.idl *)
  
  type 'a t
  
  (** APRON Abstract value of level 0 *)
  (** The type parameter ['a] allows to distinguish abstract values with different underlying abstract domains. *)
  
  
  (** TO BE DOCUMENTED *)
  external set_gc : int -> unit
  	= "camlidl_abstract0_ap_abstract0_set_gc"
  
  (* ********************************************************************** *)
  (** {3 General management} *)
  (* ********************************************************************** *)
  (* ============================================================ *)
  (** {4 Memory} *)
  (* ============================================================ *)
  
  (** Copy a value *)
  external copy : 'a Manager.t -> 'a t -> 'a t
  	= "camlidl_abstract0_ap_abstract0_copy"
  
  
  (** Return the abstract size of a value *)
  external size : 'a Manager.t -> 'a t -> int
  	= "camlidl_abstract0_ap_abstract0_size"
  
  (* ============================================================ *)
  (** {4 Control of internal representation} *)
  (* ============================================================ *)
  
  (** Minimize the size of the representation of the value. This may result in a later recomputation of internal information.*)
  external minimize : 'a Manager.t -> 'a t -> unit
  	= "camlidl_abstract0_ap_abstract0_minimize"
  
  
  (** Put the abstract value in canonical form. (not yet clear definition) *)
  external canonicalize : 'a Manager.t -> 'a t -> unit
  	= "camlidl_abstract0_ap_abstract0_canonicalize"
  
  external hash : 'a Manager.t -> 'a t -> int
  	= "camlidl_abstract0_ap_abstract0_hash"
  
  
  (** [approximate man abs alg] perform some transformation on the abstract value, guided by the argument [alg]. The transformation may lose information.  The argument [alg] overrides the field algorithm of the structure of type [Manager.funopt] associated to ap_abstract0_approximate (commodity feature).*)
  external approximate : 'a Manager.t -> 'a t -> int -> unit
  	= "camlidl_abstract0_ap_abstract0_approximate"
  
  (* ============================================================ *)
  (** {4 Printing} *)
  (* ============================================================ *)
  
  (** Dump on the [stdout] C stream the internal representation of an abstract value, for debugging purposes *)
  external fdump : 'a Manager.t -> 'a t -> unit
  	= "camlidl_abstract0_ap_abstract0_fdump"
  
  
  (** Print as a set of constraints *)
  val print: (int -> string) -> Format.formatter -> 'a t -> unit
  (* ============================================================ *)
  (** {4 Serialization} *)
  (* ============================================================ *)
  (* ********************************************************************** *)
  (** {3 Constructor, accessors, tests and property extraction} *)
  (* ********************************************************************** *)
  (* ============================================================ *)
  (** {4 Basic constructors} *)
  (* ============================================================ *)
  
  (** Create a bottom (empty) value with the given number of integer and real variables *)
  external bottom : 'a Manager.t -> int -> int -> 'a t
  	= "camlidl_abstract0_ap_abstract0_bottom"
  
  
  (** Create a top (universe) value with the given number of integer and real variables *)
  external top : 'a Manager.t -> int -> int -> 'a t
  	= "camlidl_abstract0_ap_abstract0_top"
  
  
  (** Abstract an hypercube.
  
  [of_box man intdim realdim array] abstracts an hypercube defined by the array of intervals of size [intdim+realdim] *)
  external of_box : 'a Manager.t -> int -> int -> Interval.t array -> 'a t
  	= "camlidl_abstract0_ap_abstract0_of_box"
  
  (* ============================================================ *)
  (** {4 Accessors} *)
  (* ============================================================ *)
  
  
  external dimension : 'a Manager.t -> 'a t -> Dim.dimension
  	= "camlidl_abstract0_ap_abstract0_dimension"
  
  external manager : 'a t -> 'a Manager.t
  	= "camlidl_abstract0_ap_abstract0_manager"
  
  (* ============================================================ *)
  (** {4 Tests} *)
  (* ============================================================ *)
  
  (** Emptiness test *)
  external is_bottom : 'a Manager.t -> 'a t -> bool
  	= "camlidl_abstract0_ap_abstract0_is_bottom"
  
  
  (** Universality test *)
  external is_top : 'a Manager.t -> 'a t -> bool
  	= "camlidl_abstract0_ap_abstract0_is_top"
  
  
  (** Inclusion test. The 2 abstract values should be compatible. *)
  external is_leq : 'a Manager.t -> 'a t -> 'a t -> bool
  	= "camlidl_abstract0_ap_abstract0_is_leq"
  
  
  (** Equality test. The 2 abstract values should be compatible. *)
  external is_eq : 'a Manager.t -> 'a t -> 'a t -> bool
  	= "camlidl_abstract0_ap_abstract0_is_eq"
  
  
  (** Does the abstract value satisfy the linear constraint ? *)
  external sat_lincons : 'a Manager.t -> 'a t -> Lincons0.t -> bool
  	= "camlidl_abstract0_ap_abstract0_sat_lincons"
  
  
  (** Does the abstract value satisfy the tree expression constraint ? *)
  external sat_tcons : 'a Manager.t -> 'a t -> Tcons0.t -> bool
  	= "camlidl_abstract0_ap_abstract0_sat_tcons"
  
  
  (** Does the abstract value satisfy the constraint [dim in interval] ? *)
  external sat_interval : 'a Manager.t -> 'a t -> Dim.t -> Interval.t -> bool
  	= "camlidl_abstract0_ap_abstract0_sat_interval"
  
  
  (** Is the dimension unconstrained in the abstract value ? If yes, this means that the existential quantification of the dimension does not change the value. *)
  external is_dimension_unconstrained : 'a Manager.t -> 'a t -> Dim.t -> bool
  	= "camlidl_abstract0_ap_abstract0_is_dimension_unconstrained"
  
  (* ============================================================ *)
  (** {4 Extraction of properties} *)
  (* ============================================================ *)
  
  (** Return the interval of variation of the dimension in the abstract value. *)
  external bound_dimension : 'a Manager.t -> 'a t -> Dim.t -> Interval.t
  	= "camlidl_abstract0_ap_abstract0_bound_dimension"
  
  
  (** Return the interval of variation of the linear expression in the abstract value.
  
  Implement a form of linear programming, where the argument linear expression is the one to optimize under the constraints induced by the abstract value. *)
  external bound_linexpr : 'a Manager.t -> 'a t -> Linexpr0.t -> Interval.t
  	= "camlidl_abstract0_ap_abstract0_bound_linexpr"
  
  
  (** Return the interval of variation of the tree expression in the abstract value. *)
  external bound_texpr : 'a Manager.t -> 'a t -> Texpr0.t -> Interval.t
  	= "camlidl_abstract0_ap_abstract0_bound_texpr"
  
  
  (** Convert the abstract value to an hypercube *)
  external to_box : 'a Manager.t -> 'a t -> Interval.t array
  	= "camlidl_abstract0_ap_abstract0_to_box"
  
  
  (** Convert the abstract value to a conjunction of linear constraints. *)
  external to_lincons_array : 'a Manager.t -> 'a t -> Lincons0.t array
  	= "camlidl_abstract0_ap_abstract0_to_lincons_array"
  
  
  (** Convert the abstract value to a conjunction of tree expression constraints. *)
  external to_tcons_array : 'a Manager.t -> 'a t -> Tcons0.t array
  	= "camlidl_abstract0_ap_abstract0_to_tcons_array"
  
  
  (** Convert the abstract value to a set of generators that defines it. *)
  external to_generator_array : 'a Manager.t -> 'a t -> Generator0.t array
  	= "camlidl_abstract0_ap_abstract0_to_generator_array"
  
  (* ********************************************************************** *)
  (** {3 Operations} *)
  (* ********************************************************************** *)
  (* ============================================================ *)
  (** {4 Meet and Join} *)
  (* ============================================================ *)
  
  
  (** Meet of 2 abstract values. *)
  external meet : 'a Manager.t -> 'a t -> 'a t -> 'a t
  	= "camlidl_abstract0_ap_abstract0_meet"
  
  (** Meet of a non empty array of abstract values. *)
  external meet_array : 'a Manager.t -> 'a t array -> 'a t
  	= "camlidl_abstract0_ap_abstract0_meet_array"
  
  (** Meet of an abstract value with an array of linear constraints. *)
  external meet_lincons_array : 'a Manager.t -> 'a t -> Lincons0.t array -> 'a t
  	= "camlidl_abstract0_ap_abstract0_meet_lincons_array"
  
  (** Meet of an abstract value with an array of tree expression constraints. *)
  external meet_tcons_array : 'a Manager.t -> 'a t -> Tcons0.t array -> 'a t
  	= "camlidl_abstract0_ap_abstract0_meet_tcons_array"
  
  (** Join of 2 abstract values. *)
  external join : 'a Manager.t -> 'a t -> 'a t -> 'a t
  	= "camlidl_abstract0_ap_abstract0_join"
  
  (** Join of a non empty array of abstract values. *)
  external join_array : 'a Manager.t -> 'a t array -> 'a t
  	= "camlidl_abstract0_ap_abstract0_join_array"
  
  (** Add the array of generators to the abstract value (time elapse operator).
  
   The generators should either lines or rays, not vertices. *)
  external add_ray_array : 'a Manager.t -> 'a t -> Generator0.t array -> 'a t
  	= "camlidl_abstract0_ap_abstract0_add_ray_array"
  
  
  (** {6 Side-effect versions of the previous functions} *)
  
  external meet_with : 'a Manager.t -> 'a t -> 'a t -> unit
  	= "camlidl_abstract0_ap_abstract0_meet_with"
  
  external meet_lincons_array_with : 'a Manager.t -> 'a t -> Lincons0.t array -> unit
  	= "camlidl_abstract0_ap_abstract0_meet_lincons_array_with"
  
  external meet_tcons_array_with : 'a Manager.t -> 'a t -> Tcons0.t array -> unit
  	= "camlidl_abstract0_ap_abstract0_meet_tcons_array_with"
  
  external join_with : 'a Manager.t -> 'a t -> 'a t -> unit
  	= "camlidl_abstract0_ap_abstract0_join_with"
  
  external add_ray_array_with : 'a Manager.t -> 'a t -> Generator0.t array -> unit
  	= "camlidl_abstract0_ap_abstract0_add_ray_array_with"
  
  (* ============================================================ *)
  (** {4 Assignements and Substitutions} *)
  (* ============================================================ *)
  (** Parallel assignement of an array of dimensions by an array of same size of linear expressions *)
  external assign_linexpr_array : 'a Manager.t -> 'a t -> Dim.t array -> Linexpr0.t array -> 'a t option -> 'a t
  	= "camlidl_abstract0_ap_abstract0_assign_linexpr_array"
  
  (** Parallel substitution of an array of dimensions by an array of same size of linear expressions *)
  external substitute_linexpr_array : 'a Manager.t -> 'a t -> Dim.t array -> Linexpr0.t array -> 'a t option -> 'a t
  	= "camlidl_abstract0_ap_abstract0_substitute_linexpr_array"
  
  (** Parallel assignement of an array of dimensions by an array of same size of tree expressions *)
  external assign_texpr_array : 'a Manager.t -> 'a t -> Dim.t array -> Texpr0.t array -> 'a t option -> 'a t
  	= "camlidl_abstract0_ap_abstract0_assign_texpr_array"
  
  (** Parallel substitution of an array of dimensions by an array of same size of tree expressions *)
  external substitute_texpr_array : 'a Manager.t -> 'a t -> Dim.t array -> Texpr0.t array -> 'a t option -> 'a t
  	= "camlidl_abstract0_ap_abstract0_substitute_texpr_array"
  
  
  (** {6 Side-effect versions of the previous functions} *)
  
  
  external assign_linexpr_array_with : 'a Manager.t -> 'a t -> Dim.t array -> Linexpr0.t array -> 'a t option -> unit
  	= "camlidl_abstract0_ap_abstract0_assign_linexpr_array_with"
  
  external substitute_linexpr_array_with : 'a Manager.t -> 'a t -> Dim.t array -> Linexpr0.t array -> 'a t option -> unit
  	= "camlidl_abstract0_ap_abstract0_substitute_linexpr_array_with"
  
  external assign_texpr_array_with : 'a Manager.t -> 'a t -> Dim.t array -> Texpr0.t array -> 'a t option -> unit
  	= "camlidl_abstract0_ap_abstract0_assign_texpr_array_with"
  
  external substitute_texpr_array_with : 'a Manager.t -> 'a t -> Dim.t array -> Texpr0.t array -> 'a t option -> unit
  	= "camlidl_abstract0_ap_abstract0_substitute_texpr_array_with"
  
  
  
  
  (* ============================================================ *)
  (** {4 Projections} *)
  (* ============================================================ *)
  (** These functions implements forgeting (existential quantification) of (array of) dimensions. Both functional and side-effect versions are provided. The Boolean, if true, adds a projection onto 0-plane. *)
  
  
  external forget_array : 'a Manager.t -> 'a t -> Dim.t array -> bool -> 'a t
  	= "camlidl_abstract0_ap_abstract0_forget_array"
  
  external forget_array_with : 'a Manager.t -> 'a t -> Dim.t array -> bool -> unit
  	= "camlidl_abstract0_ap_abstract0_forget_array_with"
  
  (* ============================================================ *)
  (** {4 Change and permutation of dimensions} *)
  (* ============================================================ *)
  
  
  external add_dimensions : 'a Manager.t -> 'a t -> Dim.change -> bool -> 'a t
  	= "camlidl_abstract0_ap_abstract0_add_dimensions"
  
  external remove_dimensions : 'a Manager.t -> 'a t -> Dim.change -> 'a t
  	= "camlidl_abstract0_ap_abstract0_remove_dimensions"
  
  external apply_dimchange2 : 'a Manager.t -> 'a t -> Dim.change2 -> bool -> 'a t
  	= "camlidl_abstract0_ap_abstract0_apply_dimchange2"
  
  external permute_dimensions : 'a Manager.t -> 'a t -> Dim.perm -> 'a t
  	= "camlidl_abstract0_ap_abstract0_permute_dimensions"
  
  
  (** {6 Side-effect versions of the previous functions} *)
  
  
  external add_dimensions_with : 'a Manager.t -> 'a t -> Dim.change -> bool -> unit
  	= "camlidl_abstract0_ap_abstract0_add_dimensions_with"
  
  external remove_dimensions_with : 'a Manager.t -> 'a t -> Dim.change -> unit
  	= "camlidl_abstract0_ap_abstract0_remove_dimensions_with"
  
  external apply_dimchange2_with : 'a Manager.t -> 'a t -> Dim.change2 -> bool -> unit
  	= "camlidl_abstract0_ap_abstract0_apply_dimchange2_with"
  
  external permute_dimensions_with : 'a Manager.t -> 'a t -> Dim.perm option -> unit
  	= "camlidl_abstract0_ap_abstract0_permute_dimensions_with"
  
  
  
  
  (* ============================================================ *)
  (** {4 Expansion and folding of dimensions} *)
  (* ============================================================ *)
  
  (**
  These functions allows to expand one dimension into several ones having the
  same properties with respect to the other dimensions, and to fold several
  dimensions into one. Formally,
  
  - expand P(x,y,z) z w = P(x,y,z) inter P(x,y,w) if z is expanded in z and w
  - fold Q(x,y,z,w) z w = exists w:Q(x,y,z,w) union (exist z:Q(x,y,z,w))(z<-w)
  if z and w are folded onto z
  *)
  
  
  (** Expansion: [expand a dim n] expands the dimension [dim] into itself + [n]
  additional dimensions.  It results in (n+1) unrelated dimensions having
  same relations with other dimensions. The (n+1) dimensions are put as
  follows: 
  
  - original dimension [dim]
  - if the dimension is integer, the n additional dimensions are put at the
  end of integer dimensions; if it is real, at the end of the real
  dimensions.
  *)
  external expand : 'a Manager.t -> 'a t -> Dim.t -> int -> 'a t
  	= "camlidl_abstract0_ap_abstract0_expand"
  
   (** Folding: [fold a tdim] fold the dimensions in the array [tdim] of size n>=1
  and put the result in the first dimension of the array. The other
  dimensions of the array are then removed (using
  ap_abstract0_permute_remove_dimensions).
  *)
  external fold : 'a Manager.t -> 'a t -> Dim.t array -> 'a t
  	= "camlidl_abstract0_ap_abstract0_fold"
  
  external expand_with : 'a Manager.t -> 'a t -> Dim.t -> int -> unit
  	= "camlidl_abstract0_ap_abstract0_expand_with"
  
  external fold_with : 'a Manager.t -> 'a t -> Dim.t array -> unit
  	= "camlidl_abstract0_ap_abstract0_fold_with"
  
  (* ============================================================ *)
  (** {4 Widening} *)
  (* ============================================================ *)
  (** Widening. Assumes that the first abstract value is included in the second one. *)
  external widening : 'a Manager.t -> 'a t -> 'a t -> 'a t
  	= "camlidl_abstract0_ap_abstract0_widening"
  
  external widening_threshold : 'a Manager.t -> 'a t -> 'a t -> Lincons0.t array -> 'a t
  	= "camlidl_abstract0_ap_abstract0_widening_threshold"
  
  (* ============================================================ *)
  (** {4 Closure operation} *)
  (* ============================================================ *)
  (** Closure: transform strict constraints into non-strict ones.*)
  external closure : 'a Manager.t -> 'a t -> 'a t
  	= "camlidl_abstract0_ap_abstract0_closure"
  
  (** Side-effect version *)
  external closure_with : 'a Manager.t -> 'a t -> unit
  	= "camlidl_abstract0_ap_abstract0_closure_with"
  
  (* ********************************************************************** *)
  (** {3 Additional operations} *)
  (* ********************************************************************** *)
  
  val of_lincons_array : 'a Manager.t -> int -> int -> Lincons0.t array -> 'a t
  val of_tcons_array   : 'a Manager.t -> int -> int -> Tcons0.t   array -> 'a t
  (** Abstract a conjunction of constraints *)
  
  val assign_linexpr     : 'a Manager.t -> 'a t -> Dim.t -> Linexpr0.t -> 'a t option -> 'a t
  val substitute_linexpr : 'a Manager.t -> 'a t -> Dim.t -> Linexpr0.t -> 'a t option -> 'a t
  val assign_texpr       : 'a Manager.t -> 'a t -> Dim.t -> Texpr0.t   -> 'a t option -> 'a t
  val substitute_texpr   : 'a Manager.t -> 'a t -> Dim.t -> Texpr0.t   -> 'a t option -> 'a t
  (** Assignement/Substitution of a single dimension by a single expression *)
  
  val assign_linexpr_with     : 'a Manager.t -> 'a t -> Dim.t -> Linexpr0.t -> 'a t option -> unit
  val substitute_linexpr_with : 'a Manager.t -> 'a t -> Dim.t -> Linexpr0.t -> 'a t option -> unit
  val assign_texpr_with       : 'a Manager.t -> 'a t -> Dim.t -> Texpr0.t   -> 'a t option -> unit
  val substitute_texpr_with   : 'a Manager.t -> 'a t -> Dim.t -> Texpr0.t   -> 'a t option -> unit
  (** Side-effect version of the previous functions *)
  
  
  
  (** General use *)
  val print_array :
  ?first:(unit, Format.formatter, unit) format ->
  ?sep:(unit, Format.formatter, unit) format ->
  ?last:(unit, Format.formatter, unit) format ->
  (Format.formatter -> 'a -> unit) -> Format.formatter -> 'a array -> unit
  
end


(** {2 Module [ Var]: APRON Variables} *)

module Var : sig
  
  (* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
     Please read the COPYING file packaged in the distribution *)
  (* File generated from var.idl *)
  
  type t
  
  (** APRON Variables *)
  
  (** Constructor *)
  external of_string : string -> t
  	= "camlidl_var_ap_var_of_string"
  
  (** Comparison function *)
  external compare : t -> t -> int
  	= "camlidl_var_ap_var_compare"
  
  (** Conversion to string *)
  external to_string : t -> string
  	= "camlidl_var_ap_var_to_string"
  
  (** Hash function *)
  external hash : t -> int
  	= "camlidl_var_ap_var_hash"
  
  
  (** Printing function *)
  val print : Format.formatter -> t -> unit
  
  
  (** Initialisation of abstract type operations in C library *)
  external set_var_operations : unit -> unit = "camlidl_apron_set_var_operations"
end


(** {2 Module [ Environment]: APRON Environments binding dimensions to names} *)

module Environment : sig
  
  (* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
     Please read the COPYING file packaged in the distribution *)
  (* File generated from environment.idl *)
  
  type typvar =
    | INT
    | REAL
  and t
  
  (** APRON Environments binding dimensions to names *)
  
  (** Making an environment from a set of integer and real variables. Raise [Failure] in case of name conflict. *)
  external make : Var.t array -> Var.t array -> t
  	= "camlidl_environment_ap_environment_make"
  
  
  (** Adding to an environment a set of integer and real variables. Raise [Failure] in case of name conflict. *)
  external add : t -> Var.t array -> Var.t array -> t
  	= "camlidl_environment_ap_environment_add"
  
  
  (** Remove from an environment a set of variables. Raise [Failure] in case of non-existing variables. *)
  external remove : t -> Var.t array -> t
  	= "camlidl_environment_ap_environment_remove"
  
  
  (** Renaming in an environment a set of variables. Raise [Failure] in case of interferences with the variables that are not renamed. *)
  external rename : t -> Var.t array -> Var.t array -> t
  	= "camlidl_environment_ap_environment_rename"
  
  
  (** Similar to previous function, but returns also 
  the permutation on dimensions induced by the renaming. *)
  external rename_perm : t -> Var.t array -> Var.t array -> t * Dim.perm
  	= "camlidl_environment_ap_environment_rename_perm"
  
  
  
  (** Compute the least common environment of 2 environment, 
  that is, the environment composed of all the variables 
  of the 2 environments.
  Raise [Failure] if the same variable has different types 
  in the 2 environment.*)
  external lce : t -> t -> t
  	= "camlidl_environment_ap_environment_lce"
  
  
  
  (** Similar to the previous function, but returns also the transformations 
  required to convert from [e1] (resp. [e2]) 
  to the lce. If [None] is returned, this means 
  that [e1] (resp. [e2]) is identic to the lce.*)
  external lce_change : t -> t -> t * Dim.change option * Dim.change option
  	= "camlidl_environment_ap_environment_lce_change"
  
  
  
  (** [dimchange e1 e2] computes the transformation for 
  converting from an environment [e1] to a superenvironment 
  [e2]. Raises [Failure] if [e2] is not a superenvironment.*)
  external dimchange : t -> t -> Dim.change
  	= "camlidl_environment_ap_environment_dimchange"
  
  
  
  (** [dimchange2 e1 e2] computes the transformation for 
   converting from an environment [e1] to a (compatible) environment 
   [e2], by first adding (some) variables of [e2] and then removing 
  (some) variables of [e1]. Raises [Failure] if the two environments 
  are incompatible.
  *)
  external dimchange2 : t -> t -> Dim.change2
  	= "camlidl_environment_ap_environment_dimchange2"
  
  
  (** Test equality if two environments *)
  external equal : t -> t -> bool
  	= "camlidl_environment_ap_environment_equal"
  
  
  (** Compare two environment. [compare env1 env2] return [-2] if the environments are not compatible (a variable has different types in the 2 environments), [-1] if [env1] is a subset of env2, [0] if equality,  [+1] if env1 is a superset of env2, and [+2] otherwise (the lce exists and is a strict superset of both) *)
  external compare : t -> t -> int
  	= "camlidl_environment_ap_environment_compare"
  
  
  (** Hashing function for environments *)
  external hash : t -> int
  	= "camlidl_environment_ap_environment_hash"
  
  
  (** Return the dimension of the environment *)
  external dimension : t -> Dim.dimension
  	= "camlidl_environment_ap_environment_dimension"
  
  
  (** Return the size of the environment *)
  external size : t -> int
  	= "camlidl_environment_ap_environment_size"
  
  
  (** Return true if the variable is present in the environment. *)
  external mem_var : t -> Var.t -> bool
  	= "camlidl_environment_ap_environment_mem_var"
  
  
  (** Return the type of variables in the environment. If the variable does not belong to the environment, raise a [Failure] exception. *)
  external typ_of_var : t -> Var.t -> typvar
  	= "camlidl_environment_ap_environment_typ_of_var"
  
  
  (** Return the (lexicographically ordered) sets of integer and real variables in the environment *)
  external vars : t -> Var.t array * Var.t array
  	= "camlidl_environment_ap_environment_vars"
  
  
  (** Return the variable corresponding to the given dimension in the environment. Raise [Failure] is the dimension is out of the range of the environment (greater than or equal to [dim env]) *)
  external var_of_dim : t -> Dim.t -> Var.t
  	= "camlidl_environment_ap_environment_var_of_dim"
  
  
  (** Return the dimension associated to the given variable in the environment. Raise [Failure] if the variable does not belong to the environment. *)
  external dim_of_var : t -> Var.t -> Dim.t
  	= "camlidl_environment_ap_environment_dim_of_var"
  
  
  (** Printing *)
  val print :
  ?first:(unit, Format.formatter, unit) format ->
  ?sep:(unit, Format.formatter, unit) format ->
  ?last:(unit, Format.formatter, unit) format ->
  Format.formatter -> t -> unit
  
end


(** {2 Module [ Linexpr1]: APRON Expressions of level 1} *)

module Linexpr1 : sig
  
  (* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
     Please read the COPYING file packaged in the distribution *)
  (* File generated from linexpr1.idl *)
  
  type t = {
    mutable linexpr0: Linexpr0.t;
    mutable env: Environment.t;
  }
  
  (** APRON Expressions of level 1 *)
  
  
  (** Build a linear expression defined on the given argument, which is sparse by
  default. *)
  val make: ?sparse:bool -> Environment.t -> t
  
  (** In case of sparse representation, remove zero coefficients  *)
  val minimize: t -> unit
  
  (** Copy *)
  val copy: t -> t
  
  (** Print the linear expression *)
  val print: Format.formatter -> t -> unit
  
  val set_list : t -> (Coeff.t * Var.t) list -> Coeff.t option -> unit
  (** Set simultaneously a number of coefficients.
  
  [set_list expr [(c1,"x"); (c2,"y")] (Some cst)] assigns coefficients [c1] 
  to variable ["x"], coefficient [c2] to variable ["y"], and coefficient [cst]
  to the constant. If [(Some cst)] is replaced by [None],
  the constant coefficient is not assigned. *)
  val set_array : t -> (Coeff.t * Var.t) array -> Coeff.t option -> unit
  (** Set simultaneously a number of coefficients, as [set_list]. *)
  
  (** Iter the function on the pair coefficient/variable of the linear expression *)
  val iter: (Coeff.t -> Var.t -> unit) -> t -> unit
  
  (** Get the constant *)
  val get_cst: t -> Coeff.t
  
  (** Set the constant *)
  val set_cst: t -> Coeff.t -> unit
  
  (** Get the coefficient of the variable *)
  external get_coeff : t -> Var.t -> Coeff.t
  	= "camlidl_linexpr1_ap_linexpr1_get_coeff"
  
  (** Set the coefficient of the variable *)
  external set_coeff : t -> Var.t -> Coeff.t -> unit
  	= "camlidl_linexpr1_ap_linexpr1_set_coeff"
  
  (** Change the environment of the expression for a super-environment. Raise [Failure] if it is not the case *)
  external extend_environment : t -> Environment.t -> t
  	= "camlidl_linexpr1_ap_linexpr1_extend_environment"
  
  (** Side-effet version of the previous function *)
  external extend_environment_with : t -> Environment.t -> unit
  	= "camlidl_linexpr1_ap_linexpr1_extend_environment_with"
  
  (** Does the linear expression depend only on integer variables ? *)
  external is_integer : t -> bool
  	= "camlidl_linexpr1_ap_linexpr1_is_integer"
  
  (** Does the linear expression depend only on real variables ? *)
  external is_real : t -> bool
  	= "camlidl_linexpr1_ap_linexpr1_is_real"
  
  
  (** Get the underlying expression of level 0 (which is not a copy). *)
  val get_linexpr0: t -> Linexpr0.t
  
  (** Get the environment of the expression *)
  val get_env: t -> Environment.t
  
  
end


(** {2 Module [ Lincons1]: APRON Constraints and array of constraints of level 1} *)

module Lincons1 : sig
  
  (* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
     Please read the COPYING file packaged in the distribution *)
  (* File generated from lincons1.idl *)
  
  type t = {
    mutable lincons0: Lincons0.t;
    mutable env: Environment.t;
  }
  and earray = {
    mutable lincons0_array: Lincons0.t array;
    mutable array_env: Environment.t;
  }
  
  (** APRON Constraints and array of constraints of level 1 *)
  
  type typ = Lincons0.typ =
  | EQ
  | SUPEQ
  | SUP
  | DISEQ
  | EQMOD of Scalar.t
  
  
  (** Make a linear constraint. Modifying later the linear expression ({e not
  advisable}) modifies correspondingly the linear constraint and conversely,
  except for changes of environments *)
  val make: Linexpr1.t -> typ -> t
  
  (** Copy (deep copy) *)
  val copy: t -> t
  
  (** Convert a constraint type to a string ([=],[>=], or [>]) *)
  val string_of_typ : typ -> string
  
  (** Print the linear constraint *)
  val print : Format.formatter -> t -> unit
  
  (** Get the constraint type *)
  val get_typ: t -> typ
  
  (** Iter the function on the pair coefficient/variable of the underlying linear
  expression *)
  val iter: (Coeff.t -> Var.t -> unit) -> t -> unit
  
  (** Get the constant of the underlying linear expression *)
  val get_cst: t -> Coeff.t
  
  (** Set the constraint type *)
  val set_typ: t -> typ -> unit
  
  (** Set simultaneously a number of coefficients.
  
  [set_list expr [(c1,"x"); (c2,"y")] (Some cst)] assigns coefficients [c1] 
  to variable ["x"], coefficient [c2] to variable ["y"], and coefficient [cst]
  to the constant. If [(Some cst)] is replaced by [None],
  the constant coefficient is not assigned. *)
  val set_list : t -> (Coeff.t * Var.t) list -> Coeff.t option -> unit
  
  (** Set simultaneously a number of coefficients, as [set_list]. *)
  val set_array : t -> (Coeff.t * Var.t) array -> Coeff.t option -> unit
  
  (** Set the constant of the underlying linear expression *)
  val set_cst: t -> Coeff.t -> unit
  
  (** Get the coefficient of the variable in the underlying linear expression *)
  external get_coeff : t -> Var.t -> Coeff.t
  	= "camlidl_lincons1_ap_lincons1_get_coeff"
  
  (** Set the coefficient of the variable in the underlying linear expression *)
  external set_coeff : t -> Var.t -> Coeff.t -> unit
  	= "camlidl_lincons1_ap_lincons1_set_coeff"
  
  (** Build the unsatisfiable constraint -1>=0 *)
  external make_unsat : Environment.t -> t
  	= "camlidl_lincons1_ap_lincons1_make_unsat"
  
  (** Is the constraint not satisfiable ? *)
  external is_unsat : t -> bool
  	= "camlidl_lincons1_ap_lincons1_is_unsat"
  
  (** Change the environment of the constraint for a super-environment. Raise [Failure] if it is not the case *)
  external extend_environment : t -> Environment.t -> t
  	= "camlidl_lincons1_ap_lincons1_extend_environment"
  
  (** Side-effect version of the previous function *)
  external extend_environment_with : t -> Environment.t -> unit
  	= "camlidl_lincons1_ap_lincons1_extend_environment_with"
  
  
  (** Get the environment of the linear constraint *)
  val get_env: t -> Environment.t
  
  (** Get the underlying linear expression. Modifying the linear expression ({e
  not advisable}) modifies correspondingly the linear constraint and
  conversely, except for changes of environments *)
  val get_linexpr1: t -> Linexpr1.t
  
  (** Get the underlying linear constraint of level 0. Modifying the constraint
  of level 0 ({e not advisable}) modifies correspondingly the linear constraint
  and conversely, except for changes of environments*)
  val get_lincons0: t -> Lincons0.t
  
  
  (* ====================================================================== *)
  (** {3 Type array} *)
  (* ====================================================================== *)
  
  (** Make an array of linear constraints with the given size and defined on the
  given environment. The elements are initialized with the constraint 0=0. *)
  val array_make : Environment.t -> int -> earray
  
  (** Print an array of constraints *)
  val array_print :
  ?first:(unit, Format.formatter, unit) format ->
  ?sep:(unit, Format.formatter, unit) format ->
  ?last:(unit, Format.formatter, unit) format ->
  Format.formatter -> earray -> unit
  
  (** Get the size of the array *)
  val array_length : earray -> int
  
  (** Get the environment of the array *)
  val array_get_env : earray -> Environment.t
  
  (** Get the element of the given index (which is not a copy) *)
  val array_get : earray -> int -> t
  
  (** Set the element of the given index (without any copy). The array and the
  constraint should be defined on the same environment; otherwise a [Failure]
  exception is raised.*)
  val array_set : earray -> int -> t -> unit
  
  (** Change the environment of the array of constraints for a super-environment. Raise [Failure] if it is not the case*)
  external array_extend_environment : earray -> Environment.t -> earray
  	= "camlidl_lincons1_ap_lincons1_array_extend_environment"
  
  (** Side-effect version of the previous function *)
  external array_extend_environment_with : earray -> Environment.t -> unit
  	= "camlidl_lincons1_ap_lincons1_array_extend_environment_with"
  
end


(** {2 Module [ Generator1]: APRON Generators and array of generators of level 1} *)

module Generator1 : sig
  
  (* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
     Please read the COPYING file packaged in the distribution *)
  (* File generated from generator1.idl *)
  
  type t = {
    mutable generator0: Generator0.t;
    mutable env: Environment.t;
  }
  and earray = {
    mutable generator0_array: Generator0.t array;
    mutable array_env: Environment.t;
  }
  
  (** APRON Generators and array of generators of level 1 *)
  
  type typ = Generator0.typ = 
  | LINE
  | RAY
  | VERTEX
  | LINEMOD
  | RAYMOD
  
  
  (** Make a generator. Modifying later the linear expression ({e not
  advisable}) modifies correspondingly the generator and conversely,
  except for changes of environments *)
  val make: Linexpr1.t -> Generator0.typ -> t
  
  (** Copy (deep copy) *)
  val copy: t -> t
  
  (** Print the generator *)
  val print : Format.formatter -> t -> unit
  
  (** Get the generator type *)
  val get_typ: t -> Generator0.typ
  
  (** Iter the function on the pair coefficient/variable of the underlying linear
  expression *)
  val iter: (Coeff.t -> Var.t -> unit) -> t -> unit
  
  (** Set the generator type *)
  val set_typ: t -> Generator0.typ -> unit
  
  (** Set simultaneously a number of coefficients.
  
  [set_list expr [(c1,"x"); (c2,"y")]] assigns coefficients [c1] 
  to variable ["x"] and coefficient [c2] to variable ["y"]. *)
  val set_list : t -> (Coeff.t * Var.t) list -> unit
  
  (** Set simultaneously a number of coefficients, as [set_list]. *)
  val set_array : t -> (Coeff.t * Var.t) array -> unit
  
  
  (** Get the coefficient of the variable in the underlying linear expression *)
  external get_coeff : t -> Var.t -> Coeff.t
  	= "camlidl_generator1_ap_generator1_get_coeff"
  
  (** Set the coefficient of the variable in the underlying linear expression *)
  external set_coeff : t -> Var.t -> Coeff.t -> unit
  	= "camlidl_generator1_ap_generator1_set_coeff"
  
  (** Change the environment of the generator for a super-environment. Raise [Failure] if it is not the case *)
  external extend_environment : t -> Environment.t -> t
  	= "camlidl_generator1_ap_generator1_extend_environment"
  
  (** Side-effect version of the previous function *)
  external extend_environment_with : t -> Environment.t -> unit
  	= "camlidl_generator1_ap_generator1_extend_environment_with"
  
  (* ====================================================================== *)
  (** {3 Type earray} *)
  (* ====================================================================== *)
  
  (** Make an array of generators with the given size and defined on the
  given environment. The elements are initialized with the line 0. *)
  val array_make : Environment.t -> int -> earray
  
  (** Print an array of generators *)
  val array_print :
  ?first:(unit, Format.formatter, unit) format ->
  ?sep:(unit, Format.formatter, unit) format ->
  ?last:(unit, Format.formatter, unit) format ->
  Format.formatter -> earray -> unit
  
  (** Get the size of the array *)
  val array_length : earray -> int
  
  (** Get the element of the given index (which is not a copy) *)
  val array_get : earray -> int -> t
  
  (** Set the element of the given index (without any copy). The array and the
  generator should be defined on the same environment; otherwise a [Failure]
  exception is raised.*)
  val array_set : earray -> int -> t -> unit
  
  (** Change the environment of the array of generators for a super-environment. Raise [Failure] if it is not the case*)
  external array_extend_environment : earray -> Environment.t -> earray
  	= "camlidl_generator1_ap_generator1_array_extend_environment"
  
  (** Side-effect version of the previous function *)
  external array_extend_environment_with : earray -> Environment.t -> unit
  	= "camlidl_generator1_ap_generator1_array_extend_environment_with"
  
  
  (** Get the environment of the generator *)
  val get_env: t -> Environment.t
  
  (** Get the underlying linear expression. Modifying the linear expression ({e
  not advisable}) modifies correspondingly the generator and
  conversely, except for changes of environments *)
  val get_linexpr1: t -> Linexpr1.t
  
  (** Get the underlying generator of level 0. Modifying the generator
  of level 0 ({e not advisable}) modifies correspondingly the generator
  and conversely, except for changes of environments*)
  val get_generator0: t -> Generator0.t
  
end


(** {2 Module [ Texpr1]: APRON Expressions of level 1} *)

module Texpr1 : sig
  
  (* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
     Please read the COPYING file packaged in the distribution *)
  (* File generated from texpr1.idl *)
  
  type t = {
    mutable texpr0: Texpr0.t;
    mutable env: Environment.t;
  }
  
  (** APRON Expressions of level 1 *)
  
  (** Unary operators *) 
  type unop = Texpr0.unop = 
  | Neg
  | Cast
  | Sqrt
  
  (** Binary operators *) 
  type binop = Texpr0.binop = 
  | Add
  | Sub
  | Mul
  | Div
  | Mod
  | Pow
  
  (** Destination type for rounding *) 
  type typ = Texpr0.typ = 
  | Real
  | Int
  | Single
  | Double
  | Extended
  | Quad
  
  (** Rounding direction *) 
  type round = Texpr0.round = 
  | Near
  | Zero
  | Up
  | Down
  | Rnd
  
  (** User type for tree expressions *) 
  type expr = 
  | Cst of Coeff.t 
  | Var of Var.t 
  | Unop of unop * expr * typ * round 
  | Binop of binop * expr * expr * typ * round 
  
  (** {3 Constructors and Destructor} *)
  (** General constructor (actually the most efficient) *)
  val of_expr : Environment.t -> expr -> t
  
  (** Copy *)
  val copy : t -> t
  
  (** Conversion *)
  val of_linexpr : Linexpr1.t -> t
  
  (** General destructor *)
  val to_expr : t -> expr
  
  
  (** {4 Incremental constructors} *)
  
  external cst : Environment.t -> Coeff.t -> t
  	= "camlidl_texpr1_ap_texpr1_cst"
  
  val var : Environment.t -> Var.t -> t
  external unop : Texpr0.unop -> t -> Texpr0.typ -> Texpr0.round -> t
  	= "camlidl_texpr1_ap_texpr1_unop"
  
  external binop : Texpr0.binop -> t -> t -> Texpr0.typ -> Texpr0.round -> t
  	= "camlidl_texpr1_ap_texpr1_binop"
  
  
  (** {3 Tests} *)
  
  val is_interval_cst : t -> bool 
  val is_interval_linear : t -> bool 
  val is_interval_polynomial : t -> bool 
  val is_interval_polyfrac : t -> bool 
  val is_scalar : t -> bool 
  
  
  (** {3 Operations} *)
  
  (** Change the environment of the expression for a super-environment. Raise [Failure] if it is not the case *)
  external extend_environment : t -> Environment.t -> t
  	= "camlidl_texpr1_ap_texpr1_extend_environment"
  
  (** Side-effet version of the previous function *)
  external extend_environment_with : t -> Environment.t -> unit
  	= "camlidl_texpr1_ap_texpr1_extend_environment_with"
  
  
  (** Get the underlying expression of level 0 (which is not a copy). *)
  val get_texpr0: t -> Texpr0.t
  
  (** Get the environment of the expression *)
  val get_env: t -> Environment.t
  
  
  
  (** {3 Printing} *)
  
  
  val string_of_unop  : unop  -> string
  val string_of_binop : binop -> string
  val string_of_typ   : typ   -> string
  val string_of_round : round -> string
  val print_unop  :  Format.formatter -> unop  -> unit
  val print_binop :  Format.formatter -> binop -> unit
  val print_typ   :  Format.formatter -> typ   -> unit
  val print_round :  Format.formatter -> round -> unit
  val print_expr : Format.formatter -> expr -> unit
  (** Print a tree expression *)
  val print : Format.formatter -> t -> unit
  (** Print an abstract tree expression *)
  
end


(** {2 Module [ Tcons1]: APRON tree constraints and array of tree constraints of level 1} *)

module Tcons1 : sig
  
  (* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
     Please read the COPYING file packaged in the distribution *)
  (* File generated from tcons1.idl *)
  
  type t = {
    mutable tcons0: Tcons0.t;
    mutable env: Environment.t;
  }
  and earray = {
    mutable tcons0_array: Tcons0.t array;
    mutable array_env: Environment.t;
  }
  
  (** APRON tree constraints and array of tree constraints of level 1 *)
  
  type typ = Lincons0.typ =
  | EQ
  | SUPEQ
  | SUP
  | DISEQ
  | EQMOD of Scalar.t
  
  
  (** Make a tree expression constraint. Modifying later the linear expression ({e not
  advisable}) modifies correspondingly the tree expression constraint and conversely,
  except for changes of environments *)
  val make: Texpr1.t -> typ -> t
  
  (** Copy (deep copy) *)
  val copy: t -> t
  
  (** Convert a constraint type to a string ([=],[>=], or [>]) *)
  val string_of_typ : typ -> string
  
  (** Print the tree expression constraint *)
  val print : Format.formatter -> t -> unit
  
  (** Get the constraint type *)
  val get_typ: t -> typ
  
  (** Set the constraint type *)
  val set_typ: t -> typ -> unit
  
  
  (** Change the environment of the constraint for a super-environment. Raise [Failure] if it is not the case *)
  external extend_environment : t -> Environment.t -> t
  	= "camlidl_tcons1_ap_tcons1_extend_environment"
  
  (** Side-effect version of the previous function *)
  external extend_environment_with : t -> Environment.t -> unit
  	= "camlidl_tcons1_ap_tcons1_extend_environment_with"
  
  
  (** Get the environment of the tree expression constraint *)
  val get_env: t -> Environment.t
  
  (** Get the underlying linear expression. Modifying the linear expression ({e
  not advisable}) modifies correspondingly the tree expression constraint and
  conversely, except for changes of environments *)
  val get_texpr1: t -> Texpr1.t
  
  (** Get the underlying tree expression constraint of level 0. Modifying the constraint
  of level 0 ({e not advisable}) modifies correspondingly the tree expression constraint
  and conversely, except for changes of environments*)
  val get_tcons0: t -> Tcons0.t
  
  
  (* ====================================================================== *)
  (** {3 Type array} *)
  (* ====================================================================== *)
  
  (** Make an array of tree expression constraints with the given size and defined on the
  given environment. The elements are initialized with the constraint 0=0. *)
  val array_make : Environment.t -> int -> earray
  
  (** Print an array of constraints *)
  val array_print :
  ?first:(unit, Format.formatter, unit) format ->
  ?sep:(unit, Format.formatter, unit) format ->
  ?last:(unit, Format.formatter, unit) format ->
  Format.formatter -> earray -> unit
  
  (** Get the size of the array *)
  val array_length : earray -> int
  
  (** Get the environment of the array *)
  val array_get_env : earray -> Environment.t
  
  (** Get the element of the given index (which is not a copy) *)
  val array_get : earray -> int -> t
  
  (** Set the element of the given index (without any copy). The array and the
  constraint should be defined on the same environment; otherwise a [Failure]
  exception is raised.*)
  val array_set : earray -> int -> t -> unit
  
  (** Change the environment of the array of constraints for a super-environment. Raise [Failure] if it is not the case*)
  external array_extend_environment : earray -> Environment.t -> earray
  	= "camlidl_tcons1_ap_tcons1_array_extend_environment"
  
  (** Side-effect version of the previous function *)
  external array_extend_environment_with : earray -> Environment.t -> unit
  	= "camlidl_tcons1_ap_tcons1_array_extend_environment_with"
  
end


(** {2 Module [ Abstract1]: APRON Abstract values of level 1} *)

module Abstract1 : sig
  
  (* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
     Please read the COPYING file packaged in the distribution *)
  (* File generated from abstract1.idl *)
  
  type 'a t = {
    mutable abstract0: 'a Abstract0.t;
    mutable env: Environment.t;
  }
  
  (** APRON Abstract values of level 1 *)
  (** The type parameter ['a] allows to distinguish abstract values with different underlying abstract domains. *)
  
  type box1 = { mutable interval_array : Interval.t array; mutable box1_env : Environment.t }
  (* ********************************************************************** *)
  (** {3 General management} *)
  (* ********************************************************************** *)
  (* ============================================================ *)
  (** {4 Memory} *)
  (* ============================================================ *)
  
  (** Copy a value *)
  val copy : 'a Manager.t -> 'a t -> 'a t
  
  (** Return the abstract size of a value *)
  val size : 'a Manager.t -> 'a t -> int
  
  (* ============================================================ *)
  (** {4 Control of internal representation} *)
  (* ============================================================ *)
  
  (** Minimize the size of the representation of the value. This may result in a later recomputation of internal information.*)
  val minimize : 'a Manager.t -> 'a t -> unit
  
  (** Put the abstract value in canonical form. (not yet clear definition) *)
  val canonicalize : 'a Manager.t -> 'a t -> unit
  
  val hash : 'a Manager.t -> 'a t -> int
  
  (** [approximate man abs alg] perform some transformation on the abstract value, guided by the argument [alg]. The transformation may lose information.  The argument [alg] overrides the field algorithm of the structure of type [Manager.funopt] associated to ap_abstract0_approximate (commodity feature).*)
  val approximate : 'a Manager.t -> 'a t -> int -> unit
  
  
  (* ============================================================ *)
  (** {4 Printing} *)
  (* ============================================================ *)
  
  (** Dump on the [stdout] C stream the internal representation of an abstract value, for debugging purposes *)
  external fdump : 'a Manager.t -> 'a t -> unit
  	= "camlidl_abstract1_ap_abstract1_fdump"
  
  
  (** Print as a set of constraints *)
  val print: Format.formatter -> 'a t -> unit
  (* ============================================================ *)
  (** {4 Serialization} *)
  (* ============================================================ *)
  (* ********************************************************************** *)
  (** {3 Constructor, accessors, tests and property extraction} *)
  (* ********************************************************************** *)
  (* ============================================================ *)
  (** {4 Basic constructors} *)
  
  (* ============================================================ *)
  (** All these functions request explicitly an environment in their arguments. *)
  
  
  (** Create a bottom (empty) value defined on the given environment *)
  external bottom : 'a Manager.t -> Environment.t -> 'a t
  	= "camlidl_abstract1_ap_abstract1_bottom"
  
  
  (** Create a top (universe) value defined on the given environment *)
  external top : 'a Manager.t -> Environment.t -> 'a t
  	= "camlidl_abstract1_ap_abstract1_top"
  
  
  (** Abstract an hypercube.
  
  [of_box man env tvar tinterval] abstracts an hypercube defined by the arrays [tvar] and [tinterval]. The result is defined on the environment [env], which should contain all the variables in [tvar] (and defines their type) *)
  external of_box : 'a Manager.t -> Environment.t -> Var.t array -> Interval.t array -> 'a t
  	= "camlidl_abstract1_ap_abstract1_of_box"
  
  (* ============================================================ *)
  (** {4 Accessors} *)
  
  (* ============================================================ *)
  
  val manager : 'a t -> 'a Manager.t
  val env : 'a t -> Environment.t
  val abstract0 : 'a t -> 'a Abstract0.t
  (** Return resp. the underlying manager, environment and abstract value of level 0 *)
  
  (* ============================================================ *)
  (** {4 Tests} *)
  
  (* ============================================================ *)
  
  (** Emptiness test *)
  val is_bottom : 'a Manager.t -> 'a t -> bool
  
  (** Universality test *)
  val is_top : 'a Manager.t -> 'a t -> bool
  
  
  (** Inclusion test. The 2 abstract values should be compatible. *)
  external is_leq : 'a Manager.t -> 'a t -> 'a t -> bool
  	= "camlidl_abstract1_ap_abstract1_is_leq"
  
  
  (** Equality test. The 2 abstract values should be compatible. *)
  external is_eq : 'a Manager.t -> 'a t -> 'a t -> bool
  	= "camlidl_abstract1_ap_abstract1_is_eq"
  
  
  (** Does the abstract value satisfy the linear constraint ? *)
  external sat_lincons : 'a Manager.t -> 'a t -> Lincons1.t -> bool
  	= "camlidl_abstract1_ap_abstract1_sat_lincons"
  
  
  (** Does the abstract value satisfy the tree expression constraint ? *)
  external sat_tcons : 'a Manager.t -> 'a t -> Tcons1.t -> bool
  	= "camlidl_abstract1_ap_abstract1_sat_tcons"
  
  
  (** Does the abstract value satisfy the constraint [dim in interval] ? *)
  external sat_interval : 'a Manager.t -> 'a t -> Var.t -> Interval.t -> bool
  	= "camlidl_abstract1_ap_abstract1_sat_interval"
  
  
  (** Is the variable unconstrained in the abstract value ? If yes, this means that the existential quantification of the dimension does not change the value. *)
  external is_variable_unconstrained : 'a Manager.t -> 'a t -> Var.t -> bool
  	= "camlidl_abstract1_ap_abstract1_is_variable_unconstrained"
  
  (* ============================================================ *)
  (** {4 Extraction of properties} *)
  
  (* ============================================================ *)
  
  (** Return the interval of variation of the variable in the abstract value. *)
  external bound_variable : 'a Manager.t -> 'a t -> Var.t -> Interval.t
  	= "camlidl_abstract1_ap_abstract1_bound_variable"
  
  
  (** Return the interval of variation of the linear expression in the abstract value. 
  
  Implement a form of linear programming, where the argument linear expression is the one to optimize under the constraints induced by the abstract value. *)
  external bound_linexpr : 'a Manager.t -> 'a t -> Linexpr1.t -> Interval.t
  	= "camlidl_abstract1_ap_abstract1_bound_linexpr"
  
  
  (** Return the interval of variation of the tree expression in the abstract value. *)
  external bound_texpr : 'a Manager.t -> 'a t -> Texpr1.t -> Interval.t
  	= "camlidl_abstract1_ap_abstract1_bound_texpr"
  
  
  (** Convert the abstract value to an hypercube *)
  val to_box : 'a Manager.t -> 'a t -> box1
  
  (** Convert the abstract value to a conjunction of linear constraints. *)
  val to_lincons_array : 'a Manager.t -> 'a t -> Lincons1.earray
  (** Convert the abstract value to a conjunction of tree expressions constraints. *)
  val to_tcons_array : 'a Manager.t -> 'a t -> Tcons1.earray
  
  (** Convert the abstract value to a set of generators that defines it. *)
  val to_generator_array : 'a Manager.t -> 'a t -> Generator1.earray
  
  
  (* ********************************************************************** *)
  (** {3 Operations} *)
  (* ********************************************************************** *)
  (* ============================================================ *)
  (** {4 Meet and Join} *)
  
  (* ============================================================ *)
  (** Meet of 2 abstract values. *)
  external meet : 'a Manager.t -> 'a t -> 'a t -> 'a t
  	= "camlidl_abstract1_ap_abstract1_meet"
  
  (** Meet of a non empty array of abstract values. *)
  external meet_array : 'a Manager.t -> 'a t array -> 'a t
  	= "camlidl_abstract1_ap_abstract1_meet_array"
  
  (** Meet of an abstract value with an array of linear constraints. *)
  external meet_lincons_array : 'a Manager.t -> 'a t -> Lincons1.earray -> 'a t
  	= "camlidl_abstract1_ap_abstract1_meet_lincons_array"
  
  (** Meet of an abstract value with an array of tree expressions constraints. *)
  external meet_tcons_array : 'a Manager.t -> 'a t -> Tcons1.earray -> 'a t
  	= "camlidl_abstract1_ap_abstract1_meet_tcons_array"
  
  (** Join of 2 abstract values. *)
  external join : 'a Manager.t -> 'a t -> 'a t -> 'a t
  	= "camlidl_abstract1_ap_abstract1_join"
  
  (** Join of a non empty array of abstract values. *)
  external join_array : 'a Manager.t -> 'a t array -> 'a t
  	= "camlidl_abstract1_ap_abstract1_join_array"
  
  (** Add the array of generators to the abstract value (time elapse operator).
  
   The generators should either lines or rays, not vertices. *)
  external add_ray_array : 'a Manager.t -> 'a t -> Generator1.earray -> 'a t
  	= "camlidl_abstract1_ap_abstract1_add_ray_array"
  
  
  (** {6 Side-effect versions of the previous functions} *)
  
  external meet_with : 'a Manager.t -> 'a t -> 'a t -> unit
  	= "camlidl_abstract1_ap_abstract1_meet_with"
  
  external meet_lincons_array_with : 'a Manager.t -> 'a t -> Lincons1.earray -> unit
  	= "camlidl_abstract1_ap_abstract1_meet_lincons_array_with"
  
  external meet_tcons_array_with : 'a Manager.t -> 'a t -> Tcons1.earray -> unit
  	= "camlidl_abstract1_ap_abstract1_meet_tcons_array_with"
  
  external join_with : 'a Manager.t -> 'a t -> 'a t -> unit
  	= "camlidl_abstract1_ap_abstract1_join_with"
  
  external add_ray_array_with : 'a Manager.t -> 'a t -> Generator1.earray -> unit
  	= "camlidl_abstract1_ap_abstract1_add_ray_array_with"
  
  (* ============================================================ *)
  (** {4 Assignement and Substitutions} *)
  
  (* ============================================================ *)
  (** Parallel assignement of an array of dimensions by an array of same size of linear expressions *)
  external assign_linexpr_array : 'a Manager.t -> 'a t -> Var.t array -> Linexpr1.t array -> 'a t option -> 'a t
  	= "camlidl_abstract1_ap_abstract1_assign_linexpr_array"
  
  (** Parallel substitution of an array of dimensions by an array of same size of linear expressions *)
  external substitute_linexpr_array : 'a Manager.t -> 'a t -> Var.t array -> Linexpr1.t array -> 'a t option -> 'a t
  	= "camlidl_abstract1_ap_abstract1_substitute_linexpr_array"
  
  (** Parallel assignement of an array of dimensions by an array of same size of tree expressions *)
  external assign_texpr_array : 'a Manager.t -> 'a t -> Var.t array -> Texpr1.t array -> 'a t option -> 'a t
  	= "camlidl_abstract1_ap_abstract1_assign_texpr_array"
  
  (** Parallel substitution of an array of dimensions by an array of same size of tree expressions *)
  external substitute_texpr_array : 'a Manager.t -> 'a t -> Var.t array -> Texpr1.t array -> 'a t option -> 'a t
  	= "camlidl_abstract1_ap_abstract1_substitute_texpr_array"
  
  
  (** {6 Side-effect versions of the previous functions} *)
  
  external assign_linexpr_array_with : 'a Manager.t -> 'a t -> Var.t array -> Linexpr1.t array -> 'a t option -> unit
  	= "camlidl_abstract1_ap_abstract1_assign_linexpr_array_with"
  
  external substitute_linexpr_array_with : 'a Manager.t -> 'a t -> Var.t array -> Linexpr1.t array -> 'a t option -> unit
  	= "camlidl_abstract1_ap_abstract1_substitute_linexpr_array_with"
  
  external assign_texpr_array_with : 'a Manager.t -> 'a t -> Var.t array -> Texpr1.t array -> 'a t option -> unit
  	= "camlidl_abstract1_ap_abstract1_assign_texpr_array_with"
  
  external substitute_texpr_array_with : 'a Manager.t -> 'a t -> Var.t array -> Texpr1.t array -> 'a t option -> unit
  	= "camlidl_abstract1_ap_abstract1_substitute_texpr_array_with"
  
  (* ============================================================ *)
  (** {4 Projections} *)
  
  (* ============================================================ *)
  (** These functions implements forgeting (existential quantification) of (array of) variables. Both functional and side-effect versions are provided. The Boolean, if true, adds a projection onto 0-plane. *)
  
  
  external forget_array : 'a Manager.t -> 'a t -> Var.t array -> bool -> 'a t
  	= "camlidl_abstract1_ap_abstract1_forget_array"
  
  external forget_array_with : 'a Manager.t -> 'a t -> Var.t array -> bool -> unit
  	= "camlidl_abstract1_ap_abstract1_forget_array_with"
  
  (* ============================================================ *)
  (** {4 Change and permutation of dimensions} *)
  
  (* ============================================================ *)
  (** Change the environment of the abstract values.
  
  Variables that are removed are first existentially quantified, and variables that are introduced are unconstrained. The Boolean, if true, adds a projection onto 0-plane for these ones. *)
  external change_environment : 'a Manager.t -> 'a t -> Environment.t -> bool -> 'a t
  	= "camlidl_abstract1_ap_abstract1_change_environment"
  
  (** Remove from the environment of the abstract value and from the abstract value itself variables that are unconstrained in it. *)
  external minimize_environment : 'a Manager.t -> 'a t -> 'a t
  	= "camlidl_abstract1_ap_abstract1_minimize_environment"
  
  (** Parallel renaming of the environment of the abstract value.
  
  The new variables should not interfere with the variables that are not renamed. *)
  external rename_array : 'a Manager.t -> 'a t -> Var.t array -> Var.t array -> 'a t
  	= "camlidl_abstract1_ap_abstract1_rename_array"
  
  external change_environment_with : 'a Manager.t -> 'a t -> Environment.t -> bool -> unit
  	= "camlidl_abstract1_ap_abstract1_change_environment_with"
  
  external minimize_environment_with : 'a Manager.t -> 'a t -> unit
  	= "camlidl_abstract1_ap_abstract1_minimize_environment_with"
  
  external rename_array_with : 'a Manager.t -> 'a t -> Var.t array -> Var.t array -> unit
  	= "camlidl_abstract1_ap_abstract1_rename_array_with"
  
  (* ============================================================ *)
  (** {4 Expansion and folding of dimensions} *)
  
  (* ============================================================ *)
  
  (**
  These functions allows to expand one dimension into several ones having the
  same properties with respect to the other dimensions, and to fold several
  dimensions into one. Formally,
  
  - expand P(x,y,z) z w = P(x,y,z) inter P(x,y,w) if z is expanded in z and w
  - fold Q(x,y,z,w) z w = exists w:Q(x,y,z,w) union (exist z:Q(x,y,z,w))(z<-w)
  if z and w are folded onto z
  *)
  
  
  (** Expansion: [expand a var tvar] expands the variable [var] into itself and
  	the additional variables in [tvar], which are given the same type as [var].
  
  It results in (n+1) unrelated variables having
  			same relations with other variables. The additional variables are added to the environment of 
  the argument for making the environment of the result, so they should
  not belong to the initial environment.
  *)
  external expand : 'a Manager.t -> 'a t -> Var.t -> Var.t array -> 'a t
  	= "camlidl_abstract1_ap_abstract1_expand"
  
   (** Folding: [fold a tvar] fold the variables in the array [tvar] of size n>=1
  and put the result in the first variable of the array. The other
  variables of the array are then removed, both from the environment and the abstract value.
  *)
  external fold : 'a Manager.t -> 'a t -> Var.t array -> 'a t
  	= "camlidl_abstract1_ap_abstract1_fold"
  
  external expand_with : 'a Manager.t -> 'a t -> Var.t -> Var.t array -> unit
  	= "camlidl_abstract1_ap_abstract1_expand_with"
  
  external fold_with : 'a Manager.t -> 'a t -> Var.t array -> unit
  	= "camlidl_abstract1_ap_abstract1_fold_with"
  
  (* ============================================================ *)
  (** {4 Widening} *)
  
  (* ============================================================ *)
  (** Widening. Assumes that the first abstract value is included in the second one. *)
  external widening : 'a Manager.t -> 'a t -> 'a t -> 'a t
  	= "camlidl_abstract1_ap_abstract1_widening"
  
  external widening_threshold : 'a Manager.t -> 'a t -> 'a t -> Lincons1.earray -> 'a t
  	= "camlidl_abstract1_ap_abstract1_widening_threshold"
  
  (* ============================================================ *)
  (** {4 Closure operation} *)
  
  (* ============================================================ *)
  (** Closure: transform strict constraints into non-strict ones.*)
  external closure : 'a Manager.t -> 'a t -> 'a t
  	= "camlidl_abstract1_ap_abstract1_closure"
  
  (** Side-effect version *)
  external closure_with : 'a Manager.t -> 'a t -> unit
  	= "camlidl_abstract1_ap_abstract1_closure_with"
  
  (* ********************************************************************** *)
  (** {3 Additional operations} *)
  (* ********************************************************************** *)
  
  val of_lincons_array : 'a Manager.t -> Environment.t -> Lincons1.earray -> 'a t
  val of_tcons_array   : 'a Manager.t -> Environment.t -> Tcons1.earray   -> 'a t
  (** Abstract a conjunction of constraints *)
  
  val assign_linexpr     : 'a Manager.t -> 'a t -> Var.t -> Linexpr1.t -> 'a t option -> 'a t
  val substitute_linexpr : 'a Manager.t -> 'a t -> Var.t -> Linexpr1.t -> 'a t option -> 'a t
  val assign_texpr       : 'a Manager.t -> 'a t -> Var.t -> Texpr1.t   -> 'a t option -> 'a t
  val substitute_texpr   : 'a Manager.t -> 'a t -> Var.t -> Texpr1.t   -> 'a t option -> 'a t
  (** Assignement/Substitution of a single dimension by a single expression *)
  
  val assign_linexpr_with     : 'a Manager.t -> 'a t -> Var.t -> Linexpr1.t -> 'a t option -> unit
  val substitute_linexpr_with : 'a Manager.t -> 'a t -> Var.t -> Linexpr1.t -> 'a t option -> unit
  val assign_texpr_with       : 'a Manager.t -> 'a t -> Var.t -> Texpr1.t   -> 'a t option -> unit
  val substitute_texpr_with   : 'a Manager.t -> 'a t -> Var.t -> Texpr1.t   -> 'a t option -> unit
  (** Side-effect version of the previous functions *)
  
  
  (** Unification of 2 abstract values on their least common environment *)
  external unify : 'a Manager.t -> 'a t -> 'a t -> 'a t
  	= "camlidl_abstract1_ap_abstract1_unify"
  
  (** Side-effect version *)
  external unify_with : 'a Manager.t -> 'a t -> 'a t -> unit
  	= "camlidl_abstract1_ap_abstract1_unify_with"
  
end


(** {2 Module [ Policy]: {3 Policy manager}} *)

module Policy : sig
  
  (* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
     Please read the COPYING file packaged in the distribution *)
  (* File generated from policy.idl *)
  
  type 'a man
  and 'a t
  
  
  (* ********************************************************************** *)
  (** {3 Policy manager} *)
  (* ********************************************************************** *)
  external manager_get_manager : 'a man -> 'a Manager.t
  	= "camlidl_policy_ap_policy_manager_get_manager"
  
  (* ********************************************************************** *)
  (** {3 Policy, general} *)
  (* ********************************************************************** *)
  external manager : 'a t -> 'a man
  	= "camlidl_policy_ap_policy_manager"
  
  external copy : 'a man -> 'a t -> 'a t
  	= "camlidl_policy_ap_policy_copy"
  
  external fdump : 'a man -> 'a t -> unit
  	= "camlidl_policy_ap_policy_fdump"
  
  external to_string : 'a man -> 'a t -> string
  	= "camlidl_policy_ap_policy_to_string"
  
  external dimension : 'a man -> 'a t -> int
  	= "camlidl_policy_ap_policy_dimension"
  
  external equal : 'a man -> 'a t -> 'a t -> bool
  	= "camlidl_policy_ap_policy_equal"
  
  (* ********************************************************************** *)
  (** {3 Policy, level 0} *)
  (* ********************************************************************** *)
  
  
  module Abstract0 : sig
  external meet_apply : 'a man -> 'a t -> 'a Abstract0.t -> 'a Abstract0.t -> 'a Abstract0.t
  	= "camlidl_policy_ap_abstract0_policy_meet_apply"
  
  external meet_array_apply : 'a man -> 'a t -> 'a Abstract0.t array -> 'a Abstract0.t
  	= "camlidl_policy_ap_abstract0_policy_meet_array_apply"
  
  external meet_lincons_array_apply : 'a man -> 'a t -> 'a Abstract0.t -> Lincons0.t array -> 'a Abstract0.t
  	= "camlidl_policy_ap_abstract0_policy_meet_lincons_array_apply"
  
  external meet_tcons_array_apply : 'a man -> 'a t -> 'a Abstract0.t -> Tcons0.t array -> 'a Abstract0.t
  	= "camlidl_policy_ap_abstract0_policy_meet_tcons_array_apply"
  
  external meet_with_apply : 'a man -> 'a t -> 'a Abstract0.t -> 'a Abstract0.t -> unit
  	= "camlidl_policy_ap_abstract0_policy_meet_with_apply"
  
  external meet_lincons_array_with_apply : 'a man -> 'a t -> 'a Abstract0.t -> Lincons0.t array -> unit
  	= "camlidl_policy_ap_abstract0_policy_meet_lincons_array_with_apply"
  
  external meet_tcons_array_with_apply : 'a man -> 'a t -> 'a Abstract0.t -> Tcons0.t array -> unit
  	= "camlidl_policy_ap_abstract0_policy_meet_tcons_array_with_apply"
  
  external meet_improve : 'a man -> 'a t option -> 'a Abstract0.t -> 'a Abstract0.t -> 'a t
  	= "camlidl_policy_ap_abstract0_policy_meet_improve"
  
  external meet_array_improve : 'a man -> 'a t option -> 'a Abstract0.t array -> 'a t
  	= "camlidl_policy_ap_abstract0_policy_meet_array_improve"
  
  external meet_lincons_array_improve : 'a man -> 'a t option -> 'a Abstract0.t -> Lincons0.t array -> 'a t
  	= "camlidl_policy_ap_abstract0_policy_meet_lincons_array_improve"
  
  external meet_tcons_array_improve : 'a man -> 'a t option -> 'a Abstract0.t -> Tcons0.t array -> 'a t
  	= "camlidl_policy_ap_abstract0_policy_meet_tcons_array_improve"
  
  end
  (* ********************************************************************** *)
  (** {3 Policy, level 1} *)
  (* ********************************************************************** *)
  
  
  module Abstract1 : sig
  external meet_apply : 'a man -> 'a t -> 'a Abstract1.t -> 'a Abstract1.t -> 'a Abstract1.t
  	= "camlidl_policy_ap_abstract1_policy_meet_apply"
  
  external meet_array_apply : 'a man -> 'a t -> 'a Abstract1.t array -> 'a Abstract1.t
  	= "camlidl_policy_ap_abstract1_policy_meet_array_apply"
  
  external meet_lincons_array_apply : 'a man -> 'a t -> 'a Abstract1.t -> Lincons1.earray -> 'a Abstract1.t
  	= "camlidl_policy_ap_abstract1_policy_meet_lincons_array_apply"
  
  external meet_tcons_array_apply : 'a man -> 'a t -> 'a Abstract1.t -> Tcons1.earray -> 'a Abstract1.t
  	= "camlidl_policy_ap_abstract1_policy_meet_tcons_array_apply"
  
  external meet_with_apply : 'a man -> 'a t -> 'a Abstract1.t -> 'a Abstract1.t -> unit
  	= "camlidl_policy_ap_abstract1_policy_meet_with_apply"
  
  external meet_lincons_array_with_apply : 'a man -> 'a t -> 'a Abstract1.t -> Lincons1.earray -> unit
  	= "camlidl_policy_ap_abstract1_policy_meet_lincons_array_with_apply"
  
  external meet_tcons_array_with_apply : 'a man -> 'a t -> 'a Abstract1.t -> Tcons1.earray -> unit
  	= "camlidl_policy_ap_abstract1_policy_meet_tcons_array_with_apply"
  
  external meet_improve : 'a man -> 'a t option -> 'a Abstract1.t -> 'a Abstract1.t -> 'a t
  	= "camlidl_policy_ap_abstract1_policy_meet_improve"
  
  external meet_array_improve : 'a man -> 'a t option -> 'a Abstract1.t array -> 'a t
  	= "camlidl_policy_ap_abstract1_policy_meet_array_improve"
  
  external meet_lincons_array_improve : 'a man -> 'a t option -> 'a Abstract1.t -> Lincons1.earray -> 'a t
  	= "camlidl_policy_ap_abstract1_policy_meet_lincons_array_improve"
  
  external meet_tcons_array_improve : 'a man -> 'a t option -> 'a Abstract1.t -> Tcons1.earray -> 'a t
  	= "camlidl_policy_ap_abstract1_policy_meet_tcons_array_improve"
  
  end
end


(** {2 Module [ Disjunction]: Disjunctions of APRON abstract values} *)

module Disjunction : sig
  
  (* This file is part of the APRON Library, released under LGPL license with an exception allowing the redistribution of statically linked executables.
     Please read the COPYING file packaged in the distribution *)
  (* File generated from disjunction.idl *)
  
  
  (** Disjunctions of APRON abstract values *)
  
  type 'a t
  
  external manager_alloc : 'a Manager.t -> 'a t Manager.t
  	= "camlidl_disjunction_ap_disjunction_manager_alloc"
  
  external manager_decompose : 'a t Manager.t -> 'a Manager.t
  	= "camlidl_disjunction_ap_disjunction_manager_decompose"
  
  external to_lincons0_set : 'a t Manager.t -> 'a t Abstract0.t -> Lincons0.t array
  	= "camlidl_disjunction_ap_disjunction_to_lincons0_set"
  
  val to_lincons1_set : 'a t Manager.t -> 'a t Abstract1.t -> Lincons1.earray
  
  
  (** Decompose an abstract value *)
  external _decompose : 'a t Manager.t -> 'a t Abstract0.t -> 'a Abstract0.t array * int
  	= "camlidl_disjunction_ap_disjunction__decompose"
  
  val decompose : 'a t Manager.t -> 'a t Abstract0.t -> 'a Abstract0.t array
  external compose : 'a t Manager.t -> 'a Abstract0.t array -> 'a t Abstract0.t
  	= "camlidl_disjunction_ap_disjunction_compose"
  
  
  (** {3 Type conversions} *)
  
  val manager_is_disjunction : 'a Manager.t -> bool
    (** Return [true] iff the argument manager is a disjunction manager *)
  val manager_of_disjunction : 'a t Manager.t -> 'b Manager.t
    (** Make a disjunction manager generic *)
  val manager_to_disjunction : 'a Manager.t -> 'b t Manager.t
    (** Instanciate the type of a disjunction manager.
        Raises [Failure] if the argument manager is not a disjunction manager *)
  module Abstract0 : sig
    val is_disjunction : 'a Abstract0.t -> bool
      (** Return [true] iff the argument value is a disjunction value *)
    val of_disjunction : 'a t Abstract0.t -> 'b Abstract0.t
      (** Make a disjunction value generic *)
    val to_disjunction : 'a Abstract0.t -> 'b t Abstract0.t
      (** Instanciate the type of a disjunction value.
  	Raises [Failure] if the argument value is not a disjunction value *)
  end
  module Abstract1 : sig
    val is_disjunction : 'a Abstract1.t -> bool
      (** Return [true] iff the argument value is a disjunction value *)
    val of_disjunction : 'a t Abstract1.t -> 'b Abstract1.t
      (** Make a disjunction value generic *)
    val to_disjunction : 'a Abstract1.t -> 'b t Abstract1.t
      (** Instanciate the type of a disjunction value.
  	Raises [Failure] if the argument value is not a disjunction value *)
  end
  
end


(** {2 Module [ Apron_parser]} *)

module Apron_parser : sig
  type token =
    | TK_EOF
    | TK_VERTEX
    | TK_RAY
    | TK_LINE
    | TK_RAYMOD
    | TK_LINEMOD
    | TK_SUPEG
    | TK_INFEG
    | TK_SUP
    | TK_INF
    | TK_EG
    | TK_DISEG
    | TK_MOD
    | TK_POW of ((Texpr1.typ * Texpr1.round))
    | TK_LBRACKET
    | TK_RBRACKET
    | TK_SEMICOLON
    | TK_LPAR
    | TK_RPAR
    | TK_MUL of ((Texpr1.typ * Texpr1.round))
    | TK_ADD of ((Texpr1.typ * Texpr1.round))
    | TK_SUB of ((Texpr1.typ * Texpr1.round))
    | TK_DIV of ((Texpr1.typ * Texpr1.round))
    | TK_MODULO of ((Texpr1.typ * Texpr1.round))
    | TK_CAST of ((Texpr1.typ * Texpr1.round))
    | TK_SQRT of ((Texpr1.typ * Texpr1.round))
    | TK_MPQF of (Mpqf.t)
    | TK_FLOAT of (float)
    | TK_VAR of (string)
  
  val lincons :
    (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Lincons0.typ * (string*Coeff.t) list
  val generator :
    (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Generator0.typ * (string*Coeff.t) list
  val linexpr :
    (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> (string*Coeff.t) list
  val tcons :
    (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Tcons0.typ * Texpr1.expr
  val texpr :
    (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Texpr1.expr
end


(** {2 Module [ Apron_lexer]: Lexical analysis of expressions, constraints, generators} *)

module Apron_lexer : sig
  (* This file is part of the APRON Library, released under LGPL license
     with an exception allowing the redistribution of statically linked
     executables.
  
     Please read the COPYING file packaged in the distribution  *)
  
  (** Lexical analysis of expressions, constraints, generators *)
  
  exception Error of int * int
  val lex: Lexing.lexbuf -> Apron_parser.token 
end


(** {2 Module [ Parser]: APRON Parsing of expressions} *)

module Parser : sig
  (* This file is part of the APRON Library, released under LGPL license
     with an exception allowing the redistribution of statically linked
     executables.
  
     Please read the COPYING file packaged in the distribution  *)
  
  (** APRON Parsing of expressions *)
  
  (** {3 Introduction}
  
    This small module implements the parsing of expressions, constraints and
    generators. The allowed syntax is simple for linear expressions (no
    parenthesis) but supports interval expressions. The syntax is more flexible
    for tree expressions.
  
    {4 Syntax}
  
    [lincons ::= linexpr ('>' | '>=' | '=' | '!=' | '=' | '<=' | '<') linexpr |
    linexpr = linexpr 'mod' scalar]
  
    [gen ::= ('V:' | 'R:' | 'L:' | 'RM:' | 'LM:') linexpr]
  
    [linexpr ::= linexpr '+' linterm | linexpr '-' linterm | linterm]
  
    [linterm ::= coeff ['*'] identifier | coeff | ['-'] identifier]
  
    [tcons ::= texpr ('>' | '>=' | '=' | '!=' | '=' | '<=' | '<') texpr | texpr =
    texpr 'mod' scalar]
  
    [texpr ::= coeff | identifier | unop texpr | texpr binop texpr | '(' texpr
    ')']
  
    [binop ::=
    ('+'|'-'|'*'|'/'|'%')['_'('i'|'f'|'d'|'l'|'q')][','('n'|'0'|'+oo'|'-oo')]]
  
    [unop ::= ('cast' |
    'sqrt')['_'('i'|'f'|'d'|'l'|'q')][','('n'|'0'|'+oo'|'-oo')]]
  
    [coeff ::= scalar | ['-'] '['scalar ';' scalar ']']
  
    [scalar ::= ['-'] (integer | rational | floating_point_number)]
  
    For tree expressions [texpr], by default the operations have an exact
    arithmetic semantics in the real numbers (even if involved variables are of
    integer). The type qualifiers modify this default semantics. Their meaning is
    as follows: 
    - [i] integer semantics 
    - [f] IEEE754 32 bits floating-point semantics 
    - [d] IEEE754 64 bits floating-point semantics 
    - [l] IEEE754 80 bits floating-point semantics 
    - [q] IEEE754 129 bits floating-point semantics
  
    By default, the rounding mode is "any" (this applies only in non-real
    semantics), which allows to emulate all the following rounding modes: 
    - [n] nearest 
    - [0] towards zero 
    - [+oo] towards infinity 
    - [-oo] towards minus infinity
    - [?] any
  
    {4 Examples}
  
    [let (linexpr:Linexpr1.t) = Parser.linexpr1_of_string env "z+0.4x+2y"]
  
    [let (tab:Lincons1.earray) = Parser.lincons1_of_lstring env
    ["1/2x+2/3y=1";"[1;2]<=z+2w";"z+2w<=4";"0<=u";"u<=5"]]
  
    [let (generator:Generator1.t) = Parser.generator1_of_string env "R:x+2y"]
  
    [let (texpr:Texpr1.t) = Parser.texpr1_of_string env "a %_i,? b +_f,0 c"]
  
    {4 Remarks}
  
    There is the possibility to parse directly from a lexing buffer, or from a
    string (from which one can generate a buffer with the function
    [Lexing.from_string].
  
    This module uses the underlying modules [Apron_lexer] and [Apron_parser].
  *)
  
  (** {3 Interface} *)
  
  exception Error of string
    (** Raised by conversion functions *)
  
  val linexpr1_of_lexbuf : Environment.t -> Lexing.lexbuf -> Linexpr1.t
  val lincons1_of_lexbuf : Environment.t -> Lexing.lexbuf -> Lincons1.t
  val generator1_of_lexbuf : Environment.t -> Lexing.lexbuf -> Generator1.t
    (** Conversion from lexing buffers to resp. linear expressions, linear
      constraints and generators, defined on the given environment. *)
  
  val texpr1expr_of_lexbuf : Lexing.lexbuf -> Texpr1.expr
  val texpr1_of_lexbuf : Environment.t -> Lexing.lexbuf -> Texpr1.t
  val tcons1_of_lexbuf : Environment.t -> Lexing.lexbuf -> Tcons1.t
    (** Conversion from lexing buffers to resp. tree expressions and
        constraints, defined on the given environment. *)
  
  val linexpr1_of_string : Environment.t -> string -> Linexpr1.t
  val lincons1_of_string : Environment.t -> string -> Lincons1.t
  val generator1_of_string : Environment.t -> string -> Generator1.t
    (** Conversion from strings to resp. linear expressions, linear
      constraints and generators, defined on the given environment. *)
  
  val texpr1expr_of_string : string -> Texpr1.expr
  val texpr1_of_string : Environment.t -> string -> Texpr1.t
  val tcons1_of_string : Environment.t -> string -> Tcons1.t
    (** Conversion from lexing buffers to resp. tree expressions and
        constraints, defined on the given environment. *)
  
  val lincons1_of_lstring : Environment.t -> string list -> Lincons1.earray
  val generator1_of_lstring : Environment.t -> string list -> Generator1.earray
    (** Conversion from lists of strings to array of resp. linear
        constraints and generators, defined on the given environment. *)
  
  val tcons1_of_lstring : Environment.t -> string list -> Tcons1.earray
    (** Conversion from lists of strings to array of tree constraints. *)
  
  val of_lstring : 'a Manager.t -> Environment.t -> string list -> 'a Abstract1.t
    (** Abstraction of lists of strings representing constraints to abstract
      values, on the abstract domain defined by the given manager. *)
end


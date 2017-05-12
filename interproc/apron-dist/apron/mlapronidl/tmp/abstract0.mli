(* File generated from abstract0.idl *)

type ap_abstract0_ptr

(** APRON Abstract value of level 0 *)
(** The type parameter ['a] allows to distinguish abstract values with different underlying abstract domains. *)


(** TO BE DOCUMENTED *)
external ap_abstract0_set_gc : int -> unit
	= "camlidl_abstract0_ap_abstract0_set_gc"

(* ********************************************************************** *)
(** {2 General management} *)
(* ********************************************************************** *)
(* ============================================================ *)
(** {3 Memory} *)
(* ============================================================ *)

(** Copy a value *)
external ap_abstract0_copy : Manager.ap_manager_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_copy"


(** Return the abstract size of a value *)
external ap_abstract0_size : Manager.ap_manager_ptr -> ap_abstract0_ptr -> int
	= "camlidl_abstract0_ap_abstract0_size"

(* ============================================================ *)
(** {3 Control of internal representation} *)
(* ============================================================ *)

(** Minimize the size of the representation of the value. This may result in a later recomputation of internal information.*)
external ap_abstract0_minimize : Manager.ap_manager_ptr -> ap_abstract0_ptr -> unit
	= "camlidl_abstract0_ap_abstract0_minimize"


(** Put the abstract value in canonical form. (not yet clear definition) *)
external ap_abstract0_canonicalize : Manager.ap_manager_ptr -> ap_abstract0_ptr -> unit
	= "camlidl_abstract0_ap_abstract0_canonicalize"

external ap_abstract0_hash : Manager.ap_manager_ptr -> ap_abstract0_ptr -> int
	= "camlidl_abstract0_ap_abstract0_hash"


(** [approximate man abs alg] perform some transformation on the abstract value, guided by the argument [alg]. The transformation may lose information.  The argument [alg] overrides the field algorithm of the structure of type [Manager.funopt] associated to ap_abstract0_approximate (commodity feature).*)
external ap_abstract0_approximate : Manager.ap_manager_ptr -> ap_abstract0_ptr -> int -> unit
	= "camlidl_abstract0_ap_abstract0_approximate"

(* ============================================================ *)
(** {3 Printing} *)
(* ============================================================ *)

(** Dump on the [stdout] C stream the internal representation of an abstract value, for debugging purposes *)
external ap_abstract0_fdump : Manager.ap_manager_ptr -> ap_abstract0_ptr -> unit
	= "camlidl_abstract0_ap_abstract0_fdump"


(** Print as a set of constraints *)
val print: (int -> string) -> Format.formatter -> 'a t -> unit
(* ============================================================ *)
(** {3 Serialization} *)
(* ============================================================ *)
(* ********************************************************************** *)
(** {2 Constructor, accessors, tests and property extraction} *)
(* ********************************************************************** *)
(* ============================================================ *)
(** {3 Basic constructors} *)
(* ============================================================ *)

(** Create a bottom (empty) value with the given number of integer and real variables *)
external ap_abstract0_bottom : Manager.ap_manager_ptr -> int -> int -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_bottom"


(** Create a top (universe) value with the given number of integer and real variables *)
external ap_abstract0_top : Manager.ap_manager_ptr -> int -> int -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_top"


(** Abstract an hypercube.

[of_box man intdim realdim array] abstracts an hypercube defined by the array of intervals of size [intdim+realdim] *)
external ap_abstract0_of_box : Manager.ap_manager_ptr -> int -> int -> Interval.ap_interval_array_t -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_of_box"

(* ============================================================ *)
(** {3 Accessors} *)
(* ============================================================ *)


external ap_abstract0_dimension : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dimension_t
	= "camlidl_abstract0_ap_abstract0_dimension"

external ap_abstract0_manager : ap_abstract0_ptr -> Manager.ap_manager_ptr
	= "camlidl_abstract0_ap_abstract0_manager"

(* ============================================================ *)
(** {3 Tests} *)
(* ============================================================ *)

(** Emptiness test *)
external ap_abstract0_is_bottom : Manager.ap_manager_ptr -> ap_abstract0_ptr -> bool
	= "camlidl_abstract0_ap_abstract0_is_bottom"


(** Universality test *)
external ap_abstract0_is_top : Manager.ap_manager_ptr -> ap_abstract0_ptr -> bool
	= "camlidl_abstract0_ap_abstract0_is_top"


(** Inclusion test. The 2 abstract values should be compatible. *)
external ap_abstract0_is_leq : Manager.ap_manager_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr -> bool
	= "camlidl_abstract0_ap_abstract0_is_leq"


(** Equality test. The 2 abstract values should be compatible. *)
external ap_abstract0_is_eq : Manager.ap_manager_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr -> bool
	= "camlidl_abstract0_ap_abstract0_is_eq"


(** Does the abstract value satisfy the linear constraint ? *)
external ap_abstract0_sat_lincons : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Lincons0.ap_lincons0_t -> bool
	= "camlidl_abstract0_ap_abstract0_sat_lincons"


(** Does the abstract value satisfy the tree expression constraint ? *)
external ap_abstract0_sat_tcons : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Tcons0.ap_tcons0_t -> bool
	= "camlidl_abstract0_ap_abstract0_sat_tcons"


(** Does the abstract value satisfy the constraint [dim in interval] ? *)
external ap_abstract0_sat_interval : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t -> Interval.ap_interval_t -> bool
	= "camlidl_abstract0_ap_abstract0_sat_interval"


(** Is the dimension unconstrained in the abstract value ? If yes, this means that the existential quantification of the dimension does not change the value. *)
external ap_abstract0_is_dimension_unconstrained : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t -> bool
	= "camlidl_abstract0_ap_abstract0_is_dimension_unconstrained"

(* ============================================================ *)
(** {3 Extraction of properties} *)
(* ============================================================ *)

(** Return the interval of variation of the dimension in the abstract value. *)
external ap_abstract0_bound_dimension : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t -> Interval.ap_interval_t
	= "camlidl_abstract0_ap_abstract0_bound_dimension"


(** Return the interval of variation of the linear expression in the abstract value.

Implement a form of linear programming, where the argument linear expression is the one to optimize under the constraints induced by the abstract value. *)
external ap_abstract0_bound_linexpr : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Linexpr0.ap_linexpr0_ptr -> Interval.ap_interval_t
	= "camlidl_abstract0_ap_abstract0_bound_linexpr"


(** Return the interval of variation of the tree expression in the abstract value. *)
external ap_abstract0_bound_texpr : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Texpr0.ap_texpr0_ptr -> Interval.ap_interval_t
	= "camlidl_abstract0_ap_abstract0_bound_texpr"


(** Convert the abstract value to an hypercube *)
external ap_abstract0_to_box : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Interval.ap_interval_array_t
	= "camlidl_abstract0_ap_abstract0_to_box"


(** Convert the abstract value to a conjunction of linear constraints. *)
external ap_abstract0_to_lincons_array : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Lincons0.ap_lincons0_array_t
	= "camlidl_abstract0_ap_abstract0_to_lincons_array"


(** Convert the abstract value to a conjunction of tree expression constraints. *)
external ap_abstract0_to_tcons_array : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Tcons0.ap_tcons0_array_t
	= "camlidl_abstract0_ap_abstract0_to_tcons_array"


(** Convert the abstract value to a set of generators that defines it. *)
external ap_abstract0_to_generator_array : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Generator0.ap_generator0_array_t
	= "camlidl_abstract0_ap_abstract0_to_generator_array"

(* ********************************************************************** *)
(** {2 Operations} *)
(* ********************************************************************** *)
(* ============================================================ *)
(** {3 Meet and Join} *)
(* ============================================================ *)


(** Meet of 2 abstract values. *)
external ap_abstract0_meet : Manager.ap_manager_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_meet"

(** Meet of a non empty array of abstract values. *)
external ap_abstract0_meet_array : Manager.ap_manager_ptr -> ap_abstract0_ptr array -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_meet_array"

(** Meet of an abstract value with an array of linear constraints. *)
external ap_abstract0_meet_lincons_array : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Lincons0.ap_lincons0_array_t -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_meet_lincons_array"

(** Meet of an abstract value with an array of tree expression constraints. *)
external ap_abstract0_meet_tcons_array : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Tcons0.ap_tcons0_array_t -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_meet_tcons_array"

(** Join of 2 abstract values. *)
external ap_abstract0_join : Manager.ap_manager_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_join"

(** Join of a non empty array of abstract values. *)
external ap_abstract0_join_array : Manager.ap_manager_ptr -> ap_abstract0_ptr array -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_join_array"

(** Add the array of generators to the abstract value (time elapse operator).

 The generators should either lines or rays, not vertices. *)
external ap_abstract0_add_ray_array : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Generator0.ap_generator0_array_t -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_add_ray_array"


(** {5 Side-effect versions of the previous functions} *)

external ap_abstract0_meet_with : Manager.ap_manager_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr -> unit
	= "camlidl_abstract0_ap_abstract0_meet_with"

external ap_abstract0_meet_lincons_array_with : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Lincons0.ap_lincons0_array_t -> unit
	= "camlidl_abstract0_ap_abstract0_meet_lincons_array_with"

external ap_abstract0_meet_tcons_array_with : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Tcons0.ap_tcons0_array_t -> unit
	= "camlidl_abstract0_ap_abstract0_meet_tcons_array_with"

external ap_abstract0_join_with : Manager.ap_manager_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr -> unit
	= "camlidl_abstract0_ap_abstract0_join_with"

external ap_abstract0_add_ray_array_with : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Generator0.ap_generator0_array_t -> unit
	= "camlidl_abstract0_ap_abstract0_add_ray_array_with"

(* ============================================================ *)
(** {3 Assignements and Substitutions} *)
(* ============================================================ *)
(** Parallel assignement of an array of dimensions by an array of same size of linear expressions *)
external ap_abstract0_assign_linexpr_array : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t array -> Linexpr0.ap_linexpr0_ptr array -> ap_abstract0_ptr option -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_assign_linexpr_array"

(** Parallel substitution of an array of dimensions by an array of same size of linear expressions *)
external ap_abstract0_substitute_linexpr_array : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t array -> Linexpr0.ap_linexpr0_ptr array -> ap_abstract0_ptr option -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_substitute_linexpr_array"

(** Parallel assignement of an array of dimensions by an array of same size of tree expressions *)
external ap_abstract0_assign_texpr_array : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t array -> Texpr0.ap_texpr0_ptr array -> ap_abstract0_ptr option -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_assign_texpr_array"

(** Parallel substitution of an array of dimensions by an array of same size of tree expressions *)
external ap_abstract0_substitute_texpr_array : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t array -> Texpr0.ap_texpr0_ptr array -> ap_abstract0_ptr option -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_substitute_texpr_array"


(** {5 Side-effect versions of the previous functions} *)


external ap_abstract0_assign_linexpr_array_with : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t array -> Linexpr0.ap_linexpr0_ptr array -> ap_abstract0_ptr option -> unit
	= "camlidl_abstract0_ap_abstract0_assign_linexpr_array_with"

external ap_abstract0_substitute_linexpr_array_with : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t array -> Linexpr0.ap_linexpr0_ptr array -> ap_abstract0_ptr option -> unit
	= "camlidl_abstract0_ap_abstract0_substitute_linexpr_array_with"

external ap_abstract0_assign_texpr_array_with : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t array -> Texpr0.ap_texpr0_ptr array -> ap_abstract0_ptr option -> unit
	= "camlidl_abstract0_ap_abstract0_assign_texpr_array_with"

external ap_abstract0_substitute_texpr_array_with : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t array -> Texpr0.ap_texpr0_ptr array -> ap_abstract0_ptr option -> unit
	= "camlidl_abstract0_ap_abstract0_substitute_texpr_array_with"




(* ============================================================ *)
(** {3 Projections} *)
(* ============================================================ *)
(** These functions implements forgeting (existential quantification) of (array of) dimensions. Both functional and side-effect versions are provided. The Boolean, if true, adds a projection onto 0-plane. *)


external ap_abstract0_forget_array : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t array -> bool -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_forget_array"

external ap_abstract0_forget_array_with : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t array -> bool -> unit
	= "camlidl_abstract0_ap_abstract0_forget_array_with"

(* ============================================================ *)
(** {3 Change and permutation of dimensions} *)
(* ============================================================ *)


external ap_abstract0_add_dimensions : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dimchange_t -> bool -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_add_dimensions"

external ap_abstract0_remove_dimensions : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dimchange_t -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_remove_dimensions"

external ap_abstract0_apply_dimchange2 : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dimchange2_t -> bool -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_apply_dimchange2"

external ap_abstract0_permute_dimensions : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dimperm_t -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_permute_dimensions"


(** {5 Side-effect versions of the previous functions} *)


external ap_abstract0_add_dimensions_with : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dimchange_t -> bool -> unit
	= "camlidl_abstract0_ap_abstract0_add_dimensions_with"

external ap_abstract0_remove_dimensions_with : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dimchange_t -> unit
	= "camlidl_abstract0_ap_abstract0_remove_dimensions_with"

external ap_abstract0_apply_dimchange2_with : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dimchange2_t -> bool -> unit
	= "camlidl_abstract0_ap_abstract0_apply_dimchange2_with"

external ap_abstract0_permute_dimensions_with : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dimperm_t option -> unit
	= "camlidl_abstract0_ap_abstract0_permute_dimensions_with"




(* ============================================================ *)
(** {3 Expansion and folding of dimensions} *)
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
external ap_abstract0_expand : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t -> int -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_expand"

 (** Folding: [fold a tdim] fold the dimensions in the array [tdim] of size n>=1
and put the result in the first dimension of the array. The other
dimensions of the array are then removed (using
ap_abstract0_permute_remove_dimensions).
*)
external ap_abstract0_fold : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t array -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_fold"

external ap_abstract0_expand_with : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t -> int -> unit
	= "camlidl_abstract0_ap_abstract0_expand_with"

external ap_abstract0_fold_with : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t array -> unit
	= "camlidl_abstract0_ap_abstract0_fold_with"

(* ============================================================ *)
(** {3 Widening} *)
(* ============================================================ *)
(** Widening. Assumes that the first abstract value is included in the second one. *)
external ap_abstract0_widening : Manager.ap_manager_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_widening"

external ap_abstract0_widening_threshold : Manager.ap_manager_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr -> Lincons0.ap_lincons0_array_t -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_widening_threshold"

(* ============================================================ *)
(** {3 Closure operation} *)
(* ============================================================ *)
(** Closure: transform strict constraints into non-strict ones.*)
external ap_abstract0_closure : Manager.ap_manager_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_closure"

(** Side-effect version *)
external ap_abstract0_closure_with : Manager.ap_manager_ptr -> ap_abstract0_ptr -> unit
	= "camlidl_abstract0_ap_abstract0_closure_with"

(* ********************************************************************** *)
(** {2 Additional operations} *)
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


(* File generated from abstract0.idl *)

type ap_abstract0_ptr

(** APRON Abstract value of level 0 *)
(** The type parameter ['a] allows to distinguish abstract values with different underlying abstract domains. *)

external ap_abstract0_set_gc : int -> unit
	= "camlidl_abstract0_ap_abstract0_set_gc"

(* ********************************************************************** *)
(** {2 General management} *)
(* ********************************************************************** *)
(* ============================================================ *)
(** {3 Memory} *)
(* ============================================================ *)
external ap_abstract0_copy : Manager.ap_manager_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_copy"

external ap_abstract0_size : Manager.ap_manager_ptr -> ap_abstract0_ptr -> int
	= "camlidl_abstract0_ap_abstract0_size"

(* ============================================================ *)
(** {3 Control of internal representation} *)
(* ============================================================ *)
external ap_abstract0_minimize : Manager.ap_manager_ptr -> ap_abstract0_ptr -> unit
	= "camlidl_abstract0_ap_abstract0_minimize"

external ap_abstract0_canonicalize : Manager.ap_manager_ptr -> ap_abstract0_ptr -> unit
	= "camlidl_abstract0_ap_abstract0_canonicalize"

external ap_abstract0_hash : Manager.ap_manager_ptr -> ap_abstract0_ptr -> int
	= "camlidl_abstract0_ap_abstract0_hash"

external ap_abstract0_approximate : Manager.ap_manager_ptr -> ap_abstract0_ptr -> int -> unit
	= "camlidl_abstract0_ap_abstract0_approximate"

(* ============================================================ *)
(** {3 Printing} *)
(* ============================================================ *)
external ap_abstract0_fdump : Manager.ap_manager_ptr -> ap_abstract0_ptr -> unit
	= "camlidl_abstract0_ap_abstract0_fdump"

(* ============================================================ *)
(** {3 Serialization} *)
(* ============================================================ *)
(* ********************************************************************** *)
(** {2 Constructor, accessors, tests and property extraction} *)
(* ********************************************************************** *)
(* ============================================================ *)
(** {3 Basic constructors} *)
(* ============================================================ *)
external ap_abstract0_bottom : Manager.ap_manager_ptr -> int -> int -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_bottom"

external ap_abstract0_top : Manager.ap_manager_ptr -> int -> int -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_top"

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
external ap_abstract0_is_bottom : Manager.ap_manager_ptr -> ap_abstract0_ptr -> bool
	= "camlidl_abstract0_ap_abstract0_is_bottom"

external ap_abstract0_is_top : Manager.ap_manager_ptr -> ap_abstract0_ptr -> bool
	= "camlidl_abstract0_ap_abstract0_is_top"

external ap_abstract0_is_leq : Manager.ap_manager_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr -> bool
	= "camlidl_abstract0_ap_abstract0_is_leq"

external ap_abstract0_is_eq : Manager.ap_manager_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr -> bool
	= "camlidl_abstract0_ap_abstract0_is_eq"

external ap_abstract0_sat_lincons : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Lincons0.ap_lincons0_t -> bool
	= "camlidl_abstract0_ap_abstract0_sat_lincons"

external ap_abstract0_sat_tcons : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Tcons0.ap_tcons0_t -> bool
	= "camlidl_abstract0_ap_abstract0_sat_tcons"

external ap_abstract0_sat_interval : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t -> Interval.ap_interval_t -> bool
	= "camlidl_abstract0_ap_abstract0_sat_interval"

external ap_abstract0_is_dimension_unconstrained : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t -> bool
	= "camlidl_abstract0_ap_abstract0_is_dimension_unconstrained"

(* ============================================================ *)
(** {3 Extraction of properties} *)
(* ============================================================ *)
external ap_abstract0_bound_dimension : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t -> Interval.ap_interval_t
	= "camlidl_abstract0_ap_abstract0_bound_dimension"

external ap_abstract0_bound_linexpr : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Linexpr0.ap_linexpr0_ptr -> Interval.ap_interval_t
	= "camlidl_abstract0_ap_abstract0_bound_linexpr"

external ap_abstract0_bound_texpr : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Texpr0.ap_texpr0_ptr -> Interval.ap_interval_t
	= "camlidl_abstract0_ap_abstract0_bound_texpr"

external ap_abstract0_to_box : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Interval.ap_interval_array_t
	= "camlidl_abstract0_ap_abstract0_to_box"

external ap_abstract0_to_lincons_array : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Lincons0.ap_lincons0_array_t
	= "camlidl_abstract0_ap_abstract0_to_lincons_array"

external ap_abstract0_to_tcons_array : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Tcons0.ap_tcons0_array_t
	= "camlidl_abstract0_ap_abstract0_to_tcons_array"

external ap_abstract0_to_generator_array : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Generator0.ap_generator0_array_t
	= "camlidl_abstract0_ap_abstract0_to_generator_array"

(* ********************************************************************** *)
(** {2 Operations} *)
(* ********************************************************************** *)
(* ============================================================ *)
(** {3 Meet and Join} *)
(* ============================================================ *)
external ap_abstract0_meet : Manager.ap_manager_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_meet"

external ap_abstract0_meet_array : Manager.ap_manager_ptr -> ap_abstract0_ptr array -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_meet_array"

external ap_abstract0_meet_lincons_array : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Lincons0.ap_lincons0_array_t -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_meet_lincons_array"

external ap_abstract0_meet_tcons_array : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Tcons0.ap_tcons0_array_t -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_meet_tcons_array"

external ap_abstract0_join : Manager.ap_manager_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_join"

external ap_abstract0_join_array : Manager.ap_manager_ptr -> ap_abstract0_ptr array -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_join_array"

external ap_abstract0_add_ray_array : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Generator0.ap_generator0_array_t -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_add_ray_array"

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
external ap_abstract0_assign_linexpr_array : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t array -> Linexpr0.ap_linexpr0_ptr array -> ap_abstract0_ptr option -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_assign_linexpr_array"

external ap_abstract0_substitute_linexpr_array : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t array -> Linexpr0.ap_linexpr0_ptr array -> ap_abstract0_ptr option -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_substitute_linexpr_array"

external ap_abstract0_assign_texpr_array : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t array -> Texpr0.ap_texpr0_ptr array -> ap_abstract0_ptr option -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_assign_texpr_array"

external ap_abstract0_substitute_texpr_array : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t array -> Texpr0.ap_texpr0_ptr array -> ap_abstract0_ptr option -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_substitute_texpr_array"

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
external ap_abstract0_expand : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t -> int -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_expand"

external ap_abstract0_fold : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t array -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_fold"

external ap_abstract0_expand_with : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t -> int -> unit
	= "camlidl_abstract0_ap_abstract0_expand_with"

external ap_abstract0_fold_with : Manager.ap_manager_ptr -> ap_abstract0_ptr -> Dim.ap_dim_t array -> unit
	= "camlidl_abstract0_ap_abstract0_fold_with"

(* ============================================================ *)
(** {3 Widening} *)
(* ============================================================ *)
external ap_abstract0_widening : Manager.ap_manager_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_widening"

external ap_abstract0_widening_threshold : Manager.ap_manager_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr -> Lincons0.ap_lincons0_array_t -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_widening_threshold"

(* ============================================================ *)
(** {3 Closure operation} *)
(* ============================================================ *)
external ap_abstract0_closure : Manager.ap_manager_ptr -> ap_abstract0_ptr -> ap_abstract0_ptr
	= "camlidl_abstract0_ap_abstract0_closure"

external ap_abstract0_closure_with : Manager.ap_manager_ptr -> ap_abstract0_ptr -> unit
	= "camlidl_abstract0_ap_abstract0_closure_with"

(* ********************************************************************** *)
(** {2 Additional operations} *)
(* ********************************************************************** *)

let of_lincons_array man intdim realdim array =
let res = top man intdim realdim in
meet_lincons_array_with man res array;
res
let of_tcons_array man intdim realdim array =
let res = top man intdim realdim in
meet_tcons_array_with man res array;
res
let assign_linexpr man abs dim expr odest =
assign_linexpr_array man abs [|dim|] [|expr|] odest
let assign_texpr man abs dim expr odest =
assign_texpr_array man abs [|dim|] [|expr|] odest
let substitute_linexpr man abs dim expr odest =
substitute_linexpr_array man abs [|dim|] [|expr|] odest
let substitute_texpr man abs dim expr odest =
substitute_texpr_array man abs [|dim|] [|expr|] odest
let assign_linexpr_with man abs dim expr odest =
assign_linexpr_array_with man abs [|dim|] [|expr|] odest
let assign_texpr_with man abs dim expr odest =
assign_texpr_array_with man abs [|dim|] [|expr|] odest
let substitute_linexpr_with man abs dim expr odest =
substitute_linexpr_array_with man abs [|dim|] [|expr|] odest
let substitute_texpr_with man abs dim expr odest =
substitute_texpr_array_with man abs [|dim|] [|expr|] odest


let print_array
?(first=("[|@[<hov>":(unit,Format.formatter,unit) format))
?(sep = (";@ ":(unit,Format.formatter,unit) format))
?(last = ("@]|]":(unit,Format.formatter,unit) format))
(print_elt: Format.formatter -> 'a -> unit)
(fmt:Format.formatter)
(array: 'a array)
: unit
=
if array=[||] then begin
Format.fprintf fmt first;
Format.fprintf fmt last;
end
else begin
Format.fprintf fmt first;
let first = ref true in
Array.iter
(begin fun e ->
if !first then first := false else Format.fprintf fmt sep;
print_elt fmt e
end)
array
;
Format.fprintf fmt last;
end

let print assoc fmt a =
let man = manager a in
if is_bottom man a then
	Format.pp_print_string fmt "bottom"
else if is_top man a then
Format.pp_print_string fmt "top"
else begin
let tab = to_lincons_array man a in
print_array (Lincons0.print assoc) fmt tab;
end


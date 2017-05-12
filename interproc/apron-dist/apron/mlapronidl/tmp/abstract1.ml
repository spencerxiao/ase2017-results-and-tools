(* File generated from abstract1.idl *)

type ap_abstract1_t = {
  mutable_abstract0: Abstract0.ap_abstract0_ptr;
  mutable_env: Environment.ap_environment_ptr;
}

(** APRON Abstract values of level 1 *)
(** The type parameter ['a] allows to distinguish abstract values with different underlying abstract domains. *)

type box1 = { mutable interval_array : Interval.t array; mutable box1_env : Environment.t }
(* ********************************************************************** *)
(** {2 General management} *)
(* ********************************************************************** *)
(* ============================================================ *)
(** {3 Memory} *)
(* ============================================================ *)

let copy man x = { abstract0 = Abstract0.copy man x.abstract0; env = x.env }
let size man x = Abstract0.size man x.abstract0

(* ============================================================ *)
(** {3 Control of internal representation} *)
(* ============================================================ *)

let minimize man x = Abstract0.minimize man x.abstract0
let canonicalize man x = Abstract0.canonicalize man x.abstract0
let hash man x = 5*(Environment.hash x.env) + Abstract0.hash man x.abstract0
let approximate man x n = Abstract0.approximate man x.abstract0 n

(* ============================================================ *)
(** {3 Printing} *)
(* ============================================================ *)
external ap_abstract1_fdump : Manager.ap_manager_ptr -> ap_abstract1_t -> unit
	= "camlidl_abstract1_ap_abstract1_fdump"

(* ============================================================ *)
(** {3 Serialization} *)
(* ============================================================ *)
(* ********************************************************************** *)
(** {2 Constructor, accessors, tests and property extraction} *)
(* ********************************************************************** *)
(* ============================================================ *)
(** {3 Basic constructors} *)

(* ============================================================ *)
external ap_abstract1_bottom : Manager.ap_manager_ptr -> Environment.ap_environment_ptr -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_bottom"

external ap_abstract1_top : Manager.ap_manager_ptr -> Environment.ap_environment_ptr -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_top"

external ap_abstract1_of_box : Manager.ap_manager_ptr -> Environment.ap_environment_ptr -> Var.ap_var_t array -> Interval.ap_interval_ptr array -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_of_box"

(* ============================================================ *)
(** {3 Accessors} *)

(* ============================================================ *)

let manager x = Abstract0.manager x.abstract0
let env x = x.env
let abstract0 x = x.abstract0

(* ============================================================ *)
(** {3 Tests} *)

(* ============================================================ *)

let is_bottom man x = Abstract0.is_bottom man x.abstract0
let is_top man x = Abstract0.is_top man x.abstract0

external ap_abstract1_is_leq : Manager.ap_manager_ptr -> ap_abstract1_t -> ap_abstract1_t -> bool
	= "camlidl_abstract1_ap_abstract1_is_leq"

external ap_abstract1_is_eq : Manager.ap_manager_ptr -> ap_abstract1_t -> ap_abstract1_t -> bool
	= "camlidl_abstract1_ap_abstract1_is_eq"

external ap_abstract1_sat_lincons : Manager.ap_manager_ptr -> ap_abstract1_t -> Lincons1.ap_lincons1_t -> bool
	= "camlidl_abstract1_ap_abstract1_sat_lincons"

external ap_abstract1_sat_tcons : Manager.ap_manager_ptr -> ap_abstract1_t -> Tcons1.ap_tcons1_t -> bool
	= "camlidl_abstract1_ap_abstract1_sat_tcons"

external ap_abstract1_sat_interval : Manager.ap_manager_ptr -> ap_abstract1_t -> Var.ap_var_t -> Interval.ap_interval_t -> bool
	= "camlidl_abstract1_ap_abstract1_sat_interval"

external ap_abstract1_is_variable_unconstrained : Manager.ap_manager_ptr -> ap_abstract1_t -> Var.ap_var_t -> bool
	= "camlidl_abstract1_ap_abstract1_is_variable_unconstrained"

(* ============================================================ *)
(** {3 Extraction of properties} *)

(* ============================================================ *)
external ap_abstract1_bound_variable : Manager.ap_manager_ptr -> ap_abstract1_t -> Var.ap_var_t -> Interval.ap_interval_t
	= "camlidl_abstract1_ap_abstract1_bound_variable"

external ap_abstract1_bound_linexpr : Manager.ap_manager_ptr -> ap_abstract1_t -> Linexpr1.ap_linexpr1_t -> Interval.ap_interval_t
	= "camlidl_abstract1_ap_abstract1_bound_linexpr"

external ap_abstract1_bound_texpr : Manager.ap_manager_ptr -> ap_abstract1_t -> Texpr1.ap_texpr1_t -> Interval.ap_interval_t
	= "camlidl_abstract1_ap_abstract1_bound_texpr"


let to_lincons_array man x = {
Lincons1.lincons0_array = Abstract0.to_lincons_array man x.abstract0;
Lincons1.array_env = x.env
}
let to_tcons_array man x = {
Tcons1.tcons0_array = Abstract0.to_tcons_array man x.abstract0;
Tcons1.array_env = x.env
}
let to_generator_array man x = {
Generator1.generator0_array = Abstract0.to_generator_array man x.abstract0;
Generator1.array_env = x.env
}
let to_box man x = {
interval_array = Abstract0.to_box man x.abstract0;
box1_env = x.env
}

(* ********************************************************************** *)
(** {2 Operations} *)
(* ********************************************************************** *)
(* ============================================================ *)
(** {3 Meet and Join} *)

(* ============================================================ *)
external ap_abstract1_meet : Manager.ap_manager_ptr -> ap_abstract1_t -> ap_abstract1_t -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_meet"

external ap_abstract1_meet_array : Manager.ap_manager_ptr -> ap_abstract1_t array -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_meet_array"

external ap_abstract1_meet_lincons_array : Manager.ap_manager_ptr -> ap_abstract1_t -> Lincons1.ap_lincons1_array_t -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_meet_lincons_array"

external ap_abstract1_meet_tcons_array : Manager.ap_manager_ptr -> ap_abstract1_t -> Tcons1.ap_tcons1_array_t -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_meet_tcons_array"

external ap_abstract1_join : Manager.ap_manager_ptr -> ap_abstract1_t -> ap_abstract1_t -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_join"

external ap_abstract1_join_array : Manager.ap_manager_ptr -> ap_abstract1_t array -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_join_array"

external ap_abstract1_add_ray_array : Manager.ap_manager_ptr -> ap_abstract1_t -> Generator1.ap_generator1_array_t -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_add_ray_array"

external ap_abstract1_meet_with : Manager.ap_manager_ptr -> ap_abstract1_t -> ap_abstract1_t -> unit
	= "camlidl_abstract1_ap_abstract1_meet_with"

external ap_abstract1_meet_lincons_array_with : Manager.ap_manager_ptr -> ap_abstract1_t -> Lincons1.ap_lincons1_array_t -> unit
	= "camlidl_abstract1_ap_abstract1_meet_lincons_array_with"

external ap_abstract1_meet_tcons_array_with : Manager.ap_manager_ptr -> ap_abstract1_t -> Tcons1.ap_tcons1_array_t -> unit
	= "camlidl_abstract1_ap_abstract1_meet_tcons_array_with"

external ap_abstract1_join_with : Manager.ap_manager_ptr -> ap_abstract1_t -> ap_abstract1_t -> unit
	= "camlidl_abstract1_ap_abstract1_join_with"

external ap_abstract1_add_ray_array_with : Manager.ap_manager_ptr -> ap_abstract1_t -> Generator1.ap_generator1_array_t -> unit
	= "camlidl_abstract1_ap_abstract1_add_ray_array_with"

(* ============================================================ *)
(** {3 Assignement and Substitutions} *)

(* ============================================================ *)
external ap_abstract1_assign_linexpr_array : Manager.ap_manager_ptr -> ap_abstract1_t -> Var.ap_var_t array -> Linexpr1.ap_linexpr1_t array -> ap_abstract1_t option -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_assign_linexpr_array"

external ap_abstract1_substitute_linexpr_array : Manager.ap_manager_ptr -> ap_abstract1_t -> Var.ap_var_t array -> Linexpr1.ap_linexpr1_t array -> ap_abstract1_t option -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_substitute_linexpr_array"

external ap_abstract1_assign_texpr_array : Manager.ap_manager_ptr -> ap_abstract1_t -> Var.ap_var_t array -> Texpr1.ap_texpr1_t array -> ap_abstract1_t option -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_assign_texpr_array"

external ap_abstract1_substitute_texpr_array : Manager.ap_manager_ptr -> ap_abstract1_t -> Var.ap_var_t array -> Texpr1.ap_texpr1_t array -> ap_abstract1_t option -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_substitute_texpr_array"

external ap_abstract1_assign_linexpr_array_with : Manager.ap_manager_ptr -> ap_abstract1_t -> Var.ap_var_t array -> Linexpr1.ap_linexpr1_t array -> ap_abstract1_t option -> unit
	= "camlidl_abstract1_ap_abstract1_assign_linexpr_array_with"

external ap_abstract1_substitute_linexpr_array_with : Manager.ap_manager_ptr -> ap_abstract1_t -> Var.ap_var_t array -> Linexpr1.ap_linexpr1_t array -> ap_abstract1_t option -> unit
	= "camlidl_abstract1_ap_abstract1_substitute_linexpr_array_with"

external ap_abstract1_assign_texpr_array_with : Manager.ap_manager_ptr -> ap_abstract1_t -> Var.ap_var_t array -> Texpr1.ap_texpr1_t array -> ap_abstract1_t option -> unit
	= "camlidl_abstract1_ap_abstract1_assign_texpr_array_with"

external ap_abstract1_substitute_texpr_array_with : Manager.ap_manager_ptr -> ap_abstract1_t -> Var.ap_var_t array -> Texpr1.ap_texpr1_t array -> ap_abstract1_t option -> unit
	= "camlidl_abstract1_ap_abstract1_substitute_texpr_array_with"

(* ============================================================ *)
(** {3 Projections} *)

(* ============================================================ *)
external ap_abstract1_forget_array : Manager.ap_manager_ptr -> ap_abstract1_t -> Var.ap_var_t array -> bool -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_forget_array"

external ap_abstract1_forget_array_with : Manager.ap_manager_ptr -> ap_abstract1_t -> Var.ap_var_t array -> bool -> unit
	= "camlidl_abstract1_ap_abstract1_forget_array_with"

(* ============================================================ *)
(** {3 Change and permutation of dimensions} *)

(* ============================================================ *)
external ap_abstract1_change_environment : Manager.ap_manager_ptr -> ap_abstract1_t -> Environment.ap_environment_ptr -> bool -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_change_environment"

external ap_abstract1_minimize_environment : Manager.ap_manager_ptr -> ap_abstract1_t -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_minimize_environment"

external ap_abstract1_rename_array : Manager.ap_manager_ptr -> ap_abstract1_t -> Var.ap_var_t array -> Var.ap_var_t array -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_rename_array"

external ap_abstract1_change_environment_with : Manager.ap_manager_ptr -> ap_abstract1_t -> Environment.ap_environment_ptr -> bool -> unit
	= "camlidl_abstract1_ap_abstract1_change_environment_with"

external ap_abstract1_minimize_environment_with : Manager.ap_manager_ptr -> ap_abstract1_t -> unit
	= "camlidl_abstract1_ap_abstract1_minimize_environment_with"

external ap_abstract1_rename_array_with : Manager.ap_manager_ptr -> ap_abstract1_t -> Var.ap_var_t array -> Var.ap_var_t array -> unit
	= "camlidl_abstract1_ap_abstract1_rename_array_with"

(* ============================================================ *)
(** {3 Expansion and folding of dimensions} *)

(* ============================================================ *)
external ap_abstract1_expand : Manager.ap_manager_ptr -> ap_abstract1_t -> Var.ap_var_t -> Var.ap_var_t array -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_expand"

external ap_abstract1_fold : Manager.ap_manager_ptr -> ap_abstract1_t -> Var.ap_var_t array -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_fold"

external ap_abstract1_expand_with : Manager.ap_manager_ptr -> ap_abstract1_t -> Var.ap_var_t -> Var.ap_var_t array -> unit
	= "camlidl_abstract1_ap_abstract1_expand_with"

external ap_abstract1_fold_with : Manager.ap_manager_ptr -> ap_abstract1_t -> Var.ap_var_t array -> unit
	= "camlidl_abstract1_ap_abstract1_fold_with"

(* ============================================================ *)
(** {3 Widening} *)

(* ============================================================ *)
external ap_abstract1_widening : Manager.ap_manager_ptr -> ap_abstract1_t -> ap_abstract1_t -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_widening"

external ap_abstract1_widening_threshold : Manager.ap_manager_ptr -> ap_abstract1_t -> ap_abstract1_t -> Lincons1.ap_lincons1_array_t -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_widening_threshold"

(* ============================================================ *)
(** {3 Closure operation} *)

(* ============================================================ *)
external ap_abstract1_closure : Manager.ap_manager_ptr -> ap_abstract1_t -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_closure"

external ap_abstract1_closure_with : Manager.ap_manager_ptr -> ap_abstract1_t -> unit
	= "camlidl_abstract1_ap_abstract1_closure_with"

(* ********************************************************************** *)
(** {2 Additional operations} *)
(* ********************************************************************** *)

let of_lincons_array man env array =
let res = top man env in
meet_lincons_array_with man res array;
res
let of_tcons_array man env array =
let res = top man env in
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

external ap_abstract1_unify : Manager.ap_manager_ptr -> ap_abstract1_t -> ap_abstract1_t -> ap_abstract1_t
	= "camlidl_abstract1_ap_abstract1_unify"

external ap_abstract1_unify_with : Manager.ap_manager_ptr -> ap_abstract1_t -> ap_abstract1_t -> unit
	= "camlidl_abstract1_ap_abstract1_unify_with"


let print fmt a =
let man = manager a in
if is_bottom man a then
Format.pp_print_string fmt "bottom"
else if is_top man a then
Format.pp_print_string fmt "top"
else begin
let tab = to_lincons_array man a in
Lincons1.array_print fmt tab;
end


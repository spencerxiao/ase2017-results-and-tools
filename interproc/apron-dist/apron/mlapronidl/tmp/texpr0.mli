(* File generated from texpr0.idl *)

type ap_texpr0_ptr
and ap_texpr_unop_t = 
  | Neg
  | Cast
  | Sqrt (** *)
  (** Unary operators *)
and ap_texpr_binop_t = 
  | Add
  | Sub
  | Mul
  | Div
  | Mod
  | Pow (** *)
  (** Binary operators *)
and ap_texpr_rtype_t = 
  | Real
  | Int
  | Single
  | Double
  | Extended
  | Quad (** *)
  (** Destination type for rounding *)
and ap_texpr_rdir_t = 
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

(** {2 Constructors and Destructor} *)
(** General constructor (actually the most efficient *)
external of_expr : expr -> t = "camlidl_texpr0_ap_texpr0_of_expr"

(** Copy *)
external ap_texpr0_copy : ap_texpr0_ptr -> ap_texpr0_ptr
	= "camlidl_texpr0_ap_texpr0_copy"

(** Conversion *)
external ap_texpr0_of_linexpr : Linexpr0.ap_linexpr0_ptr -> ap_texpr0_ptr
	= "camlidl_texpr0_ap_texpr0_of_linexpr"

(** General destructor *)
external to_expr : t -> expr = "camlidl_texpr0_ap_texpr0_to_expr"


(** {3 Incremental constructors} *)

external ap_texpr0_cst : Coeff.ap_coeff_t -> ap_texpr0_ptr
	= "camlidl_texpr0_ap_texpr0_cst"

external ap_texpr0_dim : Dim.ap_dim_t -> ap_texpr0_ptr
	= "camlidl_texpr0_ap_texpr0_dim"

external ap_texpr0_unop : ap_texpr_unop_t -> ap_texpr0_ptr -> ap_texpr_rtype_t -> ap_texpr_rdir_t -> ap_texpr0_ptr
	= "camlidl_texpr0_ap_texpr0_unop"

external ap_texpr0_binop : ap_texpr_binop_t -> ap_texpr_rtype_t -> ap_texpr_rdir_t -> ap_texpr0_ptr -> ap_texpr0_ptr -> ap_texpr0_ptr
	= "camlidl_texpr0_ap_texpr0_binop"


(** {2 Tests} *)

external ap_texpr0_is_interval_cst : ap_texpr0_ptr -> bool
	= "camlidl_texpr0_ap_texpr0_is_interval_cst"

external ap_texpr0_is_interval_linear : ap_texpr0_ptr -> bool
	= "camlidl_texpr0_ap_texpr0_is_interval_linear"

external ap_texpr0_is_interval_polynomial : ap_texpr0_ptr -> bool
	= "camlidl_texpr0_ap_texpr0_is_interval_polynomial"

external ap_texpr0_is_interval_polyfrac : ap_texpr0_ptr -> bool
	= "camlidl_texpr0_ap_texpr0_is_interval_polyfrac"

external ap_texpr0_is_scalar : ap_texpr0_ptr -> bool
	= "camlidl_texpr0_ap_texpr0_is_scalar"


(** {2 Printing} *)


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

(** {2 Internal usage for level 1} *)

val print_sprint_unop : unop -> typ -> round -> string
val print_sprint_binop : binop -> typ -> round -> string
val print_precedence_of_unop : unop -> int
val print_precedence_of_binop : binop -> int


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


(** User type for tree expressions *) 
type expr = 
| Cst of Coeff.t 
| Dim of Dim.t 
| Unop of unop * expr * typ * round 
| Binop of binop * expr * expr * typ * round 

(** {2 Constructors and Destructor} *)
external of_expr : expr -> t = "camlidl_texpr0_ap_texpr0_of_expr"

external ap_texpr0_copy : ap_texpr0_ptr -> ap_texpr0_ptr
	= "camlidl_texpr0_ap_texpr0_copy"

external ap_texpr0_of_linexpr : Linexpr0.ap_linexpr0_ptr -> ap_texpr0_ptr
	= "camlidl_texpr0_ap_texpr0_of_linexpr"

external to_expr : t -> expr = "camlidl_texpr0_ap_texpr0_to_expr"

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


let string_of_unop = function
| Neg -> "Neg"
| Cast -> "Cast"
| Sqrt -> "Sqrt"
let string_of_binop = function
| Add -> "Add"
| Sub -> "Sub"
| Mul -> "Mul"
| Div -> "Div"
| Mod -> "Mod"
| Pow -> "Pow"
let string_of_typ = function
| Real -> "Real"
| Int -> "Int"
| Single -> "Single"
| Double -> "Double"
| Extended -> "Extended"
| Quad-> "Quad"
let string_of_round = function
| Near -> "Near"
| Zero -> "Zero"
| Up -> "Up"
| Down -> "Down"
| Rnd -> "Rnd"
let print_typ fmt x = Format.pp_print_string fmt (string_of_typ x)
let print_round fmt x = Format.pp_print_string fmt (string_of_round x)
let print_unop fmt x = Format.pp_print_string fmt (string_of_unop x)
let print_binop fmt x = Format.pp_print_string fmt (string_of_binop x)


let print_string_of_unop = function
| Neg -> "-"
| Cast -> "cast"
| Sqrt -> "sqrt"
let print_string_of_binop = function
| Add -> "+"
| Sub -> "-"
| Mul -> "*"
| Div -> "/"
| Mod -> "%"
| Pow -> "^"
let print_string_of_typ = function
| Real -> ""
| Int -> "i"
| Single -> "f"
| Double -> "d"
| Extended -> "l"
| Quad-> "q"
let print_string_of_round = function
| Near -> "n"
| Zero -> "0"
| Up -> "+oo"
| Down -> "-oo"
| Rnd -> "?"
let print_sprint_unop op typ round =
if op=Neg then
Format.sprintf "%s" (print_string_of_unop op)
else begin
if typ=Real then
Format.sprintf "%s " (print_string_of_unop op)
else
Format.sprintf "%s_%s,%s " (print_string_of_unop op)
(print_string_of_typ typ) (print_string_of_round round)
end
let print_sprint_binop op typ round =
if typ=Real then
Format.sprintf "%s" (print_string_of_binop op)
else
Format.sprintf "%s_%s,%s" (print_string_of_binop op)
(print_string_of_typ typ) (print_string_of_round round)
let print_precedence_of_unop = function
| Neg -> 4
| Cast | Sqrt -> 5
let print_precedence_of_binop = function
| Add | Sub -> 1
| Mul | Div | Mod -> 2
  | Pow -> 3


let rec print_expr (string_of_dim:Dim.t -> string) fmt expr =
let precedence_of_expr = function
| Cst _
| Dim _ -> 5
| Unop(op,_,_,_) -> print_precedence_of_unop op
| Binop(op,_,_,_,_) -> print_precedence_of_binop op
in
match expr with
| Cst x -> Coeff.print fmt x
| Dim x -> Format.pp_print_string fmt (string_of_dim x)
| Unop(op,e,typ,round) ->
let prec = print_precedence_of_unop op in
let prec1 = precedence_of_expr e in
let par = prec1<=prec in
Format.fprintf fmt "%s%s%a%s"
(print_sprint_unop op typ round)
(if par then "(" else "")
(print_expr string_of_dim) e
(if par then ")" else "")
| Binop(op,e1,e2,typ,round) ->
let prec = print_precedence_of_binop op in
let prec1 = precedence_of_expr e1 in
let prec2 = precedence_of_expr e2 in
let par1 = prec1<prec in
let par2 = prec2<=prec in
Format.fprintf fmt "%s%a%s %s %s%a%s"
(if par1 then "(" else "")
(print_expr string_of_dim) e1
(if par1 then ")" else "")
(print_sprint_binop op typ round)
(if par2 then "(" else "")
(print_expr string_of_dim) e2
(if par2 then ")" else "")

let print string_of_dim fmt t = print_expr string_of_dim fmt (to_expr t)

(** {2 Internal usage for level 1} *)

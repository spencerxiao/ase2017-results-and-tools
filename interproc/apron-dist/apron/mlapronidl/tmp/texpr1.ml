(* File generated from texpr1.idl *)

type ap_texpr1_t = {
  mutable_texpr0: Texpr0.ap_texpr0_ptr;
  mutable_env: Environment.ap_environment_ptr;
}


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

(** {2 Constructors and Destructor} *)
let rec expr0_of_expr1 env expr =
match expr with
| Cst x -> Texpr0.Cst x
| Var var -> Texpr0.Dim (Environment.dim_of_var env var)
| Unop(op,e,t,r) -> 
Texpr0.Unop(
op,
(expr0_of_expr1 env e),
t,r
)
| Binop(op,e1,e2,t,r) -> 
Texpr0.Binop(
op,
(expr0_of_expr1 env e1),
(expr0_of_expr1 env e2),
t,r
)
let texpr0_of_expr env expr =
Texpr0.of_expr (expr0_of_expr1 env expr)
let of_expr env expr = {
texpr0 = texpr0_of_expr env expr;
env = env;
}


let copy e = { texpr0 = Texpr0.copy e.texpr0; env = e.env }
let of_linexpr e = { texpr0 = Texpr0.of_linexpr e.Linexpr1.linexpr0; env = e.Linexpr1.env }

let rec expr1_of_expr0 env expr =
match expr with
| Texpr0.Cst x -> Cst x
| Texpr0.Dim dim -> Var (Environment.var_of_dim env dim)
| Texpr0.Unop(op,e,t,r) -> 
Unop(
op,
(expr1_of_expr0 env e),
t,r
)
| Texpr0.Binop(op,e1,e2,t,r) -> 
Binop(
op,
(expr1_of_expr0 env e1),
(expr1_of_expr0 env e2),
t,r
)
let to_expr texpr1 =
let expr0 = Texpr0.to_expr texpr1.texpr0 in
expr1_of_expr0 texpr1.env expr0

external ap_texpr1_cst : Environment.ap_environment_ptr -> Coeff.ap_coeff_t -> ap_texpr1_t
	= "camlidl_texpr1_ap_texpr1_cst"

let var env v = { texpr0 = Texpr0.dim (Environment.dim_of_var env v); env = env }
external ap_texpr1_unop : Texpr0.ap_texpr_unop_t -> ap_texpr1_t -> Texpr0.ap_texpr_rtype_t -> Texpr0.ap_texpr_rdir_t -> ap_texpr1_t
	= "camlidl_texpr1_ap_texpr1_unop"

external ap_texpr1_binop : Texpr0.ap_texpr_binop_t -> ap_texpr1_t -> ap_texpr1_t -> Texpr0.ap_texpr_rtype_t -> Texpr0.ap_texpr_rdir_t -> ap_texpr1_t
	= "camlidl_texpr1_ap_texpr1_binop"


(** {2 Tests} *)

let is_interval_cst x = Texpr0.is_interval_cst x.texpr0 
let is_interval_linear x = Texpr0.is_interval_linear x.texpr0 
let is_interval_polynomial x = Texpr0.is_interval_polynomial x.texpr0 
let is_interval_polyfrac x = Texpr0.is_interval_polyfrac x.texpr0 
let is_scalar x = Texpr0.is_scalar x.texpr0 


(** {2 Operations} *)

external ap_texpr1_extend_environment : ap_texpr1_t -> Environment.ap_environment_ptr -> ap_texpr1_t
	= "camlidl_texpr1_ap_texpr1_extend_environment"

external ap_texpr1_extend_environment_with : ap_texpr1_t -> Environment.ap_environment_ptr -> unit
	= "camlidl_texpr1_ap_texpr1_extend_environment_with"


let get_texpr0 expr = expr.texpr0
let get_env expr = expr.env


(** {2 Printing} *)


let string_of_unop = Texpr0.string_of_unop
let string_of_binop = Texpr0.string_of_binop
let string_of_typ = Texpr0.string_of_typ
let string_of_round = Texpr0.string_of_round
let print_unop = Texpr0.print_unop
let print_binop = Texpr0.print_binop
let print_typ = Texpr0.print_typ
let print_round = Texpr0.print_round
let rec print_expr fmt expr =
let precedence_of_expr = function
| Cst _
| Var _ -> 6
| Unop(op,_,_,_) -> Texpr0.print_precedence_of_unop op
| Binop(op,_,_,_,_) -> Texpr0.print_precedence_of_binop op
in
match expr with
| Cst x -> Coeff.print fmt x
| Var x -> Format.pp_print_string fmt (Var.to_string x)
| Unop(op,e,typ,round) ->
let prec = Texpr0.print_precedence_of_unop op in
let prec1 = precedence_of_expr e in
let par = prec1<=prec in
Format.fprintf fmt "%s%s%a%s"
(Texpr0.print_sprint_unop op typ round)
(if par then "(" else "")
print_expr e
(if par then ")" else "")
| Binop(op,e1,e2,typ,round) ->
let prec = Texpr0.print_precedence_of_binop op in
let prec1 = precedence_of_expr e1 in
let prec2 = precedence_of_expr e2 in
let par1 = prec1<prec in
let par2 = prec2<=prec in
Format.fprintf fmt "%s%a%s %s %s%a%s"
(if par1 then "(" else "")
print_expr e1
(if par1 then ")" else "")
(Texpr0.print_sprint_binop op typ round)
(if par2 then "(" else "")
print_expr e2
(if par2 then ")" else "")

let print fmt expr =
Texpr0.print
(fun dim -> Var.to_string (Environment.var_of_dim expr.env dim))
fmt expr.texpr0


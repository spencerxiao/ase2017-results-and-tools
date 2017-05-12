(* File generated from linexpr1.idl *)

type ap_linexpr1_t = {
  mutable_linexpr0: Linexpr0.ap_linexpr0_ptr;
  mutable_env: Environment.ap_environment_ptr;
}

external ap_linexpr1_get_coeff : ap_linexpr1_t -> Var.ap_var_t -> Coeff.ap_coeff_t
	= "camlidl_linexpr1_ap_linexpr1_get_coeff"

external ap_linexpr1_set_coeff : ap_linexpr1_t -> Var.ap_var_t -> Coeff.ap_coeff_t -> unit
	= "camlidl_linexpr1_ap_linexpr1_set_coeff"

external ap_linexpr1_extend_environment : ap_linexpr1_t -> Environment.ap_environment_ptr -> ap_linexpr1_t
	= "camlidl_linexpr1_ap_linexpr1_extend_environment"

external ap_linexpr1_extend_environment_with : ap_linexpr1_t -> Environment.ap_environment_ptr -> unit
	= "camlidl_linexpr1_ap_linexpr1_extend_environment_with"

external ap_linexpr1_is_integer : ap_linexpr1_t -> bool
	= "camlidl_linexpr1_ap_linexpr1_is_integer"

external ap_linexpr1_is_real : ap_linexpr1_t -> bool
	= "camlidl_linexpr1_ap_linexpr1_is_real"


let make ?(sparse=true) env = {
linexpr0 = Linexpr0.make
(if sparse
then None
else Some (Environment.size env));
env = env;
}
let minimize e = Linexpr0.minimize e.linexpr0
let copy e = {
linexpr0 = Linexpr0.copy e.linexpr0;
env = e.env;
}
let get_cst expr =
Linexpr0.get_cst expr.linexpr0
let get_linexpr0 expr = expr.linexpr0
let get_env expr = expr.env
let set_cst expr cst =
Linexpr0.set_cst expr.linexpr0 cst
let set_list expr list ocst = 
List.iter
(fun (coeff,var) -> set_coeff expr var coeff )
list;
begin match ocst with
| Some cst -> set_cst expr cst
| None -> ()
end;
()
let set_array expr tab ocst = 
Array.iter
(fun (coeff,var) -> set_coeff expr var coeff )
tab;
begin match ocst with
| Some cst -> set_cst expr cst
| None -> ()
end;
()

let iter f expr =
Linexpr0.iter
(begin fun coeff dim ->
f coeff (Environment.var_of_dim expr.env dim)
end)
expr.linexpr0
let print fmt expr =
Linexpr0.print
(fun dim -> Var.to_string (Environment.var_of_dim expr.env dim))
fmt expr.linexpr0
 

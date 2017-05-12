(* File generated from lincons1.idl *)

type ap_lincons1_t = {
  mutable_lincons0: Lincons0.ap_lincons0_t;
  mutable_env: Environment.ap_environment_ptr;
}
and ap_lincons1_array_t = {
  mutable_lincons0_array: Lincons0.ap_lincons0_array_t;
  mutable_array_env: Environment.ap_environment_ptr;
}

(** APRON Constraints and array of constraints of level 1 *)

type typ = Lincons0.typ =
| EQ
| SUPEQ
| SUP
| DISEQ
| EQMOD of Scalar.t

external ap_lincons1_get_coeff : ap_lincons1_t -> Var.ap_var_t -> Coeff.ap_coeff_t
	= "camlidl_lincons1_ap_lincons1_get_coeff"

external ap_lincons1_set_coeff : ap_lincons1_t -> Var.ap_var_t -> Coeff.ap_coeff_t -> unit
	= "camlidl_lincons1_ap_lincons1_set_coeff"

external ap_lincons1_make_unsat : Environment.ap_environment_ptr -> ap_lincons1_t
	= "camlidl_lincons1_ap_lincons1_make_unsat"

external ap_lincons1_is_unsat : ap_lincons1_t -> bool
	= "camlidl_lincons1_ap_lincons1_is_unsat"

external ap_lincons1_extend_environment : ap_lincons1_t -> Environment.ap_environment_ptr -> ap_lincons1_t
	= "camlidl_lincons1_ap_lincons1_extend_environment"

external ap_lincons1_extend_environment_with : ap_lincons1_t -> Environment.ap_environment_ptr -> unit
	= "camlidl_lincons1_ap_lincons1_extend_environment_with"


let make linexpr1 typ = {
lincons0 = {
Lincons0.linexpr0 = linexpr1.Linexpr1.linexpr0;
Lincons0.typ = typ;
};
env = linexpr1.Linexpr1.env;
}
let copy cons = {
lincons0 = Lincons0.copy cons.lincons0;
env = cons.env;
}
let string_of_typ = Lincons0.string_of_typ

let print fmt cons = 
Lincons0.print
(fun dim -> Var.to_string (Environment.var_of_dim cons.env dim)) fmt cons.lincons0;
 ()
let get_typ cons = cons.lincons0.Lincons0.typ
let set_typ cons typ = cons.lincons0.Lincons0.typ <- typ
let get_cst cons = Linexpr0.get_cst cons.lincons0.Lincons0.linexpr0
let set_cst cons cst = Linexpr0.set_cst cons.lincons0.Lincons0.linexpr0 cst
let get_lincons0 cons = cons.lincons0
let get_env cons = cons.env
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

let iter f cons =
Linexpr0.iter
(begin fun coeff dim ->
f coeff (Environment.var_of_dim cons.env dim)
end)
cons.lincons0.Lincons0.linexpr0
let get_linexpr1 cons = {
Linexpr1.linexpr0 = cons.lincons0.Lincons0.linexpr0;
Linexpr1.env = cons.env;
}
(* ====================================================================== *)
(** {2 Type array} *)
(* ====================================================================== *)
external ap_lincons1_array_extend_environment : ap_lincons1_array_t -> Environment.ap_environment_ptr -> ap_lincons1_array_t
	= "camlidl_lincons1_ap_lincons1_array_extend_environment"

external ap_lincons1_array_extend_environment_with : ap_lincons1_array_t -> Environment.ap_environment_ptr -> unit
	= "camlidl_lincons1_ap_lincons1_array_extend_environment_with"


let array_make env size =
let cons = Lincons0.make (Linexpr0.make None) Lincons0.EQ in
{
lincons0_array = Array.make size cons;
array_env = env
}
let array_print
?(first=("[|@[<hov>":(unit,Format.formatter,unit) format))
?(sep = (";@ ":(unit,Format.formatter,unit) format))
?(last = ("@]|]":(unit,Format.formatter,unit) format))
fmt array 
= 
Abstract0.print_array ~first ~sep ~last
(Lincons0.print
(fun dim -> Var.to_string (Environment.var_of_dim array.array_env dim)))
	fmt array.lincons0_array;
()
let array_length array = Array.length (array.lincons0_array)
let array_get_env array = array.array_env
let array_get array index =
let cons0 = array.lincons0_array.(index) in
{ lincons0 = cons0; env = array.array_env; }
let array_set array index cons1 =
if not (Environment.equal array.array_env cons1.env) then
failwith "Lincons1.array_set: environments are not the same"
else
array.lincons0_array.(index) <- cons1.lincons0;


(* File generated from generator1.idl *)

type ap_generator1_t = {
  mutable_generator0: Generator0.ap_generator0_t;
  mutable_env: Environment.ap_environment_ptr;
}
and ap_generator1_array_t = {
  mutable_generator0_array: Generator0.ap_generator0_array_t;
  mutable_array_env: Environment.ap_environment_ptr;
}

(** APRON Generators and array of generators of level 1 *)

type typ = Generator0.typ = 
| LINE
| RAY
| VERTEX
| LINEMOD
| RAYMOD

external ap_generator1_get_coeff : ap_generator1_t -> Var.ap_var_t -> Coeff.ap_coeff_t
	= "camlidl_generator1_ap_generator1_get_coeff"

external ap_generator1_set_coeff : ap_generator1_t -> Var.ap_var_t -> Coeff.ap_coeff_t -> unit
	= "camlidl_generator1_ap_generator1_set_coeff"

external ap_generator1_extend_environment : ap_generator1_t -> Environment.ap_environment_ptr -> ap_generator1_t
	= "camlidl_generator1_ap_generator1_extend_environment"

external ap_generator1_extend_environment_with : ap_generator1_t -> Environment.ap_environment_ptr -> unit
	= "camlidl_generator1_ap_generator1_extend_environment_with"


let make linexpr1 gentyp = {
generator0 = {
Generator0.linexpr0 = linexpr1.Linexpr1.linexpr0;
Generator0.typ = gentyp;
};
env = linexpr1.Linexpr1.env;
}
let copy gen = {
generator0 = Generator0.copy gen.generator0;
env = gen.env;
}
let print fmt gen = 
Generator0.print
(fun dim -> Var.to_string (Environment.var_of_dim gen.env dim)) fmt gen.generator0;
 ()
let get_typ gen = gen.generator0.Generator0.typ
let set_typ gen typ = gen.generator0.Generator0.typ <- typ
let get_generator0 gen = gen.generator0
let get_env gen = gen.env
let set_list expr list = 
List.iter
(fun (coeff,var) -> set_coeff expr var coeff )
list;
()
let set_array expr tab = 
Array.iter
(fun (coeff,var) -> set_coeff expr var coeff )
tab;
()

let iter f gen =
Linexpr0.iter
(begin fun coeff dim ->
f coeff (Environment.var_of_dim gen.env dim)
end)
gen.generator0.Generator0.linexpr0
let get_linexpr1 gen = {
Linexpr1.linexpr0 = gen.generator0.Generator0.linexpr0;
Linexpr1.env = gen.env;
}
(* ====================================================================== *)
(** {2 Type earray} *)
(* ====================================================================== *)
external ap_generator1_array_extend_environment : ap_generator1_array_t -> Environment.ap_environment_ptr -> ap_generator1_array_t
	= "camlidl_generator1_ap_generator1_array_extend_environment"

external ap_generator1_array_extend_environment_with : ap_generator1_array_t -> Environment.ap_environment_ptr -> unit
	= "camlidl_generator1_ap_generator1_array_extend_environment_with"


let array_make env size =
let gen = Generator0.make (Linexpr0.make None) Generator0.LINE in
{
generator0_array = Array.make size gen;
array_env = env
}
let array_print
?(first=("[|@[<hov>":(unit,Format.formatter,unit) format))
?(sep = (";@ ":(unit,Format.formatter,unit) format))
?(last = ("@]|]":(unit,Format.formatter,unit) format))
fmt array 
= 
Abstract0.print_array ~first ~sep ~last
(Generator0.print
(fun dim -> Var.to_string (Environment.var_of_dim array.array_env dim)))
 fmt array.generator0_array;
()
let array_length array = Array.length (array.generator0_array)
let array_get array index =
let gen0 = array.generator0_array.(index) in
{ generator0 = gen0; env = array.array_env; }
let array_set array index gen1 =
if not (Environment.equal array.array_env gen1.env) then
failwith "Expr1.array_set: environments are not the same"
else
array.generator0_array.(index) <- gen1.generator0;


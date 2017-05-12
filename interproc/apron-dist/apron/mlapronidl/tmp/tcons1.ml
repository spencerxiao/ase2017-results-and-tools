(* File generated from tcons1.idl *)

type ap_tcons1_t = {
  mutable_tcons0: Tcons0.ap_tcons0_t;
  mutable_env: Environment.ap_environment_ptr;
}
and ap_tcons1_array_t = {
  mutable_tcons0_array: Tcons0.ap_tcons0_array_t;
  mutable_array_env: Environment.ap_environment_ptr;
}

(** APRON tree constraints and array of tree constraints of level 1 *)

type typ = Lincons0.typ =
| EQ
| SUPEQ
| SUP
| DISEQ
| EQMOD of Scalar.t

external ap_tcons1_extend_environment : ap_tcons1_t -> Environment.ap_environment_ptr -> ap_tcons1_t
	= "camlidl_tcons1_ap_tcons1_extend_environment"

external ap_tcons1_extend_environment_with : ap_tcons1_t -> Environment.ap_environment_ptr -> unit
	= "camlidl_tcons1_ap_tcons1_extend_environment_with"


let make texpr1 typ = {
tcons0 = {
Tcons0.texpr0 = texpr1.Texpr1.texpr0;
Tcons0.typ = typ;
};
env = texpr1.Texpr1.env;
}
let copy cons = {
tcons0 = Tcons0.copy cons.tcons0;
env = cons.env;
}
let string_of_typ = Tcons0.string_of_typ

let print fmt cons = 
Tcons0.print
(fun dim -> Var.to_string (Environment.var_of_dim cons.env dim)) fmt cons.tcons0;
 ()
let get_typ cons = cons.tcons0.Tcons0.typ
let set_typ cons typ = cons.tcons0.Tcons0.typ <- typ
let get_tcons0 cons = cons.tcons0
let get_env cons = cons.env
let get_texpr1 cons = {
Texpr1.texpr0 = cons.tcons0.Tcons0.texpr0;
Texpr1.env = cons.env;
}
(* ====================================================================== *)
(** {2 Type array} *)
(* ====================================================================== *)
external ap_tcons1_array_extend_environment : ap_tcons1_array_t -> Environment.ap_environment_ptr -> ap_tcons1_array_t
	= "camlidl_tcons1_ap_tcons1_array_extend_environment"

external ap_tcons1_array_extend_environment_with : ap_tcons1_array_t -> Environment.ap_environment_ptr -> unit
	= "camlidl_tcons1_ap_tcons1_array_extend_environment_with"


let array_make env size =
let cons = Tcons0.make (Texpr0.cst (Coeff.s_of_int 0)) Tcons0.EQ in
	{
tcons0_array = Array.make size cons;
array_env = env
}
let array_print
?(first=("[|@[<hov>":(unit,Format.formatter,unit) format))
?(sep = (";@ ":(unit,Format.formatter,unit) format))
?(last = ("@]|]":(unit,Format.formatter,unit) format))
fmt array 
= 
Abstract0.print_array ~first ~sep ~last
(Tcons0.print
(fun dim -> Var.to_string (Environment.var_of_dim array.array_env dim)))
	fmt array.tcons0_array;
()
let array_length array = Array.length (array.tcons0_array)
let array_get_env array = array.array_env
let array_get array index =
let cons0 = array.tcons0_array.(index) in
{ tcons0 = cons0; env = array.array_env; }
let array_set array index cons1 =
if not (Environment.equal array.array_env cons1.env) then
failwith "Tcons1.array_set: environments are not the same"
else
array.tcons0_array.(index) <- cons1.tcons0;


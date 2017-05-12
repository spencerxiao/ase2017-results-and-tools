(* File generated from tcons0.idl *)

type ap_tcons0_t = {
  mutable texpr0 : Texpr0.t;
  mutable typ : Lincons0.typ;
}
and ap_tcons0_array_t = ap_tcons0_t array


type typ = Lincons0.typ =
| EQ
| SUPEQ
| SUP
| DISEQ
| EQMOD of Scalar.t


let string_of_typ = Lincons0.string_of_typ

let print assoc fmt cons = 
Texpr0.print assoc fmt cons.texpr0;
Format.fprintf fmt " %s 0" (string_of_typ cons.typ);
begin match cons.typ with
| EQMOD x -> Format.fprintf fmt " mod %a" Scalar.print x;
| _ -> ()
end;
()
let make expr typ = {
texpr0 = expr; typ = typ 
}
let copy cons = {
texpr0 = Texpr0.copy cons.texpr0; typ = cons.typ
}


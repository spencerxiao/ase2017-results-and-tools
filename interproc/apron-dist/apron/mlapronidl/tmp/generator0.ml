(* File generated from generator0.idl *)

type gentyp =
  | LINE
  | RAY
  | VERTEX
  | LINEMOD
  | RAYMOD
and ap_generator0_t = {
  mutable_linexpr0: Linexpr0.ap_linexpr0_ptr;
  mutable_typ: gentyp;
}
and ap_generator0_array_t = ap_generator0_t array


let string_of_typ = function
| LINE -> "LIN"
| RAY -> "RAY"
| VERTEX -> "VTX"
| LINEMOD -> "LINMOD"
| RAYMOD -> "RAYMOD"

let print assoc fmt gen = 
Format.fprintf fmt "%s:" (string_of_typ gen.gentyp);
Linexpr0.print assoc fmt gen.linexpr0;
()
let make expr typ = {
linexpr0 = expr; typ = typ;
}
let copy gen = {
linexpr0 = Linexpr0.copy gen.linexpr0; typ = gen.typ;
}


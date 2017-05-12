(* File generated from linexpr0.idl *)

type ap_linexpr0_ptr

external ap_linexpr0_make : int option -> ap_linexpr0_ptr
	= "camlidl_linexpr0_ap_linexpr0_make"

external ap_linexpr0_minimize : ap_linexpr0_ptr -> unit
	= "camlidl_linexpr0_ap_linexpr0_minimize"

external ap_linexpr0_copy : ap_linexpr0_ptr -> ap_linexpr0_ptr
	= "camlidl_linexpr0_ap_linexpr0_copy"

external ap_linexpr0_compare : ap_linexpr0_ptr -> ap_linexpr0_ptr -> int
	= "camlidl_linexpr0_ap_linexpr0_compare"

external ap_linexpr0_hash : ap_linexpr0_ptr -> int
	= "camlidl_linexpr0_ap_linexpr0_hash"

external ap_linexpr0_get_size : ap_linexpr0_ptr -> int
	= "camlidl_linexpr0_ap_linexpr0_get_size"

external ap_linexpr0_get_cst : ap_linexpr0_ptr -> Coeff.ap_coeff_t
	= "camlidl_linexpr0_ap_linexpr0_get_cst"

external ap_linexpr0_get_coeff : ap_linexpr0_ptr -> int -> Coeff.ap_coeff_t
	= "camlidl_linexpr0_ap_linexpr0_get_coeff"

external ap_linexpr0_set_cst : ap_linexpr0_ptr -> Coeff.ap_coeff_t -> unit
	= "camlidl_linexpr0_ap_linexpr0_set_cst"

external ap_linexpr0_set_coeff : ap_linexpr0_ptr -> int -> Coeff.ap_coeff_t -> unit
	= "camlidl_linexpr0_ap_linexpr0_set_coeff"


external ap_linexpr0_iter: (Coeff.t -> Dim.t -> unit) -> ap_linexpr0_ptr -> unit = "camlidl_expr0_linexpr0_iter"
 

let set_list expr list ocst = 
List.iter
(fun (coeff,dim) -> set_coeff expr dim coeff )
list;
begin match ocst with
| Some cst -> set_cst expr cst
| None -> ()
end;
()
let set_array expr tab ocst = 
Array.iter
(fun (coeff,dim) -> set_coeff expr dim coeff )
tab;
begin match ocst with
| Some cst -> set_cst expr cst
| None -> ()
end;
()

let of_list osize list ocst =
let expr = make osize in
set_list expr list ocst;
expr
let of_array osize tab ocst =
let expr = make osize in
set_array expr tab ocst;
expr

let print assoc fmt expr = 
Format.fprintf fmt "@[<hov>";
let first = ref true in
iter
(begin fun coeff dim ->
let coeff = Coeff.reduce coeff in
let sgn = match coeff with
| Coeff.Scalar x -> Scalar.sgn x
| Coeff.Interval i ->
if Interval.is_zero i then 0 else 1
in
if sgn <> 0 then begin
if not !first then Format.fprintf fmt "@,";
if sgn>0 then begin
if not !first then Format.pp_print_string fmt "+";
end;
begin match coeff with
| Coeff.Scalar scalar ->
if Scalar.equal_int scalar (-1) then
Format.pp_print_string fmt "-"
else if not (Scalar.equal_int scalar 1) then
Scalar.print fmt scalar;
| Coeff.Interval i ->
Interval.print fmt i
end;
Format.pp_print_string fmt (assoc dim);
first := false;
end;
end)
expr;
begin match get_cst expr with
| Coeff.Scalar scalar ->
let sgn = Scalar.sgn scalar in
if sgn <> 0 then begin
if not !first then Format.fprintf fmt "@,";
if sgn>0 && not !first then Format.pp_print_char fmt '+';
Scalar.print fmt scalar;
end
else if !first then
Format.pp_print_char fmt '0';
| Coeff.Interval i ->
if not (Interval.is_zero i) then begin
if not !first then Format.pp_print_char fmt '+';
Interval.print fmt i
end
else if !first then
Format.pp_print_char fmt '0';
end;
Format.fprintf fmt "@]";
()


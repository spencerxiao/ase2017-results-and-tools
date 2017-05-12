(* File generated from environment.idl *)

type typvar =
  | AP_INT
  | AP_REAL
and ap_environment_ptr

(** APRON Environments binding dimensions to names *)
external ap_environment_make : Var.ap_var_t array -> Var.ap_var_t array -> ap_environment_ptr
	= "camlidl_environment_ap_environment_make"

external ap_environment_add : ap_environment_ptr -> Var.ap_var_t array -> Var.ap_var_t array -> ap_environment_ptr
	= "camlidl_environment_ap_environment_add"

external ap_environment_remove : ap_environment_ptr -> Var.ap_var_t array -> ap_environment_ptr
	= "camlidl_environment_ap_environment_remove"

external ap_environment_rename : ap_environment_ptr -> Var.ap_var_t array -> Var.ap_var_t array -> ap_environment_ptr
	= "camlidl_environment_ap_environment_rename"

external ap_environment_rename_perm : ap_environment_ptr -> Var.ap_var_t array -> Var.ap_var_t array -> ap_environment_ptr * Dim.ap_dimperm_t
	= "camlidl_environment_ap_environment_rename_perm"

external ap_environment_lce : ap_environment_ptr -> ap_environment_ptr -> ap_environment_ptr
	= "camlidl_environment_ap_environment_lce"

external ap_environment_lce_change : ap_environment_ptr -> ap_environment_ptr -> ap_environment_ptr * Dim.ap_dimchange_t option * Dim.ap_dimchange_t option
	= "camlidl_environment_ap_environment_lce_change"

external ap_environment_dimchange : ap_environment_ptr -> ap_environment_ptr -> Dim.ap_dimchange_t
	= "camlidl_environment_ap_environment_dimchange"

external ap_environment_dimchange2 : ap_environment_ptr -> ap_environment_ptr -> Dim.ap_dimchange2_t
	= "camlidl_environment_ap_environment_dimchange2"

external ap_environment_equal : ap_environment_ptr -> ap_environment_ptr -> bool
	= "camlidl_environment_ap_environment_equal"

external ap_environment_compare : ap_environment_ptr -> ap_environment_ptr -> int
	= "camlidl_environment_ap_environment_compare"

external ap_environment_hash : ap_environment_ptr -> int
	= "camlidl_environment_ap_environment_hash"

external ap_environment_dimension : ap_environment_ptr -> Dim.ap_dimension_t
	= "camlidl_environment_ap_environment_dimension"

external ap_environment_size : ap_environment_ptr -> int
	= "camlidl_environment_ap_environment_size"

external ap_environment_mem_var : ap_environment_ptr -> Var.ap_var_t -> bool
	= "camlidl_environment_ap_environment_mem_var"

external ap_environment_typ_of_var : ap_environment_ptr -> Var.ap_var_t -> typvar
	= "camlidl_environment_ap_environment_typ_of_var"

external ap_environment_vars : ap_environment_ptr -> Var.ap_var_t array * Var.ap_var_t array
	= "camlidl_environment_ap_environment_vars"

external ap_environment_var_of_dim : ap_environment_ptr -> Dim.ap_dim_t -> Var.ap_var_t
	= "camlidl_environment_ap_environment_var_of_dim"

external ap_environment_dim_of_var : ap_environment_ptr -> Var.ap_var_t -> Dim.ap_dim_t
	= "camlidl_environment_ap_environment_dim_of_var"


(** Printing *)

let print
?(first=("[|@[":(unit,Format.formatter,unit) format))
?(sep = (";@ ":(unit,Format.formatter,unit) format))
?(last = ("@]|]":(unit,Format.formatter,unit) format))
(fmt:Format.formatter)
(env: t)
: unit
=
let dim = dimension env in
if dim.Dim.intd+dim.Dim.reald=0 then begin
Format.fprintf fmt first;
Format.fprintf fmt last;
end
else begin
Format.fprintf fmt first;
let first = ref true in
for i=0 to pred dim.Dim.intd do
let var = var_of_dim env i in
if !first then first := false else Format.fprintf fmt sep;
Format.fprintf fmt "%i> %s:int"
i (Var.to_string var)
done;
for i=dim.Dim.intd to dim.Dim.intd + (pred dim.Dim.reald) do
let var = var_of_dim env i in
if !first then first := false else Format.fprintf fmt sep;
Format.fprintf fmt "%i> %s:real"
i (Var.to_string var)
done;
Format.fprintf fmt last;
end


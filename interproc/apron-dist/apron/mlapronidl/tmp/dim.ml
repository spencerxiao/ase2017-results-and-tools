(* File generated from dim.idl *)

type ap_dim_t = int
and ap_dimchange_t = {
  dim : int array;
  intdim : int;
  realdim : int;
}
and ap_dimchange2_t = {
  add: ap_dimchange_t option;
  remove: ap_dimchange_t option;
}
and ap_dimperm_t = int array
and ap_dimension_t = {
  intd: int;
  reald: int;
}

(** APRON Dimensions and related types *)

let change_add_invert change =
  let dim = change.dim in
  for i=0 to (Array.length dim)-1 do
    dim.(i) <- dim.(i) + i;
  done

let perm_compose perm1 perm2 =
  let length = Array.length perm1 in
  assert(length==(Array.length perm2));
  Array.init length (fun i -> perm2.(perm1.(i)))

let perm_invert perm =
  let length = Array.length perm in
  let res = Array.make length 0 in
  for i=0 to length-1 do
    res.(perm.(i)) <- i;
  done;
  res


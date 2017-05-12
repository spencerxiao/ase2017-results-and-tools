(** Standard statistics functions *)

let sq x = x *. x

let mean tab =
  (Array.fold_left (+.) 0.0 tab) /. (float_of_int (Array.length tab))

let variance mean tab = 
  (Array.fold_left
    (fun res elt -> res +. (sq (elt -. mean)))
    0.0 tab)
  /.
  (float_of_int (Array.length tab))

let std_deviation mean tab =
  sqrt (variance mean tab)



(** Hashhe specialized for keys of type string *)

include Hashhe.Make(
  struct 
    type t=string
    let hash = Hashtbl.hash
    let equal=(=)
  end
)

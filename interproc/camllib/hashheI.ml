(** Hashhe specialized for keys of type int *)

include Hashhe.Make(
  struct 
    type t=int
    external hash : int -> int = "%identity"
    let equal = (=)
  end
)

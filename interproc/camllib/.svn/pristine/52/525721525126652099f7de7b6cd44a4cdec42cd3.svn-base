(** Sette specialized for keys of type string *)

include Sette.Make(
  struct
    type t=string
    let compare=String.compare
  end
)

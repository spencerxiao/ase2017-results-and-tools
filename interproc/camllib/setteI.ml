(** Sette specialized for keys of type int *)

include Sette.Make(
  struct
    type t=int
    let compare=(-)
  end
)

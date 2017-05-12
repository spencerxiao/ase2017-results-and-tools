(** Two-way map between two ordered data types, parametrized polymorphic version  *)

(** Same interface as {!DMappe}. *)

type ('a, 'b) t
val mapx : ('a, 'b) t -> ('a, 'b) PMappe.t
val mapy : ('a, 'b) t -> ('b, 'a) PMappe.t
val is_empty : ('a, 'b) t -> bool
val empty : ('a -> 'a -> int) -> ('b -> 'b -> int) -> ('a, 'b) t
val add : 'a -> 'b -> ('a, 'b) t -> ('a, 'b) t
val y_of_x : 'a -> ('a, 'b) t -> 'b
val x_of_y : 'a -> ('b, 'a) t -> 'b
val remove : 'a -> ('a, 'b) t -> ('a, 'b) t
val removex : 'a -> ('a, 'b) t -> ('a, 'b) t
val removey : 'b -> ('a, 'b) t -> ('a, 'b) t
val memx : 'a -> ('a, 'b) t -> bool
val memy : 'a -> ('b, 'a) t -> bool
val merge : ('a, 'b) t -> ('a, 'b) t -> ('a, 'b) t
val common : ('a, 'b) t -> ('a, 'b) t -> ('a, 'b) t
val intersetx : ('a, 'b) t -> 'a PSette.t -> ('a, 'b) t
val intersety : ('a, 'b) t -> 'b PSette.t -> ('a, 'b) t
val diffsetx : ('a, 'b) t -> 'a PSette.t -> ('a, 'b) t
val diffsety : ('a, 'b) t -> 'b PSette.t -> ('a, 'b) t
val iter : ('a -> 'b -> unit) -> ('a, 'b) t -> unit
val fold : ('a -> 'b -> 'c -> 'c) -> ('a, 'b) t -> 'c -> 'c
val setx : ('a, 'b) t -> 'a PSette.t
val sety : ('a, 'b) t -> 'b PSette.t
val equalx : ('a, 'b) t -> ('a, 'b) t -> bool
val equaly : ('a, 'b) t -> ('a, 'b) t -> bool
val subsetx : ('a, 'b) t -> ('a, 'b) t -> bool
val subsety : ('a, 'b) t -> ('a, 'b) t -> bool
val cardinal : ('a, 'b) t -> int
val print :
  ?first:(unit, Format.formatter, unit) format ->
  ?sep:(unit, Format.formatter, unit) format ->
  ?last:(unit, Format.formatter, unit) format ->
  ?firstbind:(unit, Format.formatter, unit) format ->
  ?sepbind:(unit, Format.formatter, unit) format ->
  ?lastbind:(unit, Format.formatter, unit) format ->
  (Format.formatter -> 'a -> unit) ->
  (Format.formatter -> 'b -> unit) ->
  Format.formatter -> ('a, 'b) t -> unit


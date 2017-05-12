(** Two-way hashtable between two data types, parametrized polymorpphic version *)

(** Same interface as {!DHashhe}, but each hash table stores its
    comparison functions. *)

type ('a, 'b) t = {
  xy : ('a, 'b) PHashhe.t;
  yx : ('b, 'a) PHashhe.t;
}
val hashx : ('a, 'b) t -> ('a, 'b) PHashhe.t
val hashy : ('a, 'b) t -> ('b, 'a) PHashhe.t
val clear : ('a, 'b) t -> unit
val create_compare :
  'a Hashhe.compare -> 'b Hashhe.compare ->
  int -> ('a, 'b) t
val create :
  ('a -> int) -> ('a -> 'a -> bool) ->
  ('b -> int) -> ('b -> 'b -> bool) ->
  int -> ('a, 'b) t
val add : ('a, 'b) t -> 'a -> 'b -> unit
val y_of_x : ('a, 'b) t -> 'a -> 'b
val x_of_y : ('a, 'b) t -> 'b -> 'a
val removex : ('a, 'b) t -> 'a -> unit
val removey : ('a, 'b) t -> 'b -> unit
val memx : ('a, 'b) t -> 'a -> bool
val memy : ('a, 'b) t -> 'b -> bool
val iter : ('a, 'b) t -> ('a -> 'b -> unit) -> unit
val fold : ('a, 'b) t -> 'c -> ('a -> 'b -> 'c -> 'c) -> 'c
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

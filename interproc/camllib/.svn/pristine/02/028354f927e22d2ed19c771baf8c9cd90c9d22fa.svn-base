(** Two-way map between two ordered data types *)

(** Functional semantics of operations.  The generic interface assumess that
  types ['a] and ['b] should be comparable with the standard
  [Pervasives.compare] function. *)

type ('a, 'b) t
  (** The type of two-way maps *)
val mapx : ('a,'b) t -> ('a,'b) Mappe.t
val mapy : ('a,'b) t -> ('b,'a) Mappe.t
  (** Return the correspondance map resp. from x to y and from y to x. *)
val empty : ('a, 'b) t
  (** Empty map *)
val add : 'a -> 'b -> ('a, 'b) t -> ('a, 'b) t
  (** Add a new binding to the current map and return the new map. *)
val y_of_x : 'a -> ('a, 'b) t -> 'b
  (** Association *)
val x_of_y : 'b -> ('a, 'b) t -> 'a
  (** Inverse association *)
val remove : 'a -> ('a, 'b) t -> ('a, 'b) t
  (** Remove a binding defined by its first element and return the new map. *)
val memx : 'a -> ('a, 'b) t -> bool
  (** Is the object in the map ? *)
val memy : 'b -> ('a, 'b) t -> bool
  (** Is the object in the map ? *)
val merge : ('a, 'b) t -> ('a, 'b) t -> ('a, 'b) t
  (** Merge the two double associations. If a key is bound to different
    data in the two arguments, raise [Failure]. *)
val common : ('a, 'b) t -> ('a, 'b) t -> ('a, 'b) t
  (** Return the common bindings. If a key is bound to different
    data in the two arguments, raise [Failure]. *)
val intersetx : ('a, 'b) t -> 'a Sette.t -> ('a, 'b) t
  (** Select the two-way bindings [x <->y] with [x] in the set *)
val intersety : ('a, 'b) t -> 'b Sette.t -> ('a, 'b) t
  (** Select the two-way bindings [x <->y] with [y] in the set *)
val diffsetx : ('a, 'b) t -> 'a Sette.t -> ('a, 'b) t
  (** Remove the two-way bindings [x <->y] with [x] in the set *)
val diffsety : ('a, 'b) t -> 'b Sette.t -> ('a, 'b) t
  (** Remove the two-way bindings [x <->y] with [y] in the set *)
val iter : ('a -> 'b -> unit) -> ('a, 'b) t -> unit
  (** Iterate on bindings. *)
val fold : ('a -> 'b -> 'c -> 'c) -> ('a, 'b) t -> 'c -> 'c
  (** Iterate on bindings and accumulating a result. *)
val setx : ('a, 'b) t -> 'a Sette.t
  (** Return the set of all objects in the first place of bindings. *)
val sety : ('a, 'b) t -> 'b Sette.t
  (** Return the set of all objects in the second place of bindings. *)
val equalx : ('a, 'b) t -> ('a, 'b) t -> bool
val equaly : ('a, 'b) t -> ('a, 'b) t -> bool
val subsetx : ('a, 'b) t -> ('a, 'b) t -> bool
val subsety : ('a, 'b) t -> ('a, 'b) t -> bool
  (** Test two two-way association for equality and inclusion.  the [x] and [y]
    variants resp. exploit the tables [x->y] and [y->x].  For (slight)
    efficieny reason, one can choose one or the other variant.
*)
val cardinal : ('a, 'b) t -> int
  (** Return the number of bindings. *)
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
    (** Print the set of bindings. *)

(** Input signature of the functor {!DMappe.Make}. *)
module type Param = sig
  module MappeX : Mappe.S
  module MappeY : Mappe.S
end

(** Output signature of the functor {!DMappe.Make}. *)
module type S = sig
  module MappeX : Mappe.S
  module MappeY : Mappe.S
  type x = MappeX.key
  type y = MappeY.key
  type t

  val mapx : t -> y MappeX.t
  val mapy : t -> x MappeY.t
  val is_empty : t -> bool
  val empty : t
  val add : x -> y -> t -> t
  val y_of_x : x -> t -> y
  val x_of_y : y -> t -> x
  val remove : x -> t -> t
  val memx : x -> t -> bool
  val memy : y -> t -> bool
  val merge : t -> t -> t
  val common : t -> t -> t
  val intersetx : t -> MappeX.Setkey.t -> t
  val intersety : t -> MappeY.Setkey.t -> t
  val diffsetx : t -> MappeX.Setkey.t -> t
  val diffsety : t -> MappeY.Setkey.t -> t
  val iter : (x -> y -> unit) -> t -> unit
  val fold : (x -> y -> 'c -> 'c) -> t -> 'c -> 'c
  val setx : t -> MappeX.Setkey.t
  val sety : t -> MappeY.Setkey.t
  val equalx : t -> t -> bool
  val equaly : t -> t -> bool
  val subsetx : t -> t -> bool
  val subsety : t -> t -> bool
  val cardinal : t -> int
  val print :
    ?first:(unit, Format.formatter, unit) format ->
    ?sep:(unit, Format.formatter, unit) format ->
    ?last:(unit, Format.formatter, unit) format ->
    ?firstbind:(unit, Format.formatter, unit) format ->
    ?sepbind:(unit, Format.formatter, unit) format ->
    ?lastbind:(unit, Format.formatter, unit) format ->
    (Format.formatter -> x -> unit) ->
    (Format.formatter -> y -> unit) ->
    Format.formatter -> t -> unit
end

(** Functor building an implementation of the DMappe structure
   given two map structures. *)
module Make(P : Param) :
  S with module MappeX = P.MappeX
    and module MappeY = P.MappeY

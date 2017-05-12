(** Two-way hashtable between two data types *)

type ('a, 'b) t = {
  xy : ('a,'b) Hashhe.t;
  yx : ('b,'a) Hashhe.t
}
  (** The type of two-way hashtables, meant to be abstract *)

val hashx : ('a,'b) t -> ('a,'b) Hashhe.t
val hashy : ('a,'b) t -> ('b,'a) Hashhe.t
  (** Return the correspondance hashtable resp. from x to y and from y to x.
      Never modify it !!! *)
val clear : ('a,'b) t -> unit
(** Empty a hash table. Use [reset] instead of [clear] to shrink the
    size of the bucket table to its initial size. *)
val reset : ('a,'b) t -> unit
(** Empty a hash table and shrink the size of the bucket table
    to its initial size. *)
val create : int -> ('a, 'b) t
  (** Create a new table, with the specified initial size *)
val add : ('a, 'b) t -> 'a -> 'b -> unit
  (** Add a new binding to the table. *)
val y_of_x : ('a, 'b) t -> 'a -> 'b
  (** Association. *)
val x_of_y : ('a, 'b) t -> 'b -> 'a
  (** Inverse association. *)
val removex : ('a, 'b) t -> 'a -> unit
  (** Remove a binding defined by its first element. *)
val removey : ('a, 'b) t -> 'b -> unit
  (** Remove a binding defined by its second element. *)
val memx : ('a, 'b) t -> 'a -> bool
  (** Is the object registered ? *)
val memy : ('a, 'b) t -> 'b -> bool
  (** Is the object registered  ? *)
val iter : ('a, 'b) t -> ('a -> 'b -> unit) -> unit
    (** Iterate on bindings. *)
val fold : ('a, 'b) t -> 'c -> ('a -> 'b -> 'c -> 'c) -> 'c
    (** Iterate on bindings and accumulating a result. *)
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
  (Format.formatter -> 'b -> unit) -> Format.formatter -> ('a, 'b) t -> unit
    (** Print the set of bindings. *)


(** Input signature of the functor {!DHashhe.Make}. *)
module type Param = sig
  module HashX : Hashhe.S
    (** Hashtable for objects in the first place of bindings *)
  module HashY : Hashhe.S
    (** Hashtable for objects in the second place of bindings *)
end

(** Output signature of the functor {!DHashhe.Make}. *)
module type S = sig
  module HashX : Hashhe.S
  module HashY : Hashhe.S
  type x = HashX.key
  type y = HashY.key
  type t
  val hashx : t -> y HashX.t
  val hashy : t -> x HashY.t
  val clear : t -> unit
  val reset : t -> unit
  val create : int -> t
  val add : t -> x -> y -> unit
  val y_of_x : t -> x -> y
  val x_of_y : t -> y -> x
  val removex : t -> x -> unit
  val removey : t -> y -> unit
  val memx : t -> x -> bool
  val memy : t -> y -> bool
  val iter : t -> (x -> y -> unit) -> unit
  val fold : t -> 'a -> (x -> y -> 'a -> 'a) -> 'a
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

(** Functor building an implementation of the DHashtbl structure
   given two hashtables *)
module Make(P : Param) : (S with module HashX = P.HashX
			    and module HashY = P.HashY)

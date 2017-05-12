(** Sets over totally ordered type with lists. All operations over sets are
    purely applicative (no side-effects). *)

type 'a t
      (** The type of sets over elements of type ['a]. *)

val print :
  ?first:(unit, Format.formatter, unit) format ->
  ?sep:(unit, Format.formatter, unit) format ->
  ?last:(unit, Format.formatter, unit) format ->
  (Format.formatter -> 'a -> unit) -> Format.formatter -> 'a t -> unit
      (** Printing function *)

val empty : 'a t
    (** The empty set. *)
val is_empty : 'a t -> bool
    (** Test whether a set is empty or not. *)
val mem : 'a -> 'a t -> bool
    (** [mem x s] tests whether [x] belongs to the set [s]. *)
val of_list : 'a list -> 'a t
    (** Conversion from a list (unsafe operation) *)
val to_list : 'a t -> 'a list
    (** Conversion to a list *)
val singleton : 'a -> 'a t
    (** [singleton x] returns the one-element set containing only [x]. *)
val add : 'a -> 'a t -> 'a t
    (** [add x s] returns a set containing all elements of [s],
	   plus [x]. If [x] was already in [s], [s] is returned unchanged. *)
val remove : 'a -> 'a t -> 'a t
    (** [remove x s] returns a set containing all elements of [s], except
       [x]. If [x] was not in [s], [s] is returned unchanged. *)

val union : 'a t -> 'a t -> 'a t
val inter : 'a t -> 'a t -> 'a t
val diff : 'a t -> 'a t -> 'a t
	(** Union, intersection and set difference. *)

val compare : 'a t -> 'a t -> int
    (** Total ordering between sets. Can be used as the ordering function
       for doing sets of sets. *)
val equal : 'a t -> 'a t -> bool
    (** [equal s1 s2] tests whether the sets [s1] and [s2] are
       equal, that is, contain equal elements. *)
val subset : 'a t -> 'a t -> bool
    (** [subset s1 s2] tests whether the set [s1] is a subset of
       the set [s2]. *)
val iter : ('a -> unit) -> 'a t -> unit
    (** [iter f s] applies [f] in turn to all elements of [s].
       The order in which the elements of [s] are presented to [f]
       is in ascending order. *)

val fold : ('a -> 'b -> 'b) -> 'a t -> 'b -> 'b
    (** [fold f s a]
       computes [(f xN ... (f x2 (f x1 a))...)],
       where [x1 ... xN] are the elements of [s].
       The order in which elements of [s] are presented to [f] is
       in ascending order.
      @param f function
      @param s set
      @param a accumulator
      @return the computed accumulator
      @raise Not_found if no fount
    *)
val fold_right : ('a -> 'b -> 'b) -> 'a t -> 'b -> 'b
val fold_left : ('b -> 'a -> 'b) -> 'b -> 'a t -> 'b
    (** Idem as [List.fold_X] functions *)
val cardinal : 'a t -> int
    (** Return the number of elements of a set. *)
val elements : 'a t -> 'a list
    (** Return the list of all elements of the given set.  The returned list
       is sorted in increasing order with respect to the ordering
       [Pervasives.compare]. *)
val min_elt : 'a t -> 'a
    (** Return the smallest element of the given set (with respect to the
       [Pervasives.compare] ordering), or raise [Not_found] if the set is
       empty. *)
val max_elt : 'a t -> 'a
    (** Same as [min_elt], but returns the largest element of the given
       set. *)
val choose : 'a t -> 'a
    (** Return one element of the given set, or raise [Not_found] if the set
       is empty. Which element is chosen is unspecified, but equal elements
       will be chosen for equal sets. *)
val filter : ('a -> bool) -> 'a t -> 'a t
    (** [filter p s] returns the set of all elements in [s]
       that satisfy predicate [p]. *)
val partition : ('a -> bool) -> 'a t -> ('a t * 'a t)
    (** [partition p s] returns a pair of sets [(s1, s2)], where [s1] is the
       set of all the elements of [s] that satisfy the predicate [p], and [s2]
       is the set of all the elements of [s] that do not satisfy [p]. *)
val exists : ('a -> bool) -> 'a t -> bool
    (** [exists p s] checks if at least one element of
       the set satisfies the predicate [p]. *)
val for_all : ('a -> bool) -> 'a t -> bool
    (** [for_all p s] checks if all elements of the set
       satisfy the predicate [p]. *)

(** Output signature of the functor {!SetList.Make} *)
module type S =
  sig
    type elt
      (** The type of the set elements. *)
    type t
      (** The type of sets. *)
    val print :
      ?first:(unit, Format.formatter, unit) format ->
      ?sep:(unit, Format.formatter, unit) format ->
      ?last:(unit, Format.formatter, unit) format ->
      (Format.formatter -> elt -> unit) -> Format.formatter -> t -> unit
      (** Printing function *)
    val empty : t
      (** The empty set. *)
    val is_empty : t -> bool
      (** Test whether a set is empty or not. *)
    val mem : elt -> t -> bool
      (** [mem x s] tests whether [x] belongs to the set [s]. *)
    val of_list : elt list -> t
      (** Conversion from a list (unsafe operation) *)
    val to_list : t -> elt list
      (** Conversion to a list *)
    val singleton : elt -> t
      (** [singleton x] returns the one-element set containing only [x]. *)
    val add : elt -> t -> t
      (** [add x s] returns a set containing all elements of [s],
	   plus [x]. If [x] was already in [s], [s] is returned unchanged. *)
    val remove : elt -> t -> t
      (** [remove x s] returns a set containing all elements of [s], except
	[x]. If [x] was not in [s], [s] is returned unchanged. *)
    val union : t -> t -> t
    val inter : t -> t -> t
    val diff : t -> t -> t
	(** Union, intersection and set difference. *)

    val compare : t -> t -> int
      (** Total ordering between sets. Can be used as the ordering function
	for doing sets of sets. *)
    val equal : t -> t -> bool
      (** [equal s1 s2] tests whether the sets [s1] and [s2] are
	equal, that is, contain equal elements. *)
    val subset : t -> t -> bool
      (** [subset s1 s2] tests whether the set [s1] is a subset of
	the set [s2]. *)
    val iter : (elt -> unit) -> t -> unit
      (** [iter f s] applies [f] in turn to all elements of [s].
	The order in which the elements of [s] are presented to [f]
	is in ascending order. *)
    val fold : (elt -> 'a -> 'a) -> t -> 'a -> 'a
      (** [fold f s a]
	computes [(f xN ... (f x2 (f x1 a))...)],
	where [x1 ... xN] are the elements of [s].
	The order in which elements of [s] are presented to [f] is
	in ascending order.
	@param f function
	@param s set
	@param a accumulator
	@return the computed accumulator
	@raise Not_found if no fount
      *)
    val fold_right : (elt -> 'a -> 'a) -> t -> 'a -> 'a
    val fold_left : ('a -> elt -> 'a) -> 'a -> t -> 'a
      (** Idem as [List.fold_X] functions *)
    val cardinal : t -> int
      (** Return the number of elements of a set. *)
    val elements : t -> elt list
      (** Return the list of all elements of the given set.  The returned list
	is sorted in increasing order. *)
    val min_elt : t -> elt
      (** Return the smallest element of the given set (with respect to the
	[Ord.compare] ordering), or raise [Not_found] if the set is empty. *)
    val max_elt : t -> elt
      (** Same as [min_elt], but returns the largest element of the given
	set. *)
    val choose : t -> elt
      (** Return one element of the given set, or raise [Not_found] if the set
	is empty. Which element is chosen is unspecified, but equal elements
	will be chosen for equal sets. *)
    val filter : (elt -> bool) -> t -> t
      (** [filter p s] returns the set of all elements in [s]
	that satisfy predicate [p]. *)
    val partition : (elt -> bool) -> t -> (t * t)
      (** [partition p s] returns a pair of sets [(s1, s2)], where [s1] is the
	set of all the elements of [s] that satisfy the predicate [p], and [s2]
	is the set of all the elements of [s] that do not satisfy [p]. *)
    val exists : (elt -> bool) -> t -> bool
      (** [exists p s] checks if at least one element of
	the set satisfies the predicate [p]. *)
    val for_all : (elt -> bool) -> t -> bool
      (** [for_all p s] checks if all elements of the set satisfy the predicate
	[p]. *)
  end

(** Functor building an implementation of the SetList structure
   given a totally ordered type. *)
module Make(Ord: Set.OrderedType): (S with type elt = Ord.t)

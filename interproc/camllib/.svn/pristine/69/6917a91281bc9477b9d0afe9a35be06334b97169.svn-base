(** Multisets implemented with lists *)

type 'a t
      (** The type of multisets over elements of type 'a. *)

val of_set : 'a SetList.t -> 'a t
      (** Conversion from sets of module [SetList]. *)
val to_set : 'a t -> 'a SetList.t
      (** [to_set m] returns the set of elements in the multiset [m]. *)
val empty : 'a t
    (** The empty multiset. *)
val is_empty : 'a t -> bool
    (** Test whether a multiset is empty or not. *)
val mem : 'a -> 'a t -> bool
    (** [mem x s] tests whether [x] belongs to the multiset [s]. *)
val mult : 'a -> 'a t -> int
    (** [mult elt mset] returns the number of occurences of the element [elt]
      in the multiset [mset]. *)
val singleton : 'a * int -> 'a t
    (** [singleton x] returns the one-element multiset containing only [x]. *)
val add : 'a * int -> 'a t -> 'a t
    (** [add x s] returns a multiset containing all elements of [s], plus
      [x]. If [x] was already in [s], its occurence number is incremented. *)
val remove : 'a * int -> 'a t -> 'a t
    (** [remove x s] returns a multiset containing all elements of [s], with
      the occurence number of [x] decremented.  If it becomes [0], [x] is not
      anymore in [s]. If [x] was not in [s], [s] is returned unchanged. *)

val union : 'a t -> 'a t -> 'a t
val inter : 'a t -> 'a t -> 'a t
val diff : 'a t -> 'a t -> 'a t
	(** Union, intersection and multiset difference. *)
val union_set : 'a t -> 'a SetList.t -> 'a t
val inter_set : 'a t -> 'a SetList.t -> 'a t
val diff_set : 'a t -> 'a SetList.t -> 'a t
	(** Union, intersection and multiset difference with a set. *)
val compare : 'a t -> 'a t -> int
    (** Total ordering between multisets. Can be used as the ordering function
       for doing sets of multisets. *)
val equal : 'a t -> 'a t -> bool
    (** [equal s1 s2] tests whether the multisets [s1] and [s2] are equal, that
       is, contain equal elements with equal occurence numbers. *)
val subset : 'a t -> 'a t -> bool
    (** [subset s1 s2] tests whether the multiset [s1] is a subset of
       the multiset [s2]. *)
val iter : (('a * int) -> unit) -> 'a t -> unit
    (** [iter f s] applies [f] in turn to all elements of [s], with their
      occurence number.  The order in which the elements of [s] are presented
      to [f] is in ascending order. *)
val fold : (('a * int) -> 'b -> 'b) -> 'a t -> 'b -> 'b
    (** [fold f s a] computes [(f (xN,On) ... (f (x2,O2) (f (x1,o1) a))...)],
       where [(x1,o1) ... (xN,oN)] are pairs of elements of [s] with their
       occurence number.  The order in which elements of [s] are presented to
       [f] is in ascending order.
    *)
val fold_right : (('a * int) -> 'b -> 'b) -> 'a t -> 'b -> 'b
val fold_left : ('b -> ('a * int) -> 'b) -> 'b -> 'a t -> 'b
    (** Idem as [List.fold_X] functions *)
val filter : ('a -> bool) ->  'a t -> 'a t
    (** [filter p l] returns all the elements of the multiset [l] that satisfy
      the predicate [p]. *)
val partition : ('a -> bool) ->  'a t -> 'a t * 'a t
    (** [partition p l] returns a pair of multisets [(l1, l2)], where [l1] is
      the multiset of all the elements of [l] that satisfy the predicate [p],
      and [l2] is the multiset of all the elements of [l] that do not satisfy
      [p]. *)
val cardinal : 'a t -> int
    (** Return the number of elements of a multiset. *)
val elements : 'a t -> 'a SetList.t
    (** Return the list of all elements of the given multiset.  The returned
      list is sorted in increasing order with respect to the ordering
      [Pervasives.compare]. *)
val min_elt : 'a t -> 'a
    (** Return the smallest element of the given multiset (with respect to the
      [Pervasives.compare] ordering), or raise [Not_found] if the multiset is
      empty. *)
val max_elt : 'a t -> 'a
    (** Same as [min_elt], but returns the largest element of the given
       multiset. *)
val min : 'a t -> 'a * int
    (** Return an element with the minimum occurence number, or raise
      [Not_found] if the multiset is empty. Which element is chosen is
      unspecified, but equal elements will be chosen for equal multisets. *)
val max : 'a t -> 'a * int
    (** Return an element with the maximum occurence number, or raise
      [Not_found] if the multiset is empty. Which element is chosen is
      unspecified, but equal elements will be chosen for equal multisets. *)
val mins : 'a t -> 'a SetList.t * int
    (** Return the set of elements with the minimum occurence number, or raise
      [Not_found] if the multiset is empty. *)
val maxs : 'a t -> 'a SetList.t * int
    (** Return the set of elements with the maximum occurence number, or raise
      [Not_found] if the multiset is empty. *)
val choose : 'a t -> 'a
    (** Return one element of the given multiset, or raise [Not_found] if the
      multiset is empty. Which element is chosen is unspecified, but equal
      elements will be chosen for equal multisets. *)
val print :
  ?first:(unit, Format.formatter, unit) format ->
  ?sep:(unit, Format.formatter, unit) format ->
  ?last:(unit, Format.formatter, unit) format ->
  (Format.formatter -> 'a -> unit) ->
  Format.formatter -> 'a t -> unit
    (** Printing function *)

(** Output signature of the functor {!MultiSetList.Make} *)
module type S =
  sig
    type elt
      (** Type of multiset elements *)
    type t
      (** Type of multisets over type [elt]. *)
    val empty: t
      (** The empty multiset. *)
    val is_empty: t -> bool
      (** Test whether a multiset is empty or not. *)
    val mem: elt -> t -> bool
      (** [mem x s] tests whether [x] belongs to the multiset [s]. *)
    val mult: elt -> t -> int
      (** [mult elt mset] returns the number of occurences of the element [elt]
	in the multiset [mset]. *)
    val singleton: elt * int -> t
      (** [singleton x] returns the one-element multiset containing only
	[x]. *)
    val add: elt * int -> t -> t
      (** [add x s] returns a multiset containing all elements of [s], plus
	[x]. If [x] was already in [s], its occurence number is incremented. *)
    val remove: elt * int -> t -> t
      (** [remove x s] returns a multiset containing all elements of [s], with
	the occurence number of [x] decremented.  If it becomes [0], [x] is not
	anymore in [s]. If [x] was not in [s], [s] is returned unchanged. *)
    val union: t -> t -> t
    val inter: t -> t -> t
    val diff: t -> t -> t
	  (** Union, intersection and multiset difference. *)
    val union_set : t -> elt SetList.t -> t
    val inter_set: t -> elt SetList.t -> t
    val diff_set: t -> elt SetList.t -> t
	  (** Union, intersection and multiset difference with a set. *)
    val compare: t -> t -> int
      (** Total ordering between multisets. Can be used as the ordering
	function for doing sets of multisets. *)
    val equal: t -> t -> bool
      (** [equal s1 s2] tests whether the multisets [s1] and [s2] are equal,
	that is, contain equal elements with equal occurence numbers. *)
    val subset: t -> t -> bool
      (** [subset s1 s2] tests whether the multiset [s1] is a subset of
	the multiset [s2]. *)
    val iter: ((elt * int) -> unit) -> t -> unit
      (** [iter f s] applies [f] in turn to all elements of [s], with their
	occurence number.  The order in which the elements of [s] are presented
	to [f] is in ascending order. *)
    val fold: ((elt * int) -> 'a -> 'a) -> t -> 'a -> 'a
      (** [fold f s a] computes [(f (xN,On) ... (f (x2,O2) (f (x1,o1) a))...)],
	where [(x1,o1) ... (xN,oN)] are pairs of elements of [s] with their
	occurence number.  The order in which elements of [s] are presented to
	[f] is in ascending order.
      *)
    val fold_right: ((elt * int) -> 'a -> 'a) -> t -> 'a -> 'a
    val fold_left: ('a -> (elt * int) -> 'a) -> 'a -> t -> 'a
      (** Idem as [List.fold_X] functions *)
    val filter : (elt -> bool) ->  t -> t
      (** [filter p l] returns all the elements of the multiset [l] that
	satisfy the predicate [p]. *)
    val partition : (elt -> bool) ->  t -> t * t
      (** [partition p l] returns a pair of multisets [(l1, l2)], where [l1] is
      the multiset of all the elements of [l] that satisfy the predicate [p],
      and [l2] is the multiset of all the elements of [l] that do not satisfy
      [p]. *)
    val cardinal: t -> int
      (** Return the number of elements of a multiset. *)
    val elements: t -> elt SetList.t
      (** Return the list of all elements of the given multiset.  The returned
	list is sorted in increasing order with respect to the ordering
	[Pervasives.compare]. *)
    val min_elt: t -> elt
      (** Return the smallest element of the given multiset (with respect to the
	[Pervasives.compare] ordering), or raise [Not_found] if the multiset is
	empty. *)
    val max_elt: t -> elt
      (** Same as [min_elt], but returns the largest element of the given
	multiset. *)
    val min: t -> elt * int
      (** Return an element with the minimum occurence number, or raise
	[Not_found] if the multiset is empty. Which element is chosen is
	unspecified, but equal elements will be chosen for equal multisets. *)
    val max: t -> elt * int
      (** Return an element with the maximum occurence number, or raise
	[Not_found] if the multiset is empty. Which element is chosen is
	unspecified, but equal elements will be chosen for equal multisets. *)
    val mins: t -> elt SetList.t * int
      (** Return the set of elements with the minimum occurence number, or
	raise [Not_found] if the multiset is empty. *)
    val maxs: t -> elt SetList.t * int
      (** Return the set of elements with the maximum occurence number, or
	raise [Not_found] if the multiset is empty. *)
    val choose: t -> elt
      (** Return one element of the given multiset, or raise [Not_found] if the
	multiset is empty. Which element is chosen is unspecified, but equal
	elements will be chosen for equal multisets. *)
    val of_set: elt SetList.t -> t
	(** Conversion from sets of module [SetList]. *)
    val to_set: t -> elt SetList.t
	(** [to_set m] returns the set of elements in the multiset [m]. *)
    val print:
      ?first:(unit, Format.formatter, unit) format ->
      ?sep:(unit, Format.formatter, unit) format ->
      ?last:(unit, Format.formatter, unit) format ->
      (Format.formatter -> elt -> unit) -> Format.formatter -> t -> unit
      (** Printing function *)

  end

(** Functor building an implementation of the MultiSetList structure
   given a totally ordered type. *)
module Make(Ord: Set.OrderedType) : (S with type elt = Ord.t)

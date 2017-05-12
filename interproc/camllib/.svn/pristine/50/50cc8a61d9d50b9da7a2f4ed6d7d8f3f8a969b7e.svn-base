(** Symbol table, for string management *)

type t
  (** Type of symbols (actually integers) *)

val add: string -> t
  (** Returns the symbol associated to the given string, after having possibly
    registered the string if it wasn't (in this case, the symbol is fresh
    symbol). *)
val exists: string -> bool
  (** Is the string already registered ? *)
val of_string: string -> t
  (** Returns the {e existing} symbol associated to the (registered)
    string. Raises [Not_found] otherwise. *)
val to_string: t -> string
  (** Returns the string represented by the symbol. *)
val print: Format.formatter -> t -> unit
  (** Prints the symbol (its associated string). *)
val equal: t -> t -> bool
  (** Equality test *)
val compare: t -> t -> int
  (** Comparison (do not correspond at all to alphabetic order, depend on the
    registration order of names in the module) *)

module HashedType: (Hashtbl.HashedType with type t=t)
  (** To use hashtables on type [t] *)
module OrderedType: (Set.OrderedType with type t=t)
  (** To use sets or maps on type [t] *)

module Hash: (Hashtbl.S with type key=t)
  (** Hashtables on type [t] *)
module Set: (Sette.S with type elt=t)
  (** Sets on type [t] *)
module Map: (Mappe.S with type key=t
		     and module Setkey=Set)
  (** Maps on type [t] *)

val print_set: Format.formatter -> Set.t -> unit
  (** Prints sets of symbols. *)
val print_hash: 
    (Format.formatter -> 'a -> unit) -> Format.formatter -> 'a Hash.t -> unit
  (** Prints hashtables on symbols. *)
val print_map: 
    (Format.formatter -> 'a -> unit) -> Format.formatter -> 'a Map.t -> unit
  (** Prints maps on symbols. *)


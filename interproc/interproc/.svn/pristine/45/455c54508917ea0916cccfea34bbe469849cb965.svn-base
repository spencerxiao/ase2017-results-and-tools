(** Boolean expressions *)

(* This file is part of the Interproc analyzer, released under GPL license.
   Please read the COPYING file packaged in the distribution.

   Copyright (C) Mathias Argoud, Gaël Lalire, Bertrand Jeannet 2007.
*)

(** Type of a Boolean expression under DNF, parametrized by the
    type of conjunctions. False is represented by [DISJ([])].
*)
type 'conj t =
  | TRUE
  | DISJ of 'conj list

val print :
  (Format.formatter -> 'conj -> unit) -> Format.formatter -> 'conj t -> unit
  (** Printing function, parametrized by a printing function for conjunctions *)

val map : ('conda -> 'condb) -> 'conda t -> 'condb t
val map2 : ('conda -> 'condb -> 'condc) -> 'conda t -> 'condb t -> 'condc t
val fold2 : ('acc -> 'conda -> 'condb -> 'acc) -> 'acc -> 'conda t -> 'condb t -> 'acc
  (** Map-iterator, based on a conjunction transformer *)

(*  ********************************************************************* *)
(** {2 Constructors for Boolean expressions} *)
(*  ********************************************************************* *)

(** Some of these constructors may simplify the resulting expressions. *)

val make_cst : bool -> 'conj t
val make_conjunction : 'conj -> 'conj t
val make_or : 'conj t -> 'conj t -> 'conj t
val make_and :
  cand:('conj -> 'conj -> 'conj t) ->
  'conj t -> 'conj t -> 'conj t
  (** Conjunction, parametrized by conjunction function
      on conjunctions *)
val make_not :
  cand:('conj -> 'conj -> 'conj t) ->
  cnegate:('conj -> 'conj t) ->
  'conj t -> 'conj t
  (** Negation, parametrized by conjunction and negation functions
      on conjunctions *)

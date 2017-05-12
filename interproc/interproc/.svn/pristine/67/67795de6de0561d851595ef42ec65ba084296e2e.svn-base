(** Generating equations from abstract syntax tree *)

(* This file is part of the Interproc analyzer, released under GPL license.
   Please read the COPYING file packaged in the distribution.

   Copyright (C) Mathias Argoud, Gaël Lalire, Bertrand Jeannet 2007.
*)

(*  ********************************************************************* *)
(** {2 Forward analysis} *)
(*  ********************************************************************* *)

module Forward : sig
  val make :Spl_syn.program -> Equation.graph
    (** Generates the equation graph for forward analysis from a program. *)
end

(*  ********************************************************************* *)
(** {2 Backward analysis} *)
(*  ********************************************************************* *)


module Backward : sig
  val make :Spl_syn.program -> Equation.graph
    (** Generates the equation graph for backward analysis from a program. *)
end

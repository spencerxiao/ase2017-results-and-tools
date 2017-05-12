(** *)

(* This file is part of the Interproc analyzer, released under GPL license.
   Please read the COPYING file packaged in the distribution.

   Copyright (C) Mathias Argoud, Gaël Lalire, Bertrand Jeannet 2007.
*)

val parse_lexbuf : Format.formatter -> Lexing.lexbuf -> Spl_syn.program

val build_graphs : Format.formatter -> Spl_syn.program -> Equation.graph * Equation.graph
val compute_and_display :
  Format.formatter ->
  Spl_syn.program ->
  Equation.graph -> Equation.graph -> 
  'a Apron.Manager.t -> 
  unit

val analyze_and_display : Format.formatter -> Spl_syn.program -> unit

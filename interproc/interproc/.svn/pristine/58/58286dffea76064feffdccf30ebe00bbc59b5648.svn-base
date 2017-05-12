(** Solving the equations *)

(* This file is part of the Interproc analyzer, released under GPL license.
   Please read the COPYING file packaged in the distribution.

   Copyright (C) Mathias Argoud, Gaël Lalire, Bertrand Jeannet 2007.
*)

type 'a policy = 'a Apron.Policy.t Boolexpr.t

module Forward : sig
  val apply :
    Equation.graph ->
    output:(Equation.vertex, int, 'a Apron.Abstract1.t, unit)
      Fixpoint.output option ref ->
    policy:(Equation.hedge, 'a policy) Hashhe.t ref ->
    'a Apron.Policy.man ->
    Equation.hedge ->
    'a Apron.Abstract1.t array -> unit * 'a Apron.Abstract1.t
  val compute :
    fmt:Format.formatter ->
    Spl_syn.program ->
    Equation.graph ->
    output:(Equation.vertex, int, 'a Apron.Abstract1.t, unit)
      Fixpoint.output option ->
    'a Apron.Policy.man ->
    debug:int ->
    (Equation.vertex, Equation.hedge, 'a Apron.Abstract1.t, unit)
      Fixpoint.output
end

module Backward : sig
  val apply :
    Equation.graph ->
    output:(Equation.vertex, int, 'a Apron.Abstract1.t, unit)
      Fixpoint.output option ref ->
    policy:(Equation.hedge, 'a policy) Hashhe.t ref ->
    'a Apron.Policy.man ->
    Equation.hedge ->
    'a Apron.Abstract1.t array -> unit * 'a Apron.Abstract1.t
  val compute :
    fmt:Format.formatter ->
    Spl_syn.program ->
    Equation.graph ->
    output:(Equation.vertex, int, 'a Apron.Abstract1.t, unit)
      Fixpoint.output option ->
    'a Apron.Policy.man ->
    debug:int ->
    (Equation.vertex, Equation.hedge, 'a Apron.Abstract1.t, unit)
      Fixpoint.output
end

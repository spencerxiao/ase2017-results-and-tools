(** Solving the equations *)

(* This file is part of the Interproc analyzer, released under GPL license.
   Please read the COPYING file packaged in the distribution.

   Copyright (C) Mathias Argoud, Gaël Lalire, Bertrand Jeannet 2007.
*)

val make_fpmanager :
  fmt:Format.formatter ->
  output:(Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output option ->
  debug:int ->
  graph:Equation.graph ->
  man:'a Apron.Manager.t ->
  abstract_init:(Spl_syn.point -> 'a Apron.Abstract1.t) ->
  apply:(Equation.graph ->
    output:(Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output option ->
    'a Apron.Manager.t ->
    Equation.hedge ->
    'a Apron.Abstract1.t array -> unit * 'a Apron.Abstract1.t) ->
  (Spl_syn.point, Equation.hedge, 'a Apron.Abstract1.t, unit) Fixpoint.manager

(*  ********************************************************************* *)
(** {2 Forward analysis} *)
(*  ********************************************************************* *)

module Forward : sig
  val apply_tassign :
    'a Apron.Manager.t ->
    'a Apron.Abstract1.t ->
    Apron.Var.t ->
    Apron.Texpr1.t -> 'a Apron.Abstract1.t option -> 'a Apron.Abstract1.t
  val apply_condition :
    'a Apron.Manager.t ->
    'a Apron.Abstract1.t ->
    Apron.Tcons1.earray Boolexpr.t ->
    'a Apron.Abstract1.t option -> 'a Apron.Abstract1.t
  val apply_call :
    'a Apron.Manager.t ->
    'a Apron.Abstract1.t ->
    Equation.procinfo ->
    Apron.Var.t array ->
    'a Apron.Abstract1.t option -> 'a Apron.Abstract1.t
  val apply_return :
    'a Apron.Manager.t ->
    'a Apron.Abstract1.t ->
    'a Apron.Abstract1.t ->
    Equation.procinfo ->
    Apron.Var.t array ->
    Apron.Var.t array ->
    'a Apron.Abstract1.t option -> 'a Apron.Abstract1.t
  val apply :
    Equation.graph ->
    output:(Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output option ->
    'a Apron.Manager.t ->
    Equation.hedge -> 'a Apron.Abstract1.t array ->
    unit * 'a Apron.Abstract1.t
      (** Applying a transfer function, given
	  - the equation graph ;
	  - optionally, the result of a previous, backward analysis;
	  - an APRON manager;
	  - an hyperedge identifier;
	  - an array of input abstract values
      *)

  val compute :
    fmt:Format.formatter ->
    Equation.graph ->
    output:(Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output option ->
    'a Apron.Manager.t ->
    debug:int ->
    (Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output
      (** Compute (post)fixpoint, given
	  - the equation graph;
	  - optionally, the result of a previous, backward analysis
	  - an APRON manager;
	  - a debug level
      *)
end

(*  ********************************************************************* *)
(** {2 Backward analysis} *)
(*  ********************************************************************* *)

module Backward : sig
  val apply_tassign :
    'a Apron.Manager.t ->
    'a Apron.Abstract1.t ->
    Apron.Var.t ->
    Apron.Texpr1.t -> 'a Apron.Abstract1.t option -> 'a Apron.Abstract1.t
  val apply_condition :
    'a Apron.Manager.t ->
    'a Apron.Abstract1.t ->
    Apron.Tcons1.earray Boolexpr.t ->
    'a Apron.Abstract1.t option -> 'a Apron.Abstract1.t
  val apply_call :
    'a Apron.Manager.t ->
    'a Apron.Abstract1.t ->
    Equation.procinfo ->
    Equation.procinfo ->
    Apron.Var.t array ->
    'a Apron.Abstract1.t option -> 'a Apron.Abstract1.t
  val apply_return :
    'a Apron.Manager.t ->
    'a Apron.Abstract1.t ->
    Equation.procinfo ->
    Equation.procinfo ->
    Apron.Var.t array ->
    Apron.Var.t array ->
    'a Apron.Abstract1.t option -> 'a Apron.Abstract1.t
  val apply :
    Equation.graph ->
    output:(Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output option ->
    'a Apron.Manager.t ->
    Equation.hedge -> 'a Apron.Abstract1.t array ->
    unit * 'a Apron.Abstract1.t
      (** Applying a transfer function *)

  val compute :
    fmt:Format.formatter ->
    Spl_syn.program ->
    Equation.graph ->
    output:(Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output option ->
    'a Apron.Manager.t ->
    debug:int ->
    (Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output
      (** Compute (post)fixpoint *)
end

val print_output :
  Spl_syn.program ->
  Format.formatter ->
  (Spl_syn.point, int, 'a Apron.Abstract1.t, unit) Fixpoint.output ->
  unit

(*  ********************************************************************* *)
(** {2 Internal useful for {!SolvingPolicy}} *)
(*  ********************************************************************* *)
val make_emptyoutput :
  (Spl_syn.point, int, 'a, 'b, Equation.info) PSHGraph.t ->
  'c Apron.Manager.t ->
  (Spl_syn.point, int, 'c Apron.Abstract1.t, unit) Fixpoint.output
val environment_of_tvar :
  (Apron.Var.t -> Apron.Environment.typvar) ->
  Apron.Var.t array -> Apron.Environment.t

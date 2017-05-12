(** Printing an (annotated) abstract syntax tree *)

(* This file is part of the Interproc analyzer, released under GPL license.
   Please read the COPYING file packaged in the distribution.

   Copyright (C) Mathias Argoud, Gaël Lalire, Bertrand Jeannet 2007.
*)

open Spl_syn

(** Generic function for list printing *)
val print_list :
  ?first:(unit, Format.formatter, unit) format ->
  ?sep:(unit, Format.formatter, unit) format ->
  ?last:(unit, Format.formatter, unit) format ->
  (Format.formatter -> 'a -> unit) -> Format.formatter -> 'a list -> unit
 
(** {2 Simple printing functions} *)

val print_point : Format.formatter -> point -> unit
val print_poutput : Format.formatter -> var list -> unit
val print_pinput : Format.formatter -> var list -> unit
val print_var : Format.formatter -> var -> unit
val print_typ : Format.formatter -> typ -> unit
val print_iexpr : Format.formatter -> iexpr -> unit
val print_typcons : Format.formatter -> constyp -> unit
val print_cons : Format.formatter -> cons -> unit
val print_bexpr : Format.formatter -> bexpr -> unit

(** {2 Other printing functions} *)

(** The following functions takes as first argument a printing function for
  type [Spl_syn.point]. *)

val print_instr :
  (Format.formatter -> point -> unit) ->
  Format.formatter -> instr -> unit
val print_block :
  (Format.formatter -> point -> unit) ->
  Format.formatter -> block -> unit
val print_declaration : Format.formatter -> var * typ -> unit
val print_declarations :
  Format.formatter -> (var * typ) list -> unit
val print_procedure :
  (Format.formatter -> point -> unit) ->
  Format.formatter -> procedure -> unit
val print_program :
  (Format.formatter -> point -> unit) ->
  Format.formatter -> program -> unit

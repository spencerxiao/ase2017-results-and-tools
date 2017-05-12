(**  Argument, Options and Parsing of command line *)

(* This file is part of the Interproc analyzer, released under GPL license.
   Please read the COPYING file packaged in the distribution.

   Copyright (C) Mathias Argoud, Gaël Lalire, Bertrand Jeannet 2007.
*)

val inputfilename : string ref
  (** input filename *)
val debug : int ref
  (** debug level *)

(*  ---------------------------------------------------------------------- *)
(** {3 Solving options} *)
(*  ---------------------------------------------------------------------- *)

val iteration_depth : int ref
  (** Depth of recursion in iteration. If the depth is deeper, one tries to
    stabilize inner loops first before propagating to enclosing loops.*)

val iteration_guided : bool ref
  (** Guided iteration technique *)

val widening_start : int ref
  (** Number of steps without widening *)

val widening_descend : int ref
  (** Number of descending iterations *)

val dot_fmt : Format.formatter option ref
  (** Optional dot output *)

(*  ---------------------------------------------------------------------- *)
(** {3 Display style} *)
(*  ---------------------------------------------------------------------- *)

type displaytags = {
  precolorB : string;
  precolorR : string;
  precolorG : string;
  postcolor : string;
}
val texttags : displaytags
val colortags : displaytags
val htmltags : displaytags

val displaytags : displaytags ref

val print_box : bool ref

(*  ---------------------------------------------------------------------- *)
(** {3 Choice of abstract domain} *)
(*  ---------------------------------------------------------------------- *)

type domain =
  | Box
  | Octagon
  | PolkaLoose
  | PolkaStrict
  | PolkaEq
  | Taylor1plus
  | PplPolyLoose
  | PplPolyStrict
  | PplGrid
  | PolkaGrid
  | BoxPolicy
val assocnamedomain : (string * domain) list
val domain : domain ref

(*  ---------------------------------------------------------------------- *)
(** {3 Choice of analysis type} *)
(*  ---------------------------------------------------------------------- *)

type analysis = Forward | Backward
val analysis : analysis list ref

(*  ---------------------------------------------------------------------- *)
(** {3 Speclist} *)
(*  ---------------------------------------------------------------------- *)

val speclist : (Arg.key * Arg.spec * Arg.doc) list

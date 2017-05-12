(** Spl language Abstract Syntax tree *)

(* This file is part of the Interproc analyzer, released under GPL license.
   Please read the COPYING file packaged in the distribution.

   Copyright (C) Mathias Argoud, Gaël Lalire, Bertrand Jeannet 2007.
*)

(*  ********************************************************************* *)
(** {2 Variables} *)
(*  ********************************************************************* *)

(** Variable *)
type var = Apron.Var.t

(** Types of variables *)
type typ = INT | REAL

(*  ********************************************************************* *)
(** {2 Expressions} *)
(*  ********************************************************************* *)

(** Numerical expressions *)
type iexpr = Apron.Texpr1.expr

(** Numerical constraint type *)
type constyp = EQ | NEQ | GT | GEQ | LEQ | LT

(** Numerical constraint *)
type cons = iexpr * constyp * iexpr

(** Boolean expression *)
type bexpr =
  | TRUE
  | FALSE
  | BRANDOM
  | CONS of cons
  | AND  of bexpr*bexpr
  | OR   of bexpr*bexpr
  | NOT  of bexpr (** *)

(** Control point in the program *)
type point = {
  line : int;
  col : int;
  char : int;
}

(*  ********************************************************************* *)
(** {2 Instructions} *)
(*  ********************************************************************* *)

(** Instruction *)
type instruction =
  | SKIP
    (** Do nothing *)
  | HALT
    (** Halt the execution *)
  | FAIL
    (** Halt the execution, but also indicate a final point for backward
      analysis *)
  | ASSUME of bexpr
    (** Semantically equivalent to [if expr then skip; else halt;] *)
  | ASSIGN of Apron.Var.t * iexpr
    (** Assignement of a (numerical) variable *)
  | CALL   of var list * string * var list 
    (** Procedure call [(x,y) = f(a,b)] *)
  | IF     of bexpr * block
    (** If-then instruction *)
  | IFELSE of bexpr * block * block
    (** If-then-else instruction *)
  | LOOP   of bexpr * block
    (** While instruction *)

(** Labelled instruction *)
and instr = {
  instruction: instruction; (** instruction *)
  mutable ipoint : point;   (** label *)
}

(** Sequence of instructions *)
and block = {
  mutable bpoint : point; (** label preceding the first instruction of the
			     sequence *) 
  instrs : instr list;    (** Labelled instruction list *)
}

(** Variable declaration *)
type declaration = var * typ

(** Procedure declaration (main procedure has empty name) *)
type procedure = {
  pname : string;
  (** Procedure name *)
  pinput : declaration list;
  (** List of input paramaeers *)
  poutput : declaration list;
  (** List of output parameters *)
  plocal : declaration list;
  (** Local variables *)
  pcode : block;
  (** Code of the procedure *)
}

(** Program *)
type program = {
  procedures : procedure list;
  (** List of the procedures of the program.  It is assumed that a main
    procedure, with empty name [""], belongs to this list. *)
}

(*  ********************************************************************* *)
(** {2 Iterators on blocks} *)
(*  ********************************************************************* *)

(** Applies [f] on all instructions, contained in the block, in the natural
    reading order, beginning by enclosing instruction.  [f] is actually given a
    pair [p,instr], where [p] is the control point preceding the instruction.
*)
val iter_instr : (point * instr -> unit) -> block -> unit

(** Applies [f] on all elementary instructions (assignements and calls)
    contained in the block, in the natural reading order.  [f] is actually
    given a pair [p,instr], where [p] is the control point preceding 
    the instruction.
*)
val iter_eltinstr : (point * instr -> unit) -> block -> unit


(*  ********************************************************************* *)
(** {2 Exceptions} *)
(*  ********************************************************************* *)

val start_of_comment : Lexing.position ref
exception Unterminated_comment of Lexing.position
  (** Raised during lexical analysis *)

exception Error
  (** Lexical or syntaxical analysis *)

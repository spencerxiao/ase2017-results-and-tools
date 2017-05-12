/* This file is part of the Interproc analyzer, released under GPL license.
   Please read the COPYING file packaged in the distribution.

   Copyright (C) Mathias Argoud, Gaël Lalire, Bertrand Jeannet 2007.
*/

%{
open Spl_syn
%}

/* tokens */
%token TK_LPAR TK_RPAR TK_BRANDOM TK_RANDOM TK_ASSUME TK_HALT TK_FAIL TK_VAR TK_DONE TK_END TK_ENDIF TK_SKIP
%token TK_PROC TK_WHILE TK_IF
%token <(Apron.Texpr1.typ * Apron.Texpr1.round)> TK_MUL
%token <(Apron.Texpr1.typ * Apron.Texpr1.round)> TK_ADD
%token <(Apron.Texpr1.typ * Apron.Texpr1.round)> TK_SUB
%token <(Apron.Texpr1.typ * Apron.Texpr1.round)> TK_DIV
%token <(Apron.Texpr1.typ * Apron.Texpr1.round)> TK_MODULO
%token <(Apron.Texpr1.typ * Apron.Texpr1.round)> TK_CAST
%token <(Apron.Texpr1.typ * Apron.Texpr1.round)> TK_SQRT
%token <Mpqf.t> TK_MPQF
%token <float> TK_FLOAT

%token TK_PLUS TK_MINUS TK_TIMES TK_LEQ TK_GEQ TK_LT TK_GT TK_EQ TK_NEQ TK_AF
%token TK_AND TK_OR TK_NOT
%token TK_COMMA TK_RETURNS TK_COLON
%token TK_INT TK_REAL
%token <string> TK_ID
%token <Spl_syn.point> TK_DO TK_THEN TK_ELSE TK_BEGIN TK_SEMICOLON
%token TK_TRUE TK_FALSE
%token TK_EOF



/* precedence */
%nonassoc TK_SEMICOLON
%nonassoc TK_WHILE TK_DO TK_DONE
%nonassoc TK_IF TK_THEN
%nonassoc TK_ELSE
%nonassoc TK_LPAR TK_RPAR TK_BEGIN TK_END
%left TK_OR
%left TK_AND
%nonassoc TK_NOT
%nonassoc TK_LEQ TK_GEQ TK_L TK_G TK_EQ TK_NEQ TK_AF

/* types */
%type <Spl_syn.program> program
%type <Spl_syn.bexpr> bexpr
%type <Spl_syn.iexpr> iexpr

%start program
%%

bexpr :
  TK_LPAR bexpr TK_RPAR                   { $2 }
| bexpr TK_AND bexpr                     { AND ($1,$3) }
| bexpr TK_OR  bexpr                     { OR  ($1,$3) }
| TK_NOT bexpr                           { NOT  $2 }
| icons                                  { CONS $1 }
| TK_TRUE                                { TRUE }
| TK_FALSE                               { FALSE }
| TK_BRANDOM                               { BRANDOM }

icons:
  iexpr TK_EQ iexpr  { ($1,EQ,$3) }
| iexpr TK_NEQ iexpr { ($1,NEQ,$3) }
| iexpr TK_GT iexpr   { ($1,GT,$3) }
| iexpr TK_GEQ iexpr   { ($1,GEQ,$3) }
| iexpr TK_LEQ iexpr   { ($1,LEQ,$3) }
| iexpr TK_LT iexpr   { ($1,LT,$3) }

iexpr_random:
  iexpr { $1 }
| TK_RANDOM { Apron.Texpr1.Cst (Apron.Coeff.i_of_float neg_infinity infinity) }
iexpr:
  iexpr TK_ADD iexpr_1
    { let (t,r) = $2 in Apron.Texpr1.Binop(Apron.Texpr1.Add,$1,$3,t,r) }
| iexpr TK_SUB iexpr_1
    { let (t,r) = $2 in Apron.Texpr1.Binop(Apron.Texpr1.Sub,$1,$3,t,r) }
| iexpr_1
    { $1 }

iexpr_1:
  iexpr_1 TK_MUL iexpr_2
    { let (t,r) = $2 in Apron.Texpr1.Binop(Apron.Texpr1.Mul,$1,$3,t,r) }
| iexpr_1 TK_DIV iexpr_2
    { let (t,r) = $2 in Apron.Texpr1.Binop(Apron.Texpr1.Div,$1,$3,t,r) }
| iexpr_1 TK_MODULO iexpr_2
    { let (t,r) = $2 in Apron.Texpr1.Binop(Apron.Texpr1.Mod,$1,$3,t,r) }
| iexpr_2
    { $1 }
iexpr_2:
  TK_SUB iexpr_2
    { let (t,r) = $1 in Apron.Texpr1.Unop(Apron.Texpr1.Neg,$2,t,r) }
| iexpr_3
    { $1 }
iexpr_3:
  TK_CAST iexpr_3
    { let (t,r) = $1 in Apron.Texpr1.Unop(Apron.Texpr1.Cast,$2,t,r) }
| TK_SQRT iexpr_3
    { let (t,r) = $1 in Apron.Texpr1.Unop(Apron.Texpr1.Sqrt,$2,t,r) }
| TK_LPAR iexpr TK_RPAR
    { $2 }
| coeff
   { Apron.Texpr1.Cst($1) }
| TK_ID
    { Apron.Texpr1.Var(Apron.Var.of_string $1) }

coeff: scalar { Apron.Coeff.Scalar $1 }
scalar:
  TK_MPQF { Apron.Scalar.Mpqf($1) }
| TK_FLOAT { Apron.Scalar.Float($1) }

instruction:
  TK_SKIP 
      { SKIP }
| TK_HALT
      { HALT }
| TK_FAIL
      { FAIL }
| TK_ASSUME bexpr
      { ASSUME($2) }
| variable TK_AF iexpr_random
      { ASSIGN($1,$3) }
| TK_LPAR variables TK_RPAR TK_AF TK_ID TK_LPAR variables TK_RPAR 
      { CALL ($2,$5,$7) }
| variable TK_AF TK_ID TK_LPAR variables TK_RPAR
      { CALL ([$1],$3,$5) }
| TK_IF bexpr TK_THEN instr_seq TK_ENDIF
      { IF ($2, { bpoint=$3; instrs = $4 }) }
| TK_IF bexpr TK_THEN instr_seq TK_ELSE instr_seq TK_ENDIF
      { IFELSE($2,
               { bpoint=$3; instrs = $4}, 
               { bpoint=$5; instrs = $6})
      }
| TK_WHILE bexpr TK_DO instr_seq TK_DONE
      { LOOP ($2, { bpoint=$3; instrs = $4}) }

instr: instruction TK_SEMICOLON
  { { instruction = $1; ipoint = $2 } }

instr_seq: revinstr_seq { List.rev $1 }
revinstr_seq:
  revinstr_seq instr
    { $2::$1 }
| instr
    { [$1] }

variables: revvariables { List.rev $1 }
revvariables:
  revvariables TK_COMMA variable { $3::$1 }
| variable { [$1] }
| { [] }

variable : TK_ID { Apron.Var.of_string $1 }

procedure:
  TK_PROC TK_ID TK_LPAR declarations TK_RPAR TK_RETURNS TK_LPAR declarations TK_RPAR vardeclarations TK_BEGIN instr_seq TK_END
    {
      {
	pname = $2;
	pinput = $4;
	poutput = $8;
	plocal = $10;
	pcode = { bpoint = $11; instrs = $12 }
      }
    }

revprocedures:
  revprocedures procedure { $2::$1 }
| { [] }


primitiveType:
    TK_INT { INT }
  | TK_REAL { REAL }

declaration:
  variable TK_COLON primitiveType { ($1,$3) }

vardeclarations:
  TK_VAR declarations TK_SEMICOLON
    { $2 }
| { [] }

declarations: revdeclarations { List.rev $1 }
revdeclarations:
  revdeclarations TK_COMMA declaration { $3::$1 }
| declaration { [$1] }
| { [] }

program: revprocedures vardeclarations TK_BEGIN instr_seq TK_END
  {
    let lproc = $1 in
    let mainproc = {
      pname = "";
      pinput = [];
      poutput = [];
      plocal = $2;
      pcode = { bpoint = $3; instrs = $4 }
    }
    in
    {
      procedures = List.rev (mainproc::lproc);
    }
  }

type token =
  | TK_LPAR
  | TK_RPAR
  | TK_BRANDOM
  | TK_RANDOM
  | TK_ASSUME
  | TK_HALT
  | TK_FAIL
  | TK_VAR
  | TK_DONE
  | TK_END
  | TK_ENDIF
  | TK_SKIP
  | TK_PROC
  | TK_WHILE
  | TK_IF
  | TK_MUL of ((Apron.Texpr1.typ * Apron.Texpr1.round))
  | TK_ADD of ((Apron.Texpr1.typ * Apron.Texpr1.round))
  | TK_SUB of ((Apron.Texpr1.typ * Apron.Texpr1.round))
  | TK_DIV of ((Apron.Texpr1.typ * Apron.Texpr1.round))
  | TK_MODULO of ((Apron.Texpr1.typ * Apron.Texpr1.round))
  | TK_CAST of ((Apron.Texpr1.typ * Apron.Texpr1.round))
  | TK_SQRT of ((Apron.Texpr1.typ * Apron.Texpr1.round))
  | TK_MPQF of (Mpqf.t)
  | TK_FLOAT of (float)
  | TK_PLUS
  | TK_MINUS
  | TK_TIMES
  | TK_LEQ
  | TK_GEQ
  | TK_LT
  | TK_GT
  | TK_EQ
  | TK_NEQ
  | TK_AF
  | TK_AND
  | TK_OR
  | TK_NOT
  | TK_COMMA
  | TK_RETURNS
  | TK_COLON
  | TK_INT
  | TK_REAL
  | TK_ID of (string)
  | TK_DO of (Spl_syn.point)
  | TK_THEN of (Spl_syn.point)
  | TK_ELSE of (Spl_syn.point)
  | TK_BEGIN of (Spl_syn.point)
  | TK_SEMICOLON of (Spl_syn.point)
  | TK_TRUE
  | TK_FALSE
  | TK_EOF

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Spl_syn.program

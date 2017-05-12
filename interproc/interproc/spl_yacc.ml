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

open Parsing;;
let _ = parse_error;;
# 8 "spl_yacc.mly"
open Spl_syn
# 59 "spl_yacc.ml"
let yytransl_const = [|
  257 (* TK_LPAR *);
  258 (* TK_RPAR *);
  259 (* TK_BRANDOM *);
  260 (* TK_RANDOM *);
  261 (* TK_ASSUME *);
  262 (* TK_HALT *);
  263 (* TK_FAIL *);
  264 (* TK_VAR *);
  265 (* TK_DONE *);
  266 (* TK_END *);
  267 (* TK_ENDIF *);
  268 (* TK_SKIP *);
  269 (* TK_PROC *);
  270 (* TK_WHILE *);
  271 (* TK_IF *);
  281 (* TK_PLUS *);
  282 (* TK_MINUS *);
  283 (* TK_TIMES *);
  284 (* TK_LEQ *);
  285 (* TK_GEQ *);
  286 (* TK_LT *);
  287 (* TK_GT *);
  288 (* TK_EQ *);
  289 (* TK_NEQ *);
  290 (* TK_AF *);
  291 (* TK_AND *);
  292 (* TK_OR *);
  293 (* TK_NOT *);
  294 (* TK_COMMA *);
  295 (* TK_RETURNS *);
  296 (* TK_COLON *);
  297 (* TK_INT *);
  298 (* TK_REAL *);
  305 (* TK_TRUE *);
  306 (* TK_FALSE *);
  307 (* TK_EOF *);
    0|]

let yytransl_block = [|
  272 (* TK_MUL *);
  273 (* TK_ADD *);
  274 (* TK_SUB *);
  275 (* TK_DIV *);
  276 (* TK_MODULO *);
  277 (* TK_CAST *);
  278 (* TK_SQRT *);
  279 (* TK_MPQF *);
  280 (* TK_FLOAT *);
  299 (* TK_ID *);
  300 (* TK_DO *);
  301 (* TK_THEN *);
  302 (* TK_ELSE *);
  303 (* TK_BEGIN *);
  304 (* TK_SEMICOLON *);
    0|]

let yylhs = "\255\255\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\004\000\004\000\004\000\004\000\004\000\004\000\005\000\005\000\
\003\000\003\000\003\000\006\000\006\000\006\000\006\000\007\000\
\007\000\008\000\008\000\008\000\008\000\008\000\009\000\010\000\
\010\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
\011\000\011\000\011\000\015\000\014\000\016\000\016\000\013\000\
\017\000\017\000\017\000\012\000\018\000\021\000\021\000\022\000\
\022\000\023\000\020\000\020\000\019\000\024\000\024\000\024\000\
\001\000\000\000"

let yylen = "\002\000\
\003\000\003\000\003\000\002\000\001\000\001\000\001\000\001\000\
\003\000\003\000\003\000\003\000\003\000\003\000\001\000\001\000\
\003\000\003\000\001\000\003\000\003\000\003\000\001\000\002\000\
\001\000\002\000\002\000\003\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\002\000\003\000\008\000\006\000\
\005\000\007\000\005\000\002\000\001\000\002\000\001\000\001\000\
\003\000\001\000\000\000\001\000\013\000\002\000\000\000\001\000\
\001\000\003\000\003\000\000\000\001\000\003\000\001\000\000\000\
\005\000\002\000"

let yydefred = "\000\000\
\055\000\000\000\066\000\000\000\000\000\000\000\054\000\000\000\
\052\000\000\000\000\000\063\000\000\000\000\000\000\000\000\000\
\059\000\000\000\000\000\000\000\000\000\035\000\036\000\034\000\
\000\000\000\000\000\000\000\000\000\000\047\000\000\000\056\000\
\057\000\058\000\062\000\000\000\050\000\000\000\000\000\000\000\
\008\000\000\000\000\000\000\000\032\000\033\000\000\000\030\000\
\006\000\007\000\000\000\000\000\005\000\000\000\023\000\025\000\
\029\000\031\000\000\000\000\000\044\000\000\000\065\000\046\000\
\000\000\000\000\000\000\000\000\000\000\000\000\024\000\026\000\
\027\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\016\000\000\000\000\000\038\000\000\000\000\000\049\000\
\001\000\028\000\000\000\002\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\020\000\021\000\022\000\
\000\000\000\000\000\000\000\000\000\000\043\000\041\000\000\000\
\000\000\000\000\000\000\000\000\040\000\000\000\000\000\042\000\
\000\000\039\000\000\000\000\000\053\000"

let yydgoto = "\002\000\
\003\000\051\000\052\000\053\000\093\000\054\000\055\000\056\000\
\057\000\058\000\027\000\028\000\038\000\029\000\030\000\031\000\
\039\000\007\000\011\000\008\000\004\000\034\000\012\000\013\000"

let yysindex = "\010\000\
\000\000\000\000\000\000\255\254\229\254\231\254\000\000\245\254\
\000\000\019\255\029\255\000\000\047\255\087\255\173\255\089\255\
\000\000\229\254\229\254\229\254\005\255\000\000\000\000\000\000\
\005\255\005\255\052\255\068\255\098\255\000\000\173\255\000\000\
\000\000\000\000\000\000\110\255\000\000\144\255\118\255\005\255\
\000\000\180\255\189\255\189\255\000\000\000\000\005\255\000\000\
\000\000\000\000\104\255\213\255\000\000\231\255\000\000\000\000\
\000\000\000\000\085\255\004\255\000\000\171\255\000\000\000\000\
\109\255\124\255\229\254\008\255\207\255\180\255\000\000\000\000\
\000\000\000\000\005\255\005\255\180\255\180\255\180\255\180\255\
\180\255\180\255\180\255\180\255\180\255\180\255\180\255\173\255\
\173\255\000\000\163\255\159\255\000\000\190\255\153\255\000\000\
\000\000\000\000\182\255\000\000\172\255\231\255\231\255\159\255\
\159\255\159\255\159\255\159\255\159\255\000\000\000\000\000\000\
\199\255\014\255\229\254\229\254\221\255\000\000\000\000\173\255\
\224\255\225\255\229\254\204\255\000\000\220\255\227\255\000\000\
\186\255\000\000\173\255\242\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\187\255\038\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\003\255\000\000\000\000\000\000\
\000\000\000\000\007\255\020\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\127\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\246\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\205\255\000\000\000\000\002\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\201\255\206\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\059\255\039\255\061\255\078\255\
\080\255\097\255\099\255\115\255\117\255\000\000\000\000\000\000\
\000\000\000\000\020\255\007\255\000\000\000\000\000\000\000\000\
\000\000\000\000\020\255\000\000\000\000\187\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\233\255\087\000\000\000\000\000\105\000\235\255\162\000\
\000\000\000\000\000\000\251\255\214\255\066\000\224\000\000\000\
\000\000\000\000\238\255\130\000\000\000\000\000\239\000\000\000"

let yytablesize = 257
let yytable = "\010\000\
\036\000\059\000\060\000\019\000\061\000\040\000\005\000\041\000\
\064\000\097\000\001\000\006\000\010\000\010\000\037\000\009\000\
\068\000\014\000\019\000\019\000\071\000\051\000\042\000\074\000\
\119\000\043\000\044\000\045\000\046\000\019\000\019\000\019\000\
\019\000\019\000\019\000\015\000\019\000\019\000\075\000\076\000\
\017\000\047\000\075\000\076\000\064\000\019\000\019\000\048\000\
\089\000\019\000\061\000\100\000\101\000\049\000\050\000\017\000\
\017\000\051\000\016\000\120\000\003\000\096\000\018\000\110\000\
\111\000\112\000\017\000\017\000\017\000\017\000\017\000\017\000\
\121\000\017\000\017\000\064\000\017\000\018\000\018\000\013\000\
\127\000\012\000\017\000\017\000\018\000\064\000\017\000\019\000\
\018\000\018\000\018\000\018\000\018\000\018\000\003\000\018\000\
\018\000\122\000\014\000\061\000\011\000\062\000\003\000\003\000\
\018\000\018\000\003\000\063\000\018\000\037\000\010\000\065\000\
\013\000\013\000\012\000\012\000\009\000\037\000\010\000\075\000\
\076\000\013\000\013\000\012\000\012\000\013\000\069\000\012\000\
\088\000\032\000\033\000\014\000\014\000\011\000\011\000\045\000\
\045\000\045\000\075\000\076\000\014\000\014\000\011\000\011\000\
\014\000\066\000\011\000\094\000\092\000\009\000\009\000\010\000\
\010\000\113\000\114\000\067\000\099\000\095\000\009\000\009\000\
\010\000\010\000\009\000\115\000\010\000\104\000\105\000\106\000\
\107\000\108\000\109\000\070\000\045\000\020\000\090\000\077\000\
\078\000\021\000\022\000\023\000\070\000\102\000\103\000\098\000\
\024\000\124\000\025\000\026\000\042\000\070\000\116\000\043\000\
\044\000\045\000\046\000\117\000\132\000\042\000\077\000\078\000\
\043\000\044\000\045\000\046\000\072\000\073\000\075\000\118\000\
\098\000\043\000\044\000\045\000\046\000\091\000\128\000\009\000\
\030\000\030\000\030\000\030\000\030\000\123\000\048\000\077\000\
\078\000\125\000\126\000\005\000\130\000\077\000\078\000\048\000\
\131\000\060\000\079\000\080\000\081\000\082\000\083\000\084\000\
\079\000\080\000\081\000\082\000\083\000\084\000\085\000\048\000\
\030\000\086\000\087\000\133\000\037\000\015\000\064\000\129\000\
\035\000"

let yycheck = "\005\000\
\019\000\025\000\026\000\002\001\002\001\001\001\008\001\003\001\
\002\001\002\001\001\000\013\001\018\000\019\000\020\000\043\001\
\040\000\043\001\017\001\018\001\042\000\002\001\018\001\047\000\
\011\001\021\001\022\001\023\001\024\001\028\001\029\001\030\001\
\031\001\032\001\033\001\047\001\035\001\036\001\035\001\036\001\
\002\001\037\001\035\001\036\001\038\001\044\001\045\001\043\001\
\045\001\048\001\048\001\075\000\076\000\049\001\050\001\017\001\
\018\001\038\001\040\001\046\001\002\001\067\000\002\001\085\000\
\086\000\087\000\028\001\029\001\030\001\031\001\032\001\033\001\
\115\000\035\001\036\001\038\001\048\001\017\001\018\001\002\001\
\123\000\002\001\044\001\045\001\038\001\048\001\048\001\001\001\
\028\001\029\001\030\001\031\001\032\001\033\001\036\001\035\001\
\036\001\116\000\002\001\048\001\002\001\034\001\044\001\045\001\
\044\001\045\001\048\001\010\001\048\001\115\000\116\000\002\001\
\035\001\036\001\035\001\036\001\002\001\123\000\002\001\035\001\
\036\001\044\001\045\001\044\001\045\001\048\001\040\000\048\001\
\044\001\041\001\042\001\035\001\036\001\035\001\036\001\009\001\
\010\001\011\001\035\001\036\001\044\001\045\001\044\001\045\001\
\048\001\002\001\048\001\039\001\062\000\035\001\036\001\035\001\
\036\001\088\000\089\000\038\001\070\000\034\001\044\001\045\001\
\044\001\045\001\048\001\001\001\048\001\079\000\080\000\081\000\
\082\000\083\000\084\000\001\001\046\001\001\001\004\001\017\001\
\018\001\005\001\006\001\007\001\001\001\077\000\078\000\002\001\
\012\001\120\000\014\001\015\001\018\001\001\001\001\001\021\001\
\022\001\023\001\024\001\043\001\131\000\018\001\017\001\018\001\
\021\001\022\001\023\001\024\001\043\000\044\000\035\001\009\001\
\002\001\021\001\022\001\023\001\024\001\043\001\011\001\043\001\
\016\001\017\001\018\001\019\001\020\001\001\001\043\001\017\001\
\018\001\002\001\002\001\008\001\002\001\017\001\018\001\043\001\
\047\001\047\001\028\001\029\001\030\001\031\001\032\001\033\001\
\028\001\029\001\030\001\031\001\032\001\033\001\016\001\002\001\
\048\001\019\001\020\001\010\001\048\001\048\001\031\000\126\000\
\018\000"

let yynames_const = "\
  TK_LPAR\000\
  TK_RPAR\000\
  TK_BRANDOM\000\
  TK_RANDOM\000\
  TK_ASSUME\000\
  TK_HALT\000\
  TK_FAIL\000\
  TK_VAR\000\
  TK_DONE\000\
  TK_END\000\
  TK_ENDIF\000\
  TK_SKIP\000\
  TK_PROC\000\
  TK_WHILE\000\
  TK_IF\000\
  TK_PLUS\000\
  TK_MINUS\000\
  TK_TIMES\000\
  TK_LEQ\000\
  TK_GEQ\000\
  TK_LT\000\
  TK_GT\000\
  TK_EQ\000\
  TK_NEQ\000\
  TK_AF\000\
  TK_AND\000\
  TK_OR\000\
  TK_NOT\000\
  TK_COMMA\000\
  TK_RETURNS\000\
  TK_COLON\000\
  TK_INT\000\
  TK_REAL\000\
  TK_TRUE\000\
  TK_FALSE\000\
  TK_EOF\000\
  "

let yynames_block = "\
  TK_MUL\000\
  TK_ADD\000\
  TK_SUB\000\
  TK_DIV\000\
  TK_MODULO\000\
  TK_CAST\000\
  TK_SQRT\000\
  TK_MPQF\000\
  TK_FLOAT\000\
  TK_ID\000\
  TK_DO\000\
  TK_THEN\000\
  TK_ELSE\000\
  TK_BEGIN\000\
  TK_SEMICOLON\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Spl_syn.bexpr) in
    Obj.repr(
# 55 "spl_yacc.mly"
                                          ( _2 )
# 341 "spl_yacc.ml"
               : Spl_syn.bexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Spl_syn.bexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Spl_syn.bexpr) in
    Obj.repr(
# 56 "spl_yacc.mly"
                                         ( AND (_1,_3) )
# 349 "spl_yacc.ml"
               : Spl_syn.bexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Spl_syn.bexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Spl_syn.bexpr) in
    Obj.repr(
# 57 "spl_yacc.mly"
                                         ( OR  (_1,_3) )
# 357 "spl_yacc.ml"
               : Spl_syn.bexpr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Spl_syn.bexpr) in
    Obj.repr(
# 58 "spl_yacc.mly"
                                         ( NOT  _2 )
# 364 "spl_yacc.ml"
               : Spl_syn.bexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'icons) in
    Obj.repr(
# 59 "spl_yacc.mly"
                                         ( CONS _1 )
# 371 "spl_yacc.ml"
               : Spl_syn.bexpr))
; (fun __caml_parser_env ->
    Obj.repr(
# 60 "spl_yacc.mly"
                                         ( TRUE )
# 377 "spl_yacc.ml"
               : Spl_syn.bexpr))
; (fun __caml_parser_env ->
    Obj.repr(
# 61 "spl_yacc.mly"
                                         ( FALSE )
# 383 "spl_yacc.ml"
               : Spl_syn.bexpr))
; (fun __caml_parser_env ->
    Obj.repr(
# 62 "spl_yacc.mly"
                                           ( BRANDOM )
# 389 "spl_yacc.ml"
               : Spl_syn.bexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Spl_syn.iexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Spl_syn.iexpr) in
    Obj.repr(
# 65 "spl_yacc.mly"
                     ( (_1,EQ,_3) )
# 397 "spl_yacc.ml"
               : 'icons))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Spl_syn.iexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Spl_syn.iexpr) in
    Obj.repr(
# 66 "spl_yacc.mly"
                     ( (_1,NEQ,_3) )
# 405 "spl_yacc.ml"
               : 'icons))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Spl_syn.iexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Spl_syn.iexpr) in
    Obj.repr(
# 67 "spl_yacc.mly"
                      ( (_1,GT,_3) )
# 413 "spl_yacc.ml"
               : 'icons))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Spl_syn.iexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Spl_syn.iexpr) in
    Obj.repr(
# 68 "spl_yacc.mly"
                       ( (_1,GEQ,_3) )
# 421 "spl_yacc.ml"
               : 'icons))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Spl_syn.iexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Spl_syn.iexpr) in
    Obj.repr(
# 69 "spl_yacc.mly"
                       ( (_1,LEQ,_3) )
# 429 "spl_yacc.ml"
               : 'icons))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Spl_syn.iexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Spl_syn.iexpr) in
    Obj.repr(
# 70 "spl_yacc.mly"
                      ( (_1,LT,_3) )
# 437 "spl_yacc.ml"
               : 'icons))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Spl_syn.iexpr) in
    Obj.repr(
# 73 "spl_yacc.mly"
        ( _1 )
# 444 "spl_yacc.ml"
               : 'iexpr_random))
; (fun __caml_parser_env ->
    Obj.repr(
# 74 "spl_yacc.mly"
            ( Apron.Texpr1.Cst (Apron.Coeff.i_of_float neg_infinity infinity) )
# 450 "spl_yacc.ml"
               : 'iexpr_random))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Spl_syn.iexpr) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : (Apron.Texpr1.typ * Apron.Texpr1.round)) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'iexpr_1) in
    Obj.repr(
# 77 "spl_yacc.mly"
    ( let (t,r) = _2 in Apron.Texpr1.Binop(Apron.Texpr1.Add,_1,_3,t,r) )
# 459 "spl_yacc.ml"
               : Spl_syn.iexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Spl_syn.iexpr) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : (Apron.Texpr1.typ * Apron.Texpr1.round)) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'iexpr_1) in
    Obj.repr(
# 79 "spl_yacc.mly"
    ( let (t,r) = _2 in Apron.Texpr1.Binop(Apron.Texpr1.Sub,_1,_3,t,r) )
# 468 "spl_yacc.ml"
               : Spl_syn.iexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'iexpr_1) in
    Obj.repr(
# 81 "spl_yacc.mly"
    ( _1 )
# 475 "spl_yacc.ml"
               : Spl_syn.iexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'iexpr_1) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : (Apron.Texpr1.typ * Apron.Texpr1.round)) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'iexpr_2) in
    Obj.repr(
# 85 "spl_yacc.mly"
    ( let (t,r) = _2 in Apron.Texpr1.Binop(Apron.Texpr1.Mul,_1,_3,t,r) )
# 484 "spl_yacc.ml"
               : 'iexpr_1))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'iexpr_1) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : (Apron.Texpr1.typ * Apron.Texpr1.round)) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'iexpr_2) in
    Obj.repr(
# 87 "spl_yacc.mly"
    ( let (t,r) = _2 in Apron.Texpr1.Binop(Apron.Texpr1.Div,_1,_3,t,r) )
# 493 "spl_yacc.ml"
               : 'iexpr_1))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'iexpr_1) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : (Apron.Texpr1.typ * Apron.Texpr1.round)) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'iexpr_2) in
    Obj.repr(
# 89 "spl_yacc.mly"
    ( let (t,r) = _2 in Apron.Texpr1.Binop(Apron.Texpr1.Mod,_1,_3,t,r) )
# 502 "spl_yacc.ml"
               : 'iexpr_1))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'iexpr_2) in
    Obj.repr(
# 91 "spl_yacc.mly"
    ( _1 )
# 509 "spl_yacc.ml"
               : 'iexpr_1))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : (Apron.Texpr1.typ * Apron.Texpr1.round)) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'iexpr_2) in
    Obj.repr(
# 94 "spl_yacc.mly"
    ( let (t,r) = _1 in Apron.Texpr1.Unop(Apron.Texpr1.Neg,_2,t,r) )
# 517 "spl_yacc.ml"
               : 'iexpr_2))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'iexpr_3) in
    Obj.repr(
# 96 "spl_yacc.mly"
    ( _1 )
# 524 "spl_yacc.ml"
               : 'iexpr_2))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : (Apron.Texpr1.typ * Apron.Texpr1.round)) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'iexpr_3) in
    Obj.repr(
# 99 "spl_yacc.mly"
    ( let (t,r) = _1 in Apron.Texpr1.Unop(Apron.Texpr1.Cast,_2,t,r) )
# 532 "spl_yacc.ml"
               : 'iexpr_3))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : (Apron.Texpr1.typ * Apron.Texpr1.round)) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'iexpr_3) in
    Obj.repr(
# 101 "spl_yacc.mly"
    ( let (t,r) = _1 in Apron.Texpr1.Unop(Apron.Texpr1.Sqrt,_2,t,r) )
# 540 "spl_yacc.ml"
               : 'iexpr_3))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Spl_syn.iexpr) in
    Obj.repr(
# 103 "spl_yacc.mly"
    ( _2 )
# 547 "spl_yacc.ml"
               : 'iexpr_3))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'coeff) in
    Obj.repr(
# 105 "spl_yacc.mly"
   ( Apron.Texpr1.Cst(_1) )
# 554 "spl_yacc.ml"
               : 'iexpr_3))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 107 "spl_yacc.mly"
    ( Apron.Texpr1.Var(Apron.Var.of_string _1) )
# 561 "spl_yacc.ml"
               : 'iexpr_3))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'scalar) in
    Obj.repr(
# 109 "spl_yacc.mly"
              ( Apron.Coeff.Scalar _1 )
# 568 "spl_yacc.ml"
               : 'coeff))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Mpqf.t) in
    Obj.repr(
# 111 "spl_yacc.mly"
          ( Apron.Scalar.Mpqf(_1) )
# 575 "spl_yacc.ml"
               : 'scalar))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 112 "spl_yacc.mly"
           ( Apron.Scalar.Float(_1) )
# 582 "spl_yacc.ml"
               : 'scalar))
; (fun __caml_parser_env ->
    Obj.repr(
# 116 "spl_yacc.mly"
      ( SKIP )
# 588 "spl_yacc.ml"
               : 'instruction))
; (fun __caml_parser_env ->
    Obj.repr(
# 118 "spl_yacc.mly"
      ( HALT )
# 594 "spl_yacc.ml"
               : 'instruction))
; (fun __caml_parser_env ->
    Obj.repr(
# 120 "spl_yacc.mly"
      ( FAIL )
# 600 "spl_yacc.ml"
               : 'instruction))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Spl_syn.bexpr) in
    Obj.repr(
# 122 "spl_yacc.mly"
      ( ASSUME(_2) )
# 607 "spl_yacc.ml"
               : 'instruction))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'variable) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'iexpr_random) in
    Obj.repr(
# 124 "spl_yacc.mly"
      ( ASSIGN(_1,_3) )
# 615 "spl_yacc.ml"
               : 'instruction))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 6 : 'variables) in
    let _5 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 1 : 'variables) in
    Obj.repr(
# 126 "spl_yacc.mly"
      ( CALL (_2,_5,_7) )
# 624 "spl_yacc.ml"
               : 'instruction))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : 'variable) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'variables) in
    Obj.repr(
# 128 "spl_yacc.mly"
      ( CALL ([_1],_3,_5) )
# 633 "spl_yacc.ml"
               : 'instruction))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : Spl_syn.bexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : Spl_syn.point) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'instr_seq) in
    Obj.repr(
# 130 "spl_yacc.mly"
      ( IF (_2, { bpoint=_3; instrs = _4 }) )
# 642 "spl_yacc.ml"
               : 'instruction))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : Spl_syn.bexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 4 : Spl_syn.point) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'instr_seq) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : Spl_syn.point) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'instr_seq) in
    Obj.repr(
# 132 "spl_yacc.mly"
      ( IFELSE(_2,
               { bpoint=_3; instrs = _4}, 
               { bpoint=_5; instrs = _6})
      )
# 656 "spl_yacc.ml"
               : 'instruction))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : Spl_syn.bexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : Spl_syn.point) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'instr_seq) in
    Obj.repr(
# 137 "spl_yacc.mly"
      ( LOOP (_2, { bpoint=_3; instrs = _4}) )
# 665 "spl_yacc.ml"
               : 'instruction))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'instruction) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Spl_syn.point) in
    Obj.repr(
# 140 "spl_yacc.mly"
  ( { instruction = _1; ipoint = _2 } )
# 673 "spl_yacc.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'revinstr_seq) in
    Obj.repr(
# 142 "spl_yacc.mly"
                        ( List.rev _1 )
# 680 "spl_yacc.ml"
               : 'instr_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'revinstr_seq) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'instr) in
    Obj.repr(
# 145 "spl_yacc.mly"
    ( _2::_1 )
# 688 "spl_yacc.ml"
               : 'revinstr_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'instr) in
    Obj.repr(
# 147 "spl_yacc.mly"
    ( [_1] )
# 695 "spl_yacc.ml"
               : 'revinstr_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'revvariables) in
    Obj.repr(
# 149 "spl_yacc.mly"
                        ( List.rev _1 )
# 702 "spl_yacc.ml"
               : 'variables))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'revvariables) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'variable) in
    Obj.repr(
# 151 "spl_yacc.mly"
                                 ( _3::_1 )
# 710 "spl_yacc.ml"
               : 'revvariables))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'variable) in
    Obj.repr(
# 152 "spl_yacc.mly"
           ( [_1] )
# 717 "spl_yacc.ml"
               : 'revvariables))
; (fun __caml_parser_env ->
    Obj.repr(
# 153 "spl_yacc.mly"
  ( [] )
# 723 "spl_yacc.ml"
               : 'revvariables))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 155 "spl_yacc.mly"
                 ( Apron.Var.of_string _1 )
# 730 "spl_yacc.ml"
               : 'variable))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 11 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 9 : 'declarations) in
    let _8 = (Parsing.peek_val __caml_parser_env 5 : 'declarations) in
    let _10 = (Parsing.peek_val __caml_parser_env 3 : 'vardeclarations) in
    let _11 = (Parsing.peek_val __caml_parser_env 2 : Spl_syn.point) in
    let _12 = (Parsing.peek_val __caml_parser_env 1 : 'instr_seq) in
    Obj.repr(
# 159 "spl_yacc.mly"
    (
      {
	pname = _2;
	pinput = _4;
	poutput = _8;
	plocal = _10;
	pcode = { bpoint = _11; instrs = _12 }
      }
    )
# 750 "spl_yacc.ml"
               : 'procedure))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'revprocedures) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'procedure) in
    Obj.repr(
# 170 "spl_yacc.mly"
                          ( _2::_1 )
# 758 "spl_yacc.ml"
               : 'revprocedures))
; (fun __caml_parser_env ->
    Obj.repr(
# 171 "spl_yacc.mly"
  ( [] )
# 764 "spl_yacc.ml"
               : 'revprocedures))
; (fun __caml_parser_env ->
    Obj.repr(
# 175 "spl_yacc.mly"
           ( INT )
# 770 "spl_yacc.ml"
               : 'primitiveType))
; (fun __caml_parser_env ->
    Obj.repr(
# 176 "spl_yacc.mly"
            ( REAL )
# 776 "spl_yacc.ml"
               : 'primitiveType))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'variable) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'primitiveType) in
    Obj.repr(
# 179 "spl_yacc.mly"
                                  ( (_1,_3) )
# 784 "spl_yacc.ml"
               : 'declaration))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'declarations) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Spl_syn.point) in
    Obj.repr(
# 183 "spl_yacc.mly"
    ( _2 )
# 792 "spl_yacc.ml"
               : 'vardeclarations))
; (fun __caml_parser_env ->
    Obj.repr(
# 184 "spl_yacc.mly"
  ( [] )
# 798 "spl_yacc.ml"
               : 'vardeclarations))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'revdeclarations) in
    Obj.repr(
# 186 "spl_yacc.mly"
                              ( List.rev _1 )
# 805 "spl_yacc.ml"
               : 'declarations))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'revdeclarations) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'declaration) in
    Obj.repr(
# 188 "spl_yacc.mly"
                                       ( _3::_1 )
# 813 "spl_yacc.ml"
               : 'revdeclarations))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'declaration) in
    Obj.repr(
# 189 "spl_yacc.mly"
              ( [_1] )
# 820 "spl_yacc.ml"
               : 'revdeclarations))
; (fun __caml_parser_env ->
    Obj.repr(
# 190 "spl_yacc.mly"
  ( [] )
# 826 "spl_yacc.ml"
               : 'revdeclarations))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'revprocedures) in
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'vardeclarations) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : Spl_syn.point) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'instr_seq) in
    Obj.repr(
# 193 "spl_yacc.mly"
  (
    let lproc = _1 in
    let mainproc = {
      pname = "";
      pinput = [];
      poutput = [];
      plocal = _2;
      pcode = { bpoint = _3; instrs = _4 }
    }
    in
    {
      procedures = List.rev (mainproc::lproc);
    }
  )
# 849 "spl_yacc.ml"
               : Spl_syn.program))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Spl_syn.program)

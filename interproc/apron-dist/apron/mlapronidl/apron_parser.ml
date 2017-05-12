type token =
  | TK_EOF
  | TK_VERTEX
  | TK_RAY
  | TK_LINE
  | TK_RAYMOD
  | TK_LINEMOD
  | TK_SUPEG
  | TK_INFEG
  | TK_SUP
  | TK_INF
  | TK_EG
  | TK_DISEG
  | TK_MOD
  | TK_POW of ((Texpr1.typ * Texpr1.round))
  | TK_LBRACKET
  | TK_RBRACKET
  | TK_SEMICOLON
  | TK_LPAR
  | TK_RPAR
  | TK_MUL of ((Texpr1.typ * Texpr1.round))
  | TK_ADD of ((Texpr1.typ * Texpr1.round))
  | TK_SUB of ((Texpr1.typ * Texpr1.round))
  | TK_DIV of ((Texpr1.typ * Texpr1.round))
  | TK_MODULO of ((Texpr1.typ * Texpr1.round))
  | TK_CAST of ((Texpr1.typ * Texpr1.round))
  | TK_SQRT of ((Texpr1.typ * Texpr1.round))
  | TK_MPQF of (Mpqf.t)
  | TK_FLOAT of (float)
  | TK_VAR of (string)

open Parsing;;
let _ = parse_error;;
# 6 "apron_parser.mly"
(* This file is part of the APRON Library, released under LGPL license
   with an exception allowing the redistribution of statically linked
   executables.

  Please read the COPYING file packaged in the distribution  *)

let rec neg acc = function
  | [] -> acc
  | (var,coeff)::l ->
      let nacc = 
      if Coeff.is_zero coeff then
	acc
      else
	(var,(Coeff.neg coeff))::acc
      in
      neg nacc l

# 53 "apron_parser.ml"
let yytransl_const = [|
  257 (* TK_EOF *);
  258 (* TK_VERTEX *);
  259 (* TK_RAY *);
  260 (* TK_LINE *);
  261 (* TK_RAYMOD *);
  262 (* TK_LINEMOD *);
  263 (* TK_SUPEG *);
  264 (* TK_INFEG *);
  265 (* TK_SUP *);
  266 (* TK_INF *);
  267 (* TK_EG *);
  268 (* TK_DISEG *);
  269 (* TK_MOD *);
  271 (* TK_LBRACKET *);
  272 (* TK_RBRACKET *);
  273 (* TK_SEMICOLON *);
  274 (* TK_LPAR *);
  275 (* TK_RPAR *);
    0|]

let yytransl_block = [|
  270 (* TK_POW *);
  276 (* TK_MUL *);
  277 (* TK_ADD *);
  278 (* TK_SUB *);
  279 (* TK_DIV *);
  280 (* TK_MODULO *);
  281 (* TK_CAST *);
  282 (* TK_SQRT *);
  283 (* TK_MPQF *);
  284 (* TK_FLOAT *);
  285 (* TK_VAR *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\002\000\
\002\000\002\000\002\000\002\000\003\000\006\000\006\000\006\000\
\008\000\008\000\008\000\008\000\008\000\004\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\005\000\012\000\012\000\
\012\000\013\000\013\000\013\000\013\000\014\000\014\000\015\000\
\015\000\016\000\016\000\016\000\016\000\016\000\010\000\007\000\
\007\000\018\000\018\000\017\000\017\000\009\000\009\000\000\000\
\000\000\000\000\000\000\000\000"

let yylen = "\002\000\
\004\000\006\000\004\000\004\000\004\000\004\000\004\000\003\000\
\003\000\003\000\003\000\003\000\002\000\003\000\003\000\001\000\
\002\000\003\000\001\000\001\000\002\000\002\000\003\000\005\000\
\003\000\003\000\003\000\003\000\003\000\002\000\003\000\003\000\
\001\000\003\000\003\000\003\000\001\000\003\000\001\000\002\000\
\001\000\002\000\002\000\003\000\001\000\001\000\001\000\001\000\
\001\000\001\000\002\000\001\000\005\000\001\000\002\000\002\000\
\002\000\002\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\048\000\049\000\047\000\056\000\000\000\052\000\016\000\000\000\
\020\000\054\000\000\000\000\000\000\000\000\000\000\000\057\000\
\058\000\000\000\000\000\000\000\000\000\000\000\059\000\046\000\
\000\000\000\000\000\000\037\000\000\000\041\000\045\000\060\000\
\000\000\000\000\050\000\000\000\021\000\055\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\017\000\
\000\000\000\000\000\000\000\000\000\000\013\000\000\000\040\000\
\042\000\043\000\022\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\030\000\
\051\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\014\000\015\000\018\000\008\000\009\000\010\000\011\000\012\000\
\044\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\034\000\035\000\036\000\038\000\000\000\005\000\006\000\
\004\000\007\000\001\000\000\000\003\000\000\000\053\000\000\000\
\024\000\002\000"

let yydgoto = "\006\000\
\012\000\024\000\025\000\031\000\040\000\013\000\014\000\015\000\
\016\000\032\000\033\000\034\000\035\000\036\000\037\000\038\000\
\039\000\044\000"

let yysindex = "\249\000\
\233\255\006\000\233\255\218\255\218\255\000\000\195\255\018\255\
\000\000\000\000\000\000\000\000\204\255\000\000\000\000\239\254\
\000\000\000\000\233\255\233\255\233\255\233\255\233\255\000\000\
\000\000\010\255\218\255\218\255\245\254\245\254\000\000\000\000\
\001\255\220\255\214\255\000\000\247\254\000\000\000\000\000\000\
\062\255\238\254\000\000\005\255\000\000\000\000\233\255\233\255\
\233\255\233\255\233\255\233\255\233\255\233\255\000\255\000\000\
\073\255\084\255\086\255\092\255\111\255\000\000\057\255\000\000\
\000\000\000\000\000\000\218\255\218\255\218\255\218\255\218\255\
\218\255\218\255\218\255\218\255\218\255\218\255\218\255\000\000\
\000\000\195\255\134\255\146\255\182\255\188\255\060\255\198\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\254\254\254\254\254\254\254\254\236\255\254\254\214\255\
\214\255\000\000\000\000\000\000\000\000\033\255\000\000\000\000\
\000\000\000\000\000\000\238\254\000\000\238\254\000\000\061\255\
\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\185\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\029\255\000\000\129\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\070\255\085\255\109\255\114\255\130\255\133\255\153\255\
\169\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\077\000\249\255\246\255\
\000\000\005\000\000\000\252\255\070\000\025\000\115\000\128\000\
\069\000\208\255"

let yytablesize = 268
let yytable = "\043\000\
\041\000\067\000\055\000\007\000\079\000\017\000\027\000\017\000\
\009\000\010\000\062\000\011\000\045\000\029\000\030\000\009\000\
\010\000\011\000\074\000\075\000\056\000\082\000\063\000\017\000\
\017\000\017\000\017\000\017\000\011\000\033\000\053\000\054\000\
\007\000\110\000\081\000\033\000\033\000\033\000\033\000\033\000\
\033\000\033\000\089\000\090\000\009\000\010\000\011\000\033\000\
\119\000\033\000\033\000\017\000\017\000\017\000\017\000\017\000\
\017\000\017\000\017\000\091\000\115\000\122\000\080\000\098\000\
\099\000\100\000\101\000\102\000\103\000\018\000\027\000\018\000\
\116\000\092\000\043\000\097\000\046\000\074\000\075\000\026\000\
\053\000\054\000\074\000\075\000\093\000\028\000\094\000\018\000\
\018\000\018\000\018\000\018\000\095\000\053\000\054\000\057\000\
\058\000\059\000\060\000\061\000\106\000\107\000\108\000\109\000\
\053\000\054\000\053\000\054\000\120\000\026\000\121\000\096\000\
\053\000\054\000\029\000\018\000\018\000\018\000\018\000\018\000\
\018\000\018\000\018\000\083\000\084\000\085\000\086\000\087\000\
\088\000\039\000\023\000\053\000\054\000\025\000\111\000\039\000\
\039\000\039\000\039\000\039\000\039\000\039\000\064\000\104\000\
\105\000\000\000\112\000\039\000\039\000\039\000\039\000\039\000\
\039\000\031\000\053\000\054\000\065\000\066\000\000\000\031\000\
\031\000\031\000\031\000\031\000\031\000\031\000\053\000\054\000\
\000\000\032\000\000\000\031\000\000\000\031\000\031\000\032\000\
\032\000\032\000\032\000\032\000\032\000\032\000\113\000\000\000\
\000\000\019\000\000\000\032\000\114\000\032\000\032\000\019\000\
\019\000\019\000\019\000\019\000\019\000\019\000\117\000\000\000\
\000\000\000\000\053\000\054\000\000\000\019\000\019\000\000\000\
\053\000\054\000\047\000\048\000\049\000\050\000\051\000\052\000\
\042\000\000\000\053\000\054\000\000\000\009\000\010\000\000\000\
\053\000\054\000\068\000\069\000\070\000\071\000\072\000\073\000\
\007\000\076\000\000\000\027\000\077\000\078\000\000\000\028\000\
\074\000\075\000\029\000\030\000\009\000\010\000\011\000\007\000\
\118\000\001\000\002\000\003\000\004\000\005\000\008\000\000\000\
\074\000\075\000\000\000\009\000\010\000\011\000\000\000\019\000\
\020\000\021\000\022\000\023\000"

let yycheck = "\007\000\
\005\000\001\001\020\001\015\001\014\001\001\000\018\001\003\000\
\027\001\028\001\001\001\029\001\008\000\025\001\026\001\027\001\
\028\001\029\001\021\001\022\001\016\000\017\001\027\000\019\000\
\020\000\021\000\022\000\023\000\029\001\001\001\021\001\022\001\
\015\001\082\000\042\000\007\001\008\001\009\001\010\001\011\001\
\012\001\013\001\053\000\054\000\027\001\028\001\029\001\019\001\
\016\001\021\001\022\001\047\000\048\000\049\000\050\000\051\000\
\052\000\053\000\054\000\055\000\001\001\001\001\001\001\068\000\
\069\000\070\000\071\000\072\000\073\000\001\000\001\001\003\000\
\013\001\001\001\082\000\019\001\008\000\021\001\022\001\003\000\
\021\001\022\001\021\001\022\001\001\001\001\001\001\001\019\000\
\020\000\021\000\022\000\023\000\001\001\021\001\022\001\019\000\
\020\000\021\000\022\000\023\000\076\000\077\000\078\000\079\000\
\021\001\022\001\021\001\022\001\116\000\001\001\118\000\001\001\
\021\001\022\001\001\001\047\000\048\000\049\000\050\000\051\000\
\052\000\053\000\054\000\047\000\048\000\049\000\050\000\051\000\
\052\000\001\001\001\001\021\001\022\001\001\001\001\001\007\001\
\008\001\009\001\010\001\011\001\012\001\013\001\028\000\074\000\
\075\000\255\255\001\001\019\001\020\001\021\001\022\001\023\001\
\024\001\001\001\021\001\022\001\029\000\030\000\255\255\007\001\
\008\001\009\001\010\001\011\001\012\001\013\001\021\001\022\001\
\255\255\001\001\255\255\019\001\255\255\021\001\022\001\007\001\
\008\001\009\001\010\001\011\001\012\001\013\001\001\001\255\255\
\255\255\001\001\255\255\019\001\001\001\021\001\022\001\007\001\
\008\001\009\001\010\001\011\001\012\001\013\001\001\001\255\255\
\255\255\255\255\021\001\022\001\255\255\021\001\022\001\255\255\
\021\001\022\001\007\001\008\001\009\001\010\001\011\001\012\001\
\022\001\255\255\021\001\022\001\255\255\027\001\028\001\255\255\
\021\001\022\001\007\001\008\001\009\001\010\001\011\001\012\001\
\015\001\020\001\255\255\018\001\023\001\024\001\255\255\022\001\
\021\001\022\001\025\001\026\001\027\001\028\001\029\001\015\001\
\013\001\001\000\002\000\003\000\004\000\005\000\022\001\255\255\
\021\001\022\001\255\255\027\001\028\001\029\001\255\255\002\001\
\003\001\004\001\005\001\006\001"

let yynames_const = "\
  TK_EOF\000\
  TK_VERTEX\000\
  TK_RAY\000\
  TK_LINE\000\
  TK_RAYMOD\000\
  TK_LINEMOD\000\
  TK_SUPEG\000\
  TK_INFEG\000\
  TK_SUP\000\
  TK_INF\000\
  TK_EG\000\
  TK_DISEG\000\
  TK_MOD\000\
  TK_LBRACKET\000\
  TK_RBRACKET\000\
  TK_SEMICOLON\000\
  TK_LPAR\000\
  TK_RPAR\000\
  "

let yynames_block = "\
  TK_POW\000\
  TK_MUL\000\
  TK_ADD\000\
  TK_SUB\000\
  TK_DIV\000\
  TK_MODULO\000\
  TK_CAST\000\
  TK_SQRT\000\
  TK_MPQF\000\
  TK_FLOAT\000\
  TK_VAR\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'linexpr0) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'linexpr0) in
    Obj.repr(
# 63 "apron_parser.mly"
                                 ( (Lincons0.EQ, neg _1 _3) )
# 289 "apron_parser.ml"
               : Lincons0.typ * (string*Coeff.t) list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : 'linexpr0) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'linexpr0) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'scalar0) in
    Obj.repr(
# 64 "apron_parser.mly"
                                                ( (Lincons0.EQMOD(_5), neg _1 _3) )
# 298 "apron_parser.ml"
               : Lincons0.typ * (string*Coeff.t) list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'linexpr0) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'linexpr0) in
    Obj.repr(
# 65 "apron_parser.mly"
                                    ( failwith "!= not yet supported" )
# 306 "apron_parser.ml"
               : Lincons0.typ * (string*Coeff.t) list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'linexpr0) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'linexpr0) in
    Obj.repr(
# 66 "apron_parser.mly"
                                  ( (Lincons0.SUP, neg _1 _3) )
# 314 "apron_parser.ml"
               : Lincons0.typ * (string*Coeff.t) list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'linexpr0) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'linexpr0) in
    Obj.repr(
# 67 "apron_parser.mly"
                                    ( (Lincons0.SUPEQ, neg _1 _3) )
# 322 "apron_parser.ml"
               : Lincons0.typ * (string*Coeff.t) list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'linexpr0) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'linexpr0) in
    Obj.repr(
# 68 "apron_parser.mly"
                                    ( (Lincons0.SUPEQ, neg _3 _1) )
# 330 "apron_parser.ml"
               : Lincons0.typ * (string*Coeff.t) list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'linexpr0) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'linexpr0) in
    Obj.repr(
# 69 "apron_parser.mly"
                                  ( (Lincons0.SUP, neg _3 _1) )
# 338 "apron_parser.ml"
               : Lincons0.typ * (string*Coeff.t) list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'linexpr0) in
    Obj.repr(
# 72 "apron_parser.mly"
                            ( (Generator0.VERTEX,_2) )
# 345 "apron_parser.ml"
               : Generator0.typ * (string*Coeff.t) list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'linexpr0) in
    Obj.repr(
# 73 "apron_parser.mly"
                         ( (Generator0.RAY,_2) )
# 352 "apron_parser.ml"
               : Generator0.typ * (string*Coeff.t) list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'linexpr0) in
    Obj.repr(
# 74 "apron_parser.mly"
                          ( (Generator0.LINE,_2) )
# 359 "apron_parser.ml"
               : Generator0.typ * (string*Coeff.t) list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'linexpr0) in
    Obj.repr(
# 75 "apron_parser.mly"
                            ( (Generator0.RAYMOD,_2) )
# 366 "apron_parser.ml"
               : Generator0.typ * (string*Coeff.t) list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'linexpr0) in
    Obj.repr(
# 76 "apron_parser.mly"
                             ( (Generator0.LINEMOD,_2) )
# 373 "apron_parser.ml"
               : Generator0.typ * (string*Coeff.t) list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'linexpr0) in
    Obj.repr(
# 79 "apron_parser.mly"
                  ( _1 )
# 380 "apron_parser.ml"
               : (string*Coeff.t) list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'linexpr0) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : (Texpr1.typ * Texpr1.round)) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 83 "apron_parser.mly"
    ( _3::_1 )
# 389 "apron_parser.ml"
               : 'linexpr0))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'linexpr0) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : (Texpr1.typ * Texpr1.round)) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 85 "apron_parser.mly"
( let (var,coeff) = _3 in (var,Coeff.neg coeff)::_1 )
# 398 "apron_parser.ml"
               : 'linexpr0))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 86 "apron_parser.mly"
       ( [_1] )
# 405 "apron_parser.ml"
               : 'linexpr0))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'coeff) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'id) in
    Obj.repr(
# 88 "apron_parser.mly"
           ( (_2,_1) )
# 413 "apron_parser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'coeff) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : (Texpr1.typ * Texpr1.round)) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'id) in
    Obj.repr(
# 89 "apron_parser.mly"
                  ( (_3,_1) )
# 422 "apron_parser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'coeff) in
    Obj.repr(
# 90 "apron_parser.mly"
        ( ("",_1) )
# 429 "apron_parser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'id) in
    Obj.repr(
# 91 "apron_parser.mly"
     ( (_1, Coeff.s_of_int 1) )
# 436 "apron_parser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : (Texpr1.typ * Texpr1.round)) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'id) in
    Obj.repr(
# 92 "apron_parser.mly"
            ( (_2, Coeff.s_of_int (-1)) )
# 444 "apron_parser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'tcons0) in
    Obj.repr(
# 95 "apron_parser.mly"
                ( _1 )
# 451 "apron_parser.ml"
               : Tcons0.typ * Texpr1.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'texpr0) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'texpr0) in
    Obj.repr(
# 98 "apron_parser.mly"
                      ( (Tcons0.EQ, (Texpr1.Binop (Texpr1.Sub,_1,_3,Texpr1.Real,Texpr1.Rnd))) )
# 459 "apron_parser.ml"
               : 'tcons0))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'texpr0) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'texpr0) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'scalar0) in
    Obj.repr(
# 99 "apron_parser.mly"
                                     ( (Tcons0.EQMOD(_5), (Texpr1.Binop (Texpr1.Sub,_1,_3,Texpr1.Real,Texpr1.Rnd))) )
# 468 "apron_parser.ml"
               : 'tcons0))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'texpr0) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'texpr0) in
    Obj.repr(
# 100 "apron_parser.mly"
                         ( failwith "!= not yet supported" )
# 476 "apron_parser.ml"
               : 'tcons0))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'texpr0) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'texpr0) in
    Obj.repr(
# 101 "apron_parser.mly"
                       ( (Tcons0.SUP, (Texpr1.Binop (Texpr1.Sub,_1,_3,Texpr1.Real,Texpr1.Rnd))) )
# 484 "apron_parser.ml"
               : 'tcons0))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'texpr0) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'texpr0) in
    Obj.repr(
# 102 "apron_parser.mly"
                         ( (Tcons0.SUPEQ, (Texpr1.Binop (Texpr1.Sub,_1,_3,Texpr1.Real,Texpr1.Rnd))) )
# 492 "apron_parser.ml"
               : 'tcons0))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'texpr0) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'texpr0) in
    Obj.repr(
# 103 "apron_parser.mly"
                         ( (Tcons0.SUPEQ, (Texpr1.Binop (Texpr1.Sub,_3,_1,Texpr1.Real,Texpr1.Rnd))) )
# 500 "apron_parser.ml"
               : 'tcons0))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'texpr0) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'texpr0) in
    Obj.repr(
# 104 "apron_parser.mly"
                       ( (Tcons0.SUP, (Texpr1.Binop (Texpr1.Sub,_3,_1,Texpr1.Real,Texpr1.Rnd))) )
# 508 "apron_parser.ml"
               : 'tcons0))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'texpr0) in
    Obj.repr(
# 107 "apron_parser.mly"
                ( _1 )
# 515 "apron_parser.ml"
               : Texpr1.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'texpr0) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : (Texpr1.typ * Texpr1.round)) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'texpr0_1) in
    Obj.repr(
# 111 "apron_parser.mly"
    ( let (t,r) = _2 in Texpr1.Binop(Texpr1.Add,_1,_3,t,r) )
# 524 "apron_parser.ml"
               : 'texpr0))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'texpr0) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : (Texpr1.typ * Texpr1.round)) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'texpr0_1) in
    Obj.repr(
# 113 "apron_parser.mly"
    ( let (t,r) = _2 in Texpr1.Binop(Texpr1.Sub,_1,_3,t,r) )
# 533 "apron_parser.ml"
               : 'texpr0))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'texpr0_1) in
    Obj.repr(
# 115 "apron_parser.mly"
    ( _1 )
# 540 "apron_parser.ml"
               : 'texpr0))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'texpr0_1) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : (Texpr1.typ * Texpr1.round)) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'texpr0_2) in
    Obj.repr(
# 119 "apron_parser.mly"
    ( let (t,r) = _2 in Texpr1.Binop(Texpr1.Mul,_1,_3,t,r) )
# 549 "apron_parser.ml"
               : 'texpr0_1))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'texpr0_1) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : (Texpr1.typ * Texpr1.round)) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'texpr0_2) in
    Obj.repr(
# 121 "apron_parser.mly"
    ( let (t,r) = _2 in Texpr1.Binop(Texpr1.Div,_1,_3,t,r) )
# 558 "apron_parser.ml"
               : 'texpr0_1))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'texpr0_1) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : (Texpr1.typ * Texpr1.round)) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'texpr0_2) in
    Obj.repr(
# 123 "apron_parser.mly"
    ( let (t,r) = _2 in Texpr1.Binop(Texpr1.Mod,_1,_3,t,r) )
# 567 "apron_parser.ml"
               : 'texpr0_1))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'texpr0_2) in
    Obj.repr(
# 125 "apron_parser.mly"
    ( _1 )
# 574 "apron_parser.ml"
               : 'texpr0_1))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'texpr0_3) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : (Texpr1.typ * Texpr1.round)) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'texpr0_2) in
    Obj.repr(
# 128 "apron_parser.mly"
    ( let (t,r) = _2 in Texpr1.Binop(Texpr1.Pow,_1,_3,t,r) )
# 583 "apron_parser.ml"
               : 'texpr0_2))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'texpr0_3) in
    Obj.repr(
# 130 "apron_parser.mly"
    ( _1 )
# 590 "apron_parser.ml"
               : 'texpr0_2))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : (Texpr1.typ * Texpr1.round)) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'texpr0_3) in
    Obj.repr(
# 133 "apron_parser.mly"
    ( let (t,r) = _1 in Texpr1.Unop(Texpr1.Neg,_2,t,r) )
# 598 "apron_parser.ml"
               : 'texpr0_3))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'texpr0_4) in
    Obj.repr(
# 135 "apron_parser.mly"
    ( _1 )
# 605 "apron_parser.ml"
               : 'texpr0_3))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : (Texpr1.typ * Texpr1.round)) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'texpr0_4) in
    Obj.repr(
# 138 "apron_parser.mly"
    ( let (t,r) = _1 in Texpr1.Unop(Texpr1.Cast,_2,t,r) )
# 613 "apron_parser.ml"
               : 'texpr0_4))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : (Texpr1.typ * Texpr1.round)) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'texpr0_4) in
    Obj.repr(
# 140 "apron_parser.mly"
    ( let (t,r) = _1 in Texpr1.Unop(Texpr1.Sqrt,_2,t,r) )
# 621 "apron_parser.ml"
               : 'texpr0_4))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'texpr0) in
    Obj.repr(
# 142 "apron_parser.mly"
    ( _2 )
# 628 "apron_parser.ml"
               : 'texpr0_4))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'coeff0) in
    Obj.repr(
# 144 "apron_parser.mly"
    ( Texpr1.Cst(_1) )
# 635 "apron_parser.ml"
               : 'texpr0_4))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'id) in
    Obj.repr(
# 146 "apron_parser.mly"
    ( Texpr1.Var(Var.of_string _1) )
# 642 "apron_parser.ml"
               : 'texpr0_4))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 149 "apron_parser.mly"
         ( _1 )
# 649 "apron_parser.ml"
               : 'id))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Mpqf.t) in
    Obj.repr(
# 152 "apron_parser.mly"
          ( Scalar.Mpqf(_1) )
# 656 "apron_parser.ml"
               : 'scalar0))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 153 "apron_parser.mly"
           ( Scalar.Float(_1) )
# 663 "apron_parser.ml"
               : 'scalar0))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'scalar0) in
    Obj.repr(
# 155 "apron_parser.mly"
          ( _1 )
# 670 "apron_parser.ml"
               : 'scalar))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : (Texpr1.typ * Texpr1.round)) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'scalar0) in
    Obj.repr(
# 156 "apron_parser.mly"
                 ( Scalar.neg _2 )
# 678 "apron_parser.ml"
               : 'scalar))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'scalar0) in
    Obj.repr(
# 159 "apron_parser.mly"
    ( Coeff.Scalar _1 )
# 685 "apron_parser.ml"
               : 'coeff0))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'scalar) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'scalar) in
    Obj.repr(
# 161 "apron_parser.mly"
    ( Coeff.Interval(Interval.of_infsup _2 _4) )
# 693 "apron_parser.ml"
               : 'coeff0))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'coeff0) in
    Obj.repr(
# 163 "apron_parser.mly"
         ( _1 )
# 700 "apron_parser.ml"
               : 'coeff))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : (Texpr1.typ * Texpr1.round)) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'coeff0) in
    Obj.repr(
# 164 "apron_parser.mly"
                ( Coeff.neg _2 )
# 708 "apron_parser.ml"
               : 'coeff))
(* Entry lincons *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry generator *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry linexpr *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry tcons *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry texpr *)
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
let lincons (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Lincons0.typ * (string*Coeff.t) list)
let generator (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 2 lexfun lexbuf : Generator0.typ * (string*Coeff.t) list)
let linexpr (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 3 lexfun lexbuf : (string*Coeff.t) list)
let tcons (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 4 lexfun lexbuf : Tcons0.typ * Texpr1.expr)
let texpr (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 5 lexfun lexbuf : Texpr1.expr)


(** Linking lexer and parser function, with (basic) error messages *)

exception Lex_error

val lex_eol : Lexing.lexbuf -> unit
  (** Function to call on line returns in lexer *)

val parse_lexbuf :
  lexer:(Lexing.lexbuf -> 'token) ->
  parser:((Lexing.lexbuf -> 'token) -> Lexing.lexbuf -> 'ast) ->
  Lexing.lexbuf -> 'ast
  (** 
    Takes as input a lexer, a parser compatible with the lexer 
    (ie, they share the same type for tokens), and a [lexbuf], 
    
    Returns the AST built by the parser. 
  *)

val parse_string :
  lexer:(Lexing.lexbuf -> 'token) ->
  parser:((Lexing.lexbuf -> 'token) -> Lexing.lexbuf -> 'ast) -> 
  string -> 
  'ast
  (** Same as before, but create itself a [lexbuf] from the given string. *) 

val parse_file :
  lexer:(Lexing.lexbuf -> 'token) ->
  parser:((Lexing.lexbuf -> 'token) -> Lexing.lexbuf -> 'ast) -> 
  string -> 
  'ast
  (** Same as before, but create itself a [lexbuf] from the given filename. *) 

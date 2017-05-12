
(** Linking lexer and parser function, with (basic) error messages *)

exception Lex_error

let lex_eol lexbuf =
  let pos = lexbuf.Lexing.lex_curr_p in
  lexbuf.Lexing.lex_curr_p <- { pos with
    Lexing.pos_lnum = pos.Lexing.pos_lnum + 1;
    Lexing.pos_bol = pos.Lexing.pos_cnum;
  };
  ()

let parse_lexbuf
  ~(lexer:(Lexing.lexbuf -> 'token))
  ~(parser:((Lexing.lexbuf  -> 'token) -> Lexing.lexbuf -> 'ast))
  (lexbuf:Lexing.lexbuf)
  :
  'ast
  =
  try
    parser lexer lexbuf
  with
  | Parsing.Parse_error ->
      let startp = Lexing.lexeme_start_p lexbuf
      and endp = Lexing.lexeme_end_p lexbuf
      in
      Format.eprintf
	"Syntaxical error: %s, line %i, characters %i-%i: '%s'.@."
	startp.Lexing.pos_fname
	startp.Lexing.pos_lnum
	(startp.Lexing.pos_cnum - startp.Lexing.pos_bol)
	(endp.Lexing.pos_cnum - endp.Lexing.pos_bol)
	(Lexing.lexeme lexbuf);
      raise Exit;
  | Lex_error ->
      let startp = Lexing.lexeme_start_p lexbuf
      and endp = Lexing.lexeme_end_p lexbuf
      in
      Format.eprintf "Lexical error: %s, line %i, character %i-%i: '%s'.@."
	startp.Lexing.pos_fname
	startp.Lexing.pos_lnum
	(startp.Lexing.pos_cnum - startp.Lexing.pos_bol)
	(endp.Lexing.pos_cnum - endp.Lexing.pos_bol)
	(Lexing.lexeme lexbuf);
      raise Exit
  | Failure(s) when s="int_of_string" ->
      let startp = Lexing.lexeme_start_p lexbuf
      and endp = Lexing.lexeme_end_p lexbuf
      in
      Format.eprintf "Lexical error: %s, line %i, character %i-%i: '%s'.@.int_of_string failure.@."
	startp.Lexing.pos_fname
	startp.Lexing.pos_lnum
	(startp.Lexing.pos_cnum - startp.Lexing.pos_bol)
	(endp.Lexing.pos_cnum - endp.Lexing.pos_bol)
	(Lexing.lexeme lexbuf);
      raise Exit

let parse_string
  ~(lexer:(Lexing.lexbuf -> 'token))
  ~(parser:((Lexing.lexbuf  -> 'token) -> Lexing.lexbuf -> 'ast))
  (str:string)
  :
  'ast
  =
  let lexbuf = Lexing.from_string str in
  lexbuf.Lexing.lex_curr_p <- { lexbuf.Lexing.lex_curr_p with
    Lexing.pos_fname = "string \""^str^"\""
  };
  let ast = parse_lexbuf ~lexer ~parser lexbuf in
  ast


let parse_file
  ~(lexer:(Lexing.lexbuf -> 'token))
  ~(parser:((Lexing.lexbuf  -> 'token) -> Lexing.lexbuf -> 'ast))
  (filename:string)
  :
  'ast
  =
  let input = open_in filename in
  let lexbuf = Lexing.from_channel input in
  lexbuf.Lexing.lex_curr_p <- { lexbuf.Lexing.lex_curr_p with
    Lexing.pos_fname = "file "^filename;
  };
  let ast = parse_lexbuf ~lexer ~parser lexbuf in
  close_in input;
  ast
    

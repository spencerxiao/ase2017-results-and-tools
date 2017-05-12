(** Master module *)

(* This file is part of the Interproc analyzer, released under GPL license.
   Please read the COPYING file packaged in the distribution.

   Copyright (C) Mathias Argoud, Gaël Lalire, Bertrand Jeannet 2007.
*)

open Format
open Option

let main () =
  (* Parsing the command line *)
  Arg.parse
    Option.speclist
      (begin fun name -> Option.inputfilename := name end)
      "interproc <options> <inputfile>"
  ;
  (* Parsing the program *)
  let input = open_in !Option.inputfilename in
  let lexbuf = Lexing.from_channel input in
  lexbuf.Lexing.lex_curr_p <- { lexbuf.Lexing.lex_curr_p with
    Lexing.pos_fname = "file "^(!Option.inputfilename);
  };
  let prog = Frontend.parse_lexbuf Format.err_formatter lexbuf in
  close_in input;
  
  if !debug>0 then
    printf "%sProgram with its control points:%s@.%a@."
      (!Option.displaytags).precolorB (!Option.displaytags).postcolor
      (PSpl_syn.print_program
	(begin fun fmt point ->
	  fprintf fmt "%s%a%s"
	  (!Option.displaytags).precolorR
	  PSpl_syn.print_point point
	  (!Option.displaytags).postcolor
	end))
      prog
  ;

  (* Computing solution *)
  Frontend.analyze_and_display Format.std_formatter prog;
  ()

let _ = main()

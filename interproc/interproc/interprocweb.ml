(** CGI-Interface for the interproc analyzer *)

(* This file is part of the Interproc analyzer, released under GPL license.
   Please read the COPYING file packaged in the distribution.

   Copyright (C) Mathias Argoud, Gaël Lalire, Bertrand Jeannet 2007.
*)

open Html
open Http
open Cgi
open Sscookie
open Date

type option =
  | Rational
  | Floating

(* you will need to change the following address *)
module Link = struct
  let (url:string) =
    Html.link
      "http://pop-art.inrialpes.fr/interproc/interprocweb.cgi"
      "interprocweb"
  let (urlf:string) =
    Html.link
      "http://pop-art.inrialpes.fr/interproc/interprocwebf.cgi"
      "interprocwebf"
  let (apron:string) =
    Html.link
      "http://apron.cri.ensmp.fr/library/"
      "APRON Abstract Domain Library"
  let (fixpoint:string) =
    Html.link
      "http://pop-art.inrialpes.fr/people/bjeannet/bjeannet-forge/fixpoint/index.html"
      "Fixpoint Solver Library"
  let (interproc:string) =
    Html.link
      "http://pop-art.inrialpes.fr/people/bjeannet/bjeannet-forge/interproc/index.html"
      "Interproc"
  let (simple_syntax:string) =
    Html.link
      "http://pop-art.inrialpes.fr/people/bjeannet/bjeannet-forge/interproc/manual_syntax.html"
      "``Simple'' language syntax"
  let (program_examples:string) =
    Print.sprintf "%s %s %s %s %s %s %s %s"
      (Html.link
	"interproc_examples/incr.txt" "incr")
      (Html.link
	"interproc_examples/ackerman.txt" "ackerman")
      (Html.link
	"interproc_examples/fact.txt" "fact")
      (Html.link
	"interproc_examples/numerical.txt" "numerical")
      (Html.link
	"interproc_examples/numerical2.txt" "numerical2")
      (Html.link
	"interproc_examples/maccarthy91.txt" "maccarthy91")
      (Html.link
	"interproc_examples/heapsort.txt" "heapsort")
      (Html.link
	"interproc_examples/symmetricalstairs.txt" "symmetricalstairs")

  let (ocamlhtml:string) =
    Html.link
      "http://www.eleves.ens.fr/home/mine/ocamlhtml/"
      "OCamlHtml library"
end

(* ********************************************************************** *)
(* analyze *)
(* ********************************************************************** *)
let myescape_html s =
  let buf = Buffer.create 16 in
  let i = ref 0 in
  while !i < String.length s do
    if s.[!i]='<' then begin
      if (String.sub s (!i+1) 11)="span style=" then begin
	let index_end = String.index_from s (!i + 12) '>' in
	Buffer.add_string buf
	  (String.sub s !i (index_end + 1 - !i));
	i := index_end + 1;
      end
      else if (String.sub s (!i+1) 6)="/span>" then begin
	Buffer.add_string buf "</span>";
	i := !i + 7;
      end
      else begin
	Buffer.add_string buf "&lt;";
	incr i;
      end
    end
    else begin
      if s.[!i]='>' then Buffer.add_string buf "&gt;"
      else if s.[!i]='&' then Buffer.add_string buf "&amp;"
      else if s.[!i]='"' then Buffer.add_string buf "&quot;"
      else Buffer.add_char buf s.[!i]
      ;
      incr i;
    end;
  done;
  Buffer.contents buf

let analyze (progtext:string) =
  let d = Date.get_date ()
  and e = Date.get_date ()
  in
  Date.add_minutes e 15;
  Html.h1 "Analysis Result";

  Html.p ("Run "^Link.url^" or "^Link.urlf^" ?");

  let buffer = Buffer.create (String.length progtext) in
  let (output:Format.formatter) = Format.formatter_of_buffer buffer in
  begin try
    Option.displaytags := Option.htmltags;
    (* Parsing the program *)
    let lexbuf = Lexing.from_string progtext in
    let prog = Frontend.parse_lexbuf output lexbuf in
    (* Computing solution *)
    Frontend.analyze_and_display output prog;
    ()
  with
  | Exit -> ()
  | Failure s ->
      Html.h2 "Source";
      Html.pre progtext;

      Html.p (Html.escape_html s)
  end;

  Html.h2 "Result";
  print_string "<pre>\r\n";
  print_string (myescape_html (Buffer.contents buffer));
  Buffer.clear buffer;
  print_string "</pre>\r\n";
  Html.h2 "Source";
  Html.pre progtext;

  Html.p ("Run "^Link.url^" or "^Link.urlf^" ?");
  ()

(* ********************************************************************** *)
(* frontpage *)
(* ********************************************************************** *)

let frontpage ~(opt:option) =
  Html.h1 (match opt with
  | Rational -> "The Interproc Analyzer"
  | Floating -> "The Interprocf Analyzer"
  );
  Html.p
    (Printf.sprintf "\
This is a web interface to the %s analyzer connected \
to the %s and the %s, whose goal is to demonstrate the features \
of the APRON library and, to a less extent, of the Analyzer fixpoint engine, \
in the static analysis field.<br><br> \
There are two compiled versions: %s, \
in which all the abstract domains use underlying multiprecision \
integer/rational numbers, and %s, \
in which box and octagon domains use underlying floating-point \
numbers in safe way.<br><br>This is the <b>%s</b> version"
      Link.interproc
      Link.apron
      Link.fixpoint
      Link.url
      Link.urlf
      (match opt with
      | Rational -> "Interproc"
      | Floating -> "Interprocf"
      )
    );
  Html.form_begin ~meth:Multipart
    (match opt with
    | Rational -> "http://pop-art.inrialpes.fr/interproc/interprocweb.cgi";
    | Floating -> "http://pop-art.inrialpes.fr/interproc/interprocwebf.cgi")
  ;
  Html.h2 "Arguments";
  Html.p ("\
Please type a program, upload a file from your hard-drive, \
or choose one the provided examples:"
  );
  Html.form_file ~maxlength:32768 "file";
  Html.br ();
  Html.form_menu "example"
    [
      Option (None,"none",         "user-supplied",  true);
      Option (None,"interproc_examples/incr.txt",     "Incr",     false);
      Option (None,"interproc_examples/ackerman.txt",     "Ackerman",     false);
      Option (None,"interproc_examples/fact.txt",         "Factorial",     false);
      Option (None,"interproc_examples/maccarthy91.txt",  "Mac Carthy 91",      false);
      Option (None,"interproc_examples/heapsort.txt",     "Heap Sort", false);
      Option (None,"interproc_examples/symmetricalstairs.txt", "Symmetrical Stairs", false);
      Option (None,"interproc_examples/numerical.txt", "Numerical example", false);
      Option (None,"interproc_examples/numerical2.txt", "Numerical example 2", false);
    ];
  Html.br ();
  Html.form_textarea ~default:"/* type your program here ! */" "text" 15 60;
  Html.br ();
  print_string "Numerical Abstract Domain: ";
  Html.form_menu "abstraction"
    [
      Option (None, "none", "Choose an Abstract Domain:", false);
      Option (None, "box", "box", false);
      Option (None, "boxpolicy", "box with policy iteration", false);
      Option (None, "octagon", "octagon", false);
      Option (None, "polka", "convex polyhedra (polka)", true);
      Option (None, "ppl", "convex polyhedra (PPL)", false);
      Option (None, "polkastrict", "strict convex polyhedra (polka)", false);
      Option (None, "pplstrict", "strict convex polyhedra (PPL)", false);
      Option (None, "polkaeq", "linear equalities (polka)", false);
      Option (None, "pplgrid", "linear congruences (PPL)", false);
      Option (None, "polkagrid", "convex polyhedra + linear congruences", false);
    ];
  print_string "<br>Kind of Analysis: ";
  Html.form_text
    ~size:6
    ~maxlength:6
    ~default:"f"
    "analysis"
  ;
  print_string "(sequence of forward and/or backward analysis)";

  print_string "<br><br>Iterations/Widening options:<br>";
  Html.form_checkbox
    ~checked:false
    "guided"
  ;
  print_string "guided iterations ";
  Html.form_text
    ~size:2
    ~maxlength:2
    ~default:"1"
    "widening_start"
  ;
  print_string " widening delay ";
  Html.form_text
    ~size:2
    ~maxlength:2
    ~default:"2"
    "descending"
  ;
  print_string " descending steps<br>";

  Html.form_text
    ~size:2
    ~maxlength:2
    ~default:"0"
    "debug"
  ;
  print_string " debugging level (0 to 6)<br>";

  print_string "\
<p>\n\
Hit the OK button to proceed: ";
  Html.form_submit ~label:"OK !" ();
  Html.form_reset ~label:"Reset" ();


  Html.form_end ();

  Html.h2 Link.simple_syntax;
  Html.p (Print.sprintf "Here are some program examples: %s" Link.program_examples);

  Html.h2 "Results";
  Html.p ~style:"note" "\
In order not to flood our web-server, analysis computation time is \
limited to 1min in this demonstration. Also note that result files are \
temporary files stored on our server that have a very short life-time."
  ;
  Html.p "The analysis computes an invariant at each program point.";
  Html.h2 "Informations";
  Html.p (Print.sprintf "\
The %s is freely available. It is written in C, with a OCaml binding. \
The %s analyzer and the %s are freely available, \
and are written in OCaml."
    Link.interproc
    Link.apron
    Link.fixpoint);
  Html.p
    (Print.sprintf "\
This CGI-WEB interface is written in OCaml using the %s, \
freely available"
      Link.ocamlhtml);
  ()


(* ********************************************************************** *)
(* main *)
(* ********************************************************************** *)

let mainpage ~(opt:option) =
  try
    let args = Cgi.get_cgi_args () in
(*
    Format.bprintf Format.stdbuf
      "%a"
      (Print.list
	(fun fmt (str1,ostr2) ->
	  Format.fprintf fmt "(%s,%s)"
	  str1
	  (begin match ostr2 with
	  | None -> "None"
	  | Some s -> "Some "^s
	  end)
	))
      args
    ;
    print_string "<pre>\r\n";
    print_string (myescape_html (Format.flush_str_formatter ()));
    print_string "</pre>\r\n";
*)
    let (text,args) = match args with
      | ("file",Some "")::
	  ("filecontent",Some "")::
	  ("example",Some "none")::
	  ("text",Some text)::
	  args
	->
	  (text,args)
      | ("file",_)::
	  ("filecontent",Some text)::
	  ("example",Some "none")::
	  ("text",_)::
	  args
	->
	  (text,args)

      | ("file",_)::
	  ("filecontent",_)::
	  ("example",Some filename)::
	  ("text",_ )::
	  args
	->
	  let file = open_in filename in
	  let buffer = Buffer.create 1024 in
	  begin
	    try
	      while true do
		let line = input_line file in
		Buffer.add_string buffer line;
		Buffer.add_string buffer "\r\n";
	      done
	    with
	    | End_of_file -> close_in file
	  end;
	  let text = Buffer.contents buffer in
	  (text,args)
      | _ -> raise Exit
    in

    Option.iteration_guided := false;

    List.iter
      (begin function
	| ("abstraction",Some name) ->
	    Option.domain := List.assoc name Option.assocnamedomain;
	| ("analysis", Some text) ->
	    Option.analysis := [];
	    String.iter
	      (begin fun chr ->
		match chr with
		| 'f' ->
		    Option.analysis := Option.Forward :: !Option.analysis
	      | 'b' ->
		  Option.analysis := Option.Backward :: !Option.analysis
	      | _ ->
		  raise (Arg.Bad ("Wrong argument `"^text^"'; option `-analysis' expects only 'f' or 'b' characters in its argument string"))
	    end)
	    text;
	    Option.analysis := List.rev !Option.analysis;
	    if !Option.analysis=[] then
	      Option.analysis := [Option.Forward]
	    ;
	| ("guided",Some "on") ->
	    Option.iteration_guided := true
	| ("widening_start",Some text) ->
	    Option.widening_start := int_of_string text;
	| ("descending",Some text) ->
	    Option.widening_descend := int_of_string text;
	| ("debug",Some text) ->
	    Option.debug := int_of_string text;
	| _ -> ()
      end)
      args
    ;
    analyze text
  with Exit ->
    frontpage ~opt

let main ~(opt:option) =
  Cgi.set_timeout 15;

  Sscookie.clean_cookies
    (match opt with
    | Rational -> "interprochtml";
    | Floating -> "interprocfhtml"
    );
  Http.http_header ();

  Html.html_begin
    ~lang:"en"
    ~author:"Antoine Min&eacute and Bertrand Jeannet"
    ~desc:"\
CGI interface to the Interproc static analyzer, \
illustrating the use of the APRON Abstract Domain Library"
    "Interproc Analyzer"
  ;
  mainpage ~opt;
  Html.html_end
    ~author:"Bertrand Jeannet"
    ~email:"bjeannet@NOSPAM inrialpes.fr"
    ()
  ;
  ()

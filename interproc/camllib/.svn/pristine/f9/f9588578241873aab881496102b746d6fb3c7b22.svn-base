
 (* Open the ocamlbuild world... *)
open Ocamlbuild_plugin;;
 (* We work with commands so often... *)
open Command;;

let dvipdf = try Sys.getenv "DVIPDF" with _ -> "dvipdf"
let makeindex = try Sys.getenv "MAKEINDEX" with _ -> "makeindex"
let latex = try Sys.getenv "LATEX" with _ -> "latex"


let ocamldoc_rules () =
  rule "ocamldoc: document ocaml project odocl & odoci (intro) & *odoc -> docdir (html)"
    ~insert:`top
    ~deps:["%.odocl"; "%.odoci"]
    ~prod:"%.docdir/index.html"
    ~stamp:"%.docdir/html.stamp"
    (begin fun env build ->
      let odoc_load = env "%.odocl" in
      let odoc_intro = env "%.odoci" in
      let docout = env "%.docdir/index.html" in
      let docdir = env "%.docdir" in
      let contents = string_list_of_file odoc_load in
      let dirname = Pathname.dirname odoc_load in
      let include_dirs = Pathname.include_dirs_of dirname in
      let to_build =
	List.map
	  begin fun module_name ->
	    expand_module include_dirs module_name ["odoc"]
	  end
	  contents
      in
      let odoc_paths = List.map Outcome.good (build to_build) in
      let tags = (Tags.union (tags_of_pathname docout) (tags_of_pathname docdir))++"ocaml" in
      Seq[Cmd (S[A"rm"; A"-rf"; Px docdir]);
	  Cmd (S[A"mkdir"; A"-p"; Px docdir]);
	  Cmd (S [!Options.ocamldoc;
		  S(List.map (fun a -> S[A"-load"; P a]) odoc_paths);
		  S([A"-intro";P odoc_intro]);
		  T(tags++"doc"++"docdir"); A"-d"; Px docdir])]
     end)
  ;
  rule "latex: document ocaml project odocl & *odoc -> tex"
    ~insert:`top
    ~dep:"%.odocl"
    ~prods:["%_ocamldoc.tex";"ocamldoc.sty"]
    (begin fun env build ->
      let odoc_load = env "%.odocl" in
      let odoc_tex = env "%_ocamldoc.tex" in
      let contents = string_list_of_file odoc_load in
      let dirname = Pathname.dirname odoc_load in
      let include_dirs = Pathname.include_dirs_of dirname in
      let to_build =
	List.rev_map
	  begin fun module_name ->
	    expand_module include_dirs module_name ["odoc"]
	  end
	  contents
      in
      let odoc_paths = List.map Outcome.good (build to_build) in
      let tags = (tags_of_pathname odoc_load)++"ocaml" in
      Cmd (S [!Options.ocamldoc;
	      S(List.map (fun a -> S[A"-load"; P a]) odoc_paths);
	      S([A"-noheader";A"-notrailer";A"-latextitle";A"1,chapter"; A"-latextitle"; A"2,section"; A"-latextitle"; A"3,subsection"; A"-latextitle"; A"4,subsubsection"; A"-latextitle"; A"5,paragraph"; A"-latex"]);
	      T(tags++"doc"); A"-o"; Px odoc_tex]);
     end);
  rule "latex: _ocamldoc.tex & tex -> dvi"
    ~insert:`top
    ~deps:["%_ocamldoc.tex"; "%.tex"]
    ~prod:"%.dvi"
    (begin fun env build ->
      let odoc_tex = env "%.tex" in
      let dvi = env "%.dvi" in
      let tags = (tags_of_pathname dvi)++"latex"++"dvi" in
      let cmd =  Cmd (S [A latex; T tags; A"-interaction=nonstopmode"; P odoc_tex]) in
      let cmd_index = Cmd (S [A makeindex; P (env "%")]) in
      Seq[cmd;cmd_index;cmd;cmd]
     end);
  rule "latex: dvi -> pdf"
    ~dep:"%.dvi"
    ~prod:"%.pdf"
    (begin fun env build ->
      let dvi = env "%.dvi" in
      let pdf = env "%.pdf" in
      let tags = (tags_of_pathname pdf)++"dvipdf" in
      let cmd =  Cmd (S [A dvipdf; T tags; P dvi]) in
      cmd
     end);
  ()

(* This dispatch call allows to control the execution order of your
   directives. *)
let _ = dispatch begin function
  (*c Here one can add or override new rules *)
  | After_rules ->
      (*c Here we make an extension of any rule that produces a command
	containing these tags. *)
      ocamldoc_rules ()
  | _ -> ()
end

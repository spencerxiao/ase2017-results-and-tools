(** Printing an (annotated) abstract syntax tree *)

(* This file is part of the Interproc analyzer, released under GPL license.
   Please read the COPYING file packaged in the distribution.

   Copyright (C) Mathias Argoud, Gaël Lalire, Bertrand Jeannet 2007.
*)

open Spl_syn;;
open Format;;

let print_point fmt (point:point)
  =
  fprintf fmt "(L%i C%i)"
    point.line point.col


let print_list
  ?(first=("[@[":(unit,Format.formatter,unit) format))
  ?(sep = (";@ ":(unit,Format.formatter,unit) format))
  ?(last = ("@]]":(unit,Format.formatter,unit) format))
  (print_elt: Format.formatter -> 'a -> unit)
  (fmt:Format.formatter)
  (list: 'a list)
  : unit
  =
  if list=[] then begin
    fprintf fmt first;
    fprintf fmt last;
  end
  else begin
    fprintf fmt first;
    let rec do_sep = function
      [e] -> print_elt fmt e
      | e::l -> (print_elt fmt e ; fprintf fmt sep; do_sep l)
      | [] -> failwith ""
    in
    do_sep list;
    fprintf fmt last;
  end

let print_poutput fmt (l:Apron.Var.t list) =
  match l with
  | [x] -> Apron.Var.print fmt x
  | _ ->
      print_list 
      ~first:"(@[<h>" ~sep:", " ~last:"@])"
      Apron.Var.print fmt l

let print_pinput fmt (l:Apron.Var.t list) =
  print_list
    ~first:"@[<h>" ~sep:", " ~last:"@]"
    Apron.Var.print fmt l

  

let print_var fmt x = 
  pp_print_string fmt (Apron.Var.to_string x)

let print_typ fmt x = 
  pp_print_string fmt
    begin match  x with
    | INT -> "int"
    | REAL -> "real"
    end

let print_iexpr = Apron.Texpr1.print_expr

let print_typcons fmt (typ:constyp) =
  pp_print_string fmt
    begin match typ with
    | EQ -> "=="
    | NEQ -> "!="
    | GT -> ">"
    | GEQ -> ">="
    | LEQ -> "<="
    | LT -> "<"
    end
let print_cons fmt (e1,typ,e2) =
  fprintf fmt "%a %a %a" 
    print_iexpr e1
    print_typcons typ
    print_iexpr e2

let print_bexpr fmt bexpr =
  let rec print (level:int) fmt = function
    | TRUE -> pp_print_string fmt "true"
    | FALSE -> pp_print_string fmt "false"
    | BRANDOM -> pp_print_string fmt "brandom"
    | CONS(cons) -> print_cons fmt cons
    | AND(e1,e2) ->
	if level <= 1 then
	  fprintf fmt "%a and %a"
	    (print 1) e1 (print 1) e2
	else
	  fprintf fmt "(%a and %a)"
	    (print 1) e1 (print 1) e2
    | OR(e1,e2) ->
	if level <= 0 then
	  fprintf fmt "%a or %a"
	    (print 0) e1 (print 0) e2
	else
	  fprintf fmt "(%a or %a)"
	    (print 0) e1 (print 0) e2
    | NOT(e) ->
	  fprintf fmt "not %a"
	    (print 2) e
  in
  print 0 fmt bexpr

let rec print_instr 
  print_comment 
  (fmt:Format.formatter) 
  (instr:instr)
  =
  begin match instr.instruction with
  | SKIP ->
     pp_print_string fmt "skip;"
  | HALT ->
     pp_print_string fmt "halt;"
  | FAIL ->
     pp_print_string fmt "fail;"
  | ASSUME(bexpr) ->
     fprintf fmt "assume %a;"
      print_bexpr bexpr
  | ASSIGN (var,iexpr) -> 
      fprintf fmt "%a = %a;"
      Apron.Var.print var
      print_iexpr iexpr
  | IF (bexpr,block) -> 
      fprintf fmt "if %a then@   %a@ endif;"
      print_bexpr bexpr
      (print_block print_comment) block
  | IFELSE(bexpr,bthen,belse) ->
      fprintf fmt "if %a then@    %a@ else@   %a@ endif;"
      print_bexpr bexpr
      (print_block print_comment) bthen 
      (print_block print_comment) belse
  | LOOP(bexpr,block) ->
      fprintf fmt "while %a do@   %a@ done;"
      print_bexpr bexpr
      (print_block print_comment) block
  | CALL(pout, id, pin) ->
      fprintf fmt "%a = %s(%a);"
      print_poutput pout
      id
      print_pinput pin
  end;
  fprintf fmt " /* %a */"
    print_comment instr.ipoint
    
and print_block print_comment fmt block =  
  fprintf fmt "@[<v>/* %a */"
    print_comment block.bpoint
  ;
  begin match block.instrs with
  | [] -> fprintf fmt " @]"
  | _ ->
      print_list ~first:"@ @[<v>" ~sep:"@ " ~last:"@]" 
      (print_instr print_comment) fmt block.instrs
  end;
  fprintf fmt "@]"

let print_declaration fmt (var,typ) =
  fprintf fmt "%a : %a"
    Apron.Var.print var
    print_typ typ

let print_declarations fmt list =
  print_list ~first:"@[<hov>" ~sep:",@ " ~last:"@]" 
    print_declaration fmt list



let print_procedure print_comment fmt proc =
  if proc.pname="" then begin
    fprintf fmt "@[<v>var %a;@ begin@   %a@ end@ @]"
      print_declarations proc.plocal
      (print_block print_comment) proc.pcode
  end
  else begin
    fprintf fmt "proc %s @[<hv>(%a) returns@ (%a)@ var %a;@]@ begin@   %a@ end@ "
      proc.pname
      print_declarations proc.pinput
      print_declarations proc.poutput
      print_declarations proc.plocal
      (print_block print_comment) proc.pcode
  end
let print_program print_comment fmt prog =
  print_list ~first:"@[<v>" ~sep:"@ " ~last:"@]"
    (print_procedure print_comment)
    fmt
    prog.procedures


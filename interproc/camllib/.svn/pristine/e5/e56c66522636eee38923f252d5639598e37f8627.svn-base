(** Symbol table, for string management *)

open Format

type t = int
module HashedType = struct
  type t = int
  let equal = (==)
  let hash x = x
end
module OrderedType = struct
  type t = int
  let compare = (-)
end

module Hash = Hashtbl.Make(HashedType)
module Set = Sette.Make(OrderedType)
module Map = Mappe.Make(Set)

let equal = (==)
let compare = (-)

let tbl_string_symbol = Hashtbl.create 101
  (* Association string -> symbol *)

let tbl_symbol_string = Hash.create 101
  (* Association symbol -> string *)

let counter = ref (-1)

let add name =
  try
    Hashtbl.find tbl_string_symbol name    
  with Not_found ->
    incr counter;
    Hashtbl.add tbl_string_symbol name !counter;
    Hash.add tbl_symbol_string !counter name ;
    !counter

let exists name =
  Hashtbl.mem tbl_string_symbol name
let of_string name =
  Hashtbl.find tbl_string_symbol name
let to_string symbol =
  Hash.find tbl_symbol_string symbol
let print fmt symbol =
  Format.pp_print_string fmt (to_string symbol)

let print_set fmt set =
  if Set.is_empty set then
    pp_print_string fmt "empty"
  else begin
    let min = Set.min_elt set in
    fprintf fmt "{ @[%s" (to_string min);
    Set.iter
      (fun x -> fprintf fmt ";@ %s" (to_string x))
      (Set.remove min set);
    fprintf fmt "@] }"
  end

let print_map print fmt map =
  if map = Map.empty then
    pp_print_string fmt "empty"
  else begin
    fprintf fmt "{ @[";
    let isfirst = ref true in
    Map.iter
      (begin fun t x -> 
	if !isfirst then begin
	  fprintf fmt "(%s,%a)" (to_string t) print x;
	  isfirst := false
	end
	else begin
	  fprintf fmt ";@ (%s,%a)" (to_string t) print x
	end
      end)
      map;
    fprintf fmt "@] }"
  end

let print_hash print fmt tbl =
  let isempty =
    try
      Hash.iter (fun _ _ -> raise Exit) tbl;
      true
    with Exit ->
      false
  in
  if isempty then
    pp_print_string fmt "empty"
  else begin
    fprintf fmt "{ @[";
    let isfirst = ref true in
    Hash.iter
      (begin fun t x -> 
	if !isfirst then begin
	  fprintf fmt "(%s,%a)" (to_string t) print x;
	  isfirst := false
	end
	else begin
	  fprintf fmt ";@ (%s,%a)" (to_string t) print x
	end
      end)
      tbl;
    fprintf fmt "@] }"
  end

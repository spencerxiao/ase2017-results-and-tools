(** Multisets implemented with lists *)

type 'a t = ('a * int) list

let of_set l = SetList.fold_right (fun x res -> (x,1)::res) l []
let to_set t = List.fold_right (fun (x,_) res -> SetList.add x res) t SetList.empty
let empty = []
let is_empty  t = (t=[])
let rec mem elt = function
  | [] -> false
  | (x,_)::l ->
      let drp = compare x elt in
      if drp > 0 then false
      else if drp=0 then true
      else mem elt l
let rec mult elt = function
  | [] -> 0
  | (x,n)::l ->
      let drp = compare x elt in
      if drp > 0 then 0
      else if drp=0 then n
      else mult elt l
let singleton x = [x]
let rec add ((elt,m) as em) = function
  | [] -> [em]
  | (((x,n) as xn)::l) as t ->
      let drp = compare x elt in
      if drp > 0 then em::t
      else if drp=0 then (x,n+m)::l
      else xn::(add em l)
let rec remove ((elt,m) as em) = function
  | [] -> []
  | (((x,n) as xn)::l) as t ->
      let drp = compare x elt in
      if drp < 0 then xn::(remove em l)
      else if drp=0 then if n<=m then l else (x,n-m)::l
      else t
let rec union ta tb = match (ta,tb) with
| ([],_) -> tb
| (_,[]) -> ta
| (((xa,na) as xna)::la,((xb,nb) as xnb)::lb) ->
    let drp = compare xa xb in
    if drp > 0 then xnb::(union ta lb)
    else if drp = 0 then (xa,na+nb)::(union la lb)
    else xna::(union la tb)
let rec inter ta tb = match (ta,tb) with
| ([],_) | (_,[]) -> []
| ((xa,na)::la,(xb,nb)::lb) ->
    let drp = compare xa xb in
    if drp > 0 then inter ta lb
    else if drp = 0 then (xa,min na nb)::(inter la lb)
    else inter la tb
let rec diff ta tb = match (ta,tb) with
| ([],_) -> []
| (_,[]) -> ta
| (((xa,na) as xna)::la,(xb,nb)::lb) ->
    let drp = compare xa xb in
    if drp > 0 then diff ta lb
    else if drp = 0 then 
      if na > nb then (xa,na-nb)::(diff la lb) else diff la lb
    else xna :: (diff la tb)
let union_set ta tb = 
  let rec union_set ta tb = match (ta,tb) with
    | ([],_) -> of_set (SetList.of_list tb)
    | (_,[]) -> ta
    | (((xa,na) as xna)::la, (xb::lb)) ->
	let drp = compare xa xb in
	if drp > 0 then (xb,1)::(union_set ta lb)
	else if drp = 0 then (xa,na+1)::(union_set la lb)
	else xna::(union_set la tb)
  in
  union_set ta (SetList.to_list tb)
let inter_set ta tb = 
  let rec inter_set ta tb = match (ta,tb) with
  | ([],_) | (_,[]) -> []
  | (((xa,na) as xna)::la,xb::lb) ->
      let drp = compare xa xb in
      if drp > 0 then inter_set ta lb
      else if drp = 0 then xna::(inter_set la lb)
      else inter_set la tb
  in
  inter_set ta (SetList.to_list tb)
let diff_set ta tb = 
  let rec diff_set ta tb = match (ta,tb) with
  | ([],_) -> []
  | (_,[]) -> ta
  | (((xa,na) as xna)::la,xb::lb) ->
      let drp = compare xa xb in
      if drp > 0 then diff_set ta lb
      else if drp = 0 then diff_set la lb
      else xna :: (diff_set la tb)
  in
  diff_set ta (SetList.to_list tb)
let rec equal ta tb =  match (ta,tb) with
| ([],[]) -> true
| ([],_) | (_,[]) -> false
| ((xa,na)::la,(xb,nb)::lb) -> 
    if compare xa xb = 0 && na = nb then equal la lb else false
let rec subset ta tb =  match (ta,tb) with
| ([],_) -> true
| (_,[]) -> false
| ((xa,na)::la,(xb,nb)::lb) -> 
    let drp = compare xa xb in
    if drp > 0 then subset ta lb
    else if drp = 0 && na <= nb then subset la lb
    else false
let iter = List.iter
let rec fold f l accu =
  match l with
  | [] -> accu
  | (a,n)::l -> fold f l (f (a,n) accu)
let fold_right = List.fold_right
let fold_left = List.fold_left
let filter p l =
  let rec find accu = function
    | [] -> List.rev accu
    | (x,n) :: l -> if p x then find ((x,n) :: accu) l else find accu l 
  in
  find [] l
let partition p l =
  let rec part yes no = function
    | [] -> (List.rev yes, List.rev no)
    | (x,n) :: l -> if p x then part ((x,n) :: yes) no l else part yes ((x,n) :: no) l in
  part [] [] l
let cardinal = List.length
let elements = to_set
let min_elt = function
  | [] -> raise Not_found
  | (x,_) :: _ -> x
let rec max_elt = function
  | [] -> raise Not_found
  | [(x,_)] -> x
  | _ ::l -> max_elt l
let min = function
  | [] -> raise Not_found
  | xn :: l -> 
      List.fold_left 
	(fun ((_,mult) as res) ((_,n) as xn) -> if n < mult then xn else res)
	xn l
let max = function
  | [] -> raise Not_found
  | xn :: l -> 
      List.fold_left 
	(fun ((_,mult) as res) ((_,n) as xn) -> if n > mult then xn else res)
	xn l
let mins = function
  | [] -> raise Not_found
  | (x,n) :: l -> 
      List.fold_left 
	(fun ((set,mult) as res) (x,n) -> 
	  if n < mult then (SetList.singleton x,n)
	  else if n = mult then (SetList.add x set, mult)
	  else res)
	(SetList.singleton x,n) l
let maxs = function
  | [] -> raise Not_found
  | (x,n) :: l -> 
      List.fold_left 
	(fun ((set,mult) as res) (x,n) -> 
	  if n > mult then (SetList.singleton x,n)
	  else if n = mult then (SetList.add x set, mult)
	  else res)
	(SetList.singleton x,n) l
let choose = min_elt

let compare =
  let rec cmp ta tb = match (ta,tb) with
  | ([],[]) -> 0
  | ([],_) -> -1
  | (_,[]) -> 1
  | ((xa,na)::la,(xb,nb)::lb) ->
      let drp = compare xa xb in
      if drp = 0 then if na=nb then cmp la lb else na-nb
      else drp
  in cmp

let print 
  ?(first : (unit, Format.formatter, unit) format = ("[@[" : (unit, Format.formatter, unit) format))
  ?(sep : (unit, Format.formatter, unit) format = (";@ ":(unit, Format.formatter, unit) format))
  ?(last : (unit, Format.formatter, unit) format = ("@]]":(unit, Format.formatter, unit) format))
  func formatter liste 
  =
  Print.list ~first ~sep ~last 
    (Print.pair ~first:"(" ~sep:"," ~last:")" func Format.pp_print_int)
    formatter liste

(** Output signature of the functor {!MultiSetList.Make} *)
module type S = 
  sig
    type elt
    type t
    val empty: t
    val is_empty: t -> bool
    val mem: elt -> t -> bool
    val mult: elt -> t -> int
    val singleton: elt * int -> t
    val add: elt * int -> t -> t
    val remove: elt * int -> t -> t
    val union: t -> t -> t
    val inter: t -> t -> t
    val diff: t -> t -> t
    val union_set : t -> elt SetList.t -> t
    val inter_set: t -> elt SetList.t -> t
    val diff_set: t -> elt SetList.t -> t
    val compare: t -> t -> int
    val equal: t -> t -> bool
    val subset: t -> t -> bool
    val iter: ((elt * int) -> unit) -> t -> unit
    val fold: ((elt * int) -> 'a -> 'a) -> t -> 'a -> 'a
    val fold_right: ((elt * int) -> 'a -> 'a) -> t -> 'a -> 'a
    val fold_left: ('a -> (elt * int) -> 'a) -> 'a -> t -> 'a
    val filter : (elt -> bool) ->  t -> t
    val partition : (elt -> bool) ->  t -> t * t
    val cardinal: t -> int
    val elements: t -> elt SetList.t
    val min_elt: t -> elt
    val max_elt: t -> elt
    val min: t -> elt * int
    val max: t -> elt * int
    val mins: t -> elt SetList.t * int
    val maxs: t -> elt SetList.t * int
    val choose: t -> elt
    val of_set: elt SetList.t -> t
    val to_set: t -> elt SetList.t
    val print: 
      ?first:(unit, Format.formatter, unit) format ->
      ?sep:(unit, Format.formatter, unit) format ->
      ?last:(unit, Format.formatter, unit) format ->
      (Format.formatter -> elt -> unit) -> Format.formatter -> t -> unit

end

(** Functor building an implementation of the MultiSetList structure
   given a totally ordered type. *)
module Make(Ord: Set.OrderedType) = struct
  type elt = Ord.t
  type t = (elt * int) list

  let of_set = of_set
  let to_set = to_set
  let empty = empty
  let is_empty = is_empty
  let rec mem elt = function
    | [] -> false
    | (x,_)::l ->
	let drp = Ord.compare x elt in
	if drp > 0 then false
	else if drp=0 then true
	else mem elt l
  let rec mult elt = function
    | [] -> raise Not_found
    | (x,n)::l ->
	let drp = Ord.compare x elt in
	if drp > 0 then raise Not_found
	else if drp=0 then n
	else mult elt l
  let singleton = singleton
  let rec add ((elt,m) as em) = function
    | [] -> [em]
    | (((x,n) as xn)::l) as t ->
	let drp = Ord.compare x elt in
	if drp > 0 then em::t
	else if drp=0 then (x,n+m)::l
	else xn::(add em l)
  let rec remove ((elt,m) as em) = function
  | [] -> []
  | (((x,n) as xn)::l) as t ->
      let drp = Ord.compare x elt in
      if drp < 0 then xn::(remove em l)
      else if drp=0 then if n<=m then l else (x,n-m)::l
      else t
  let rec union ta tb = match (ta,tb) with
  | ([],_) -> tb
  | (_,[]) -> ta
  | (((xa,na) as xna)::la,((xb,nb) as xnb)::lb) ->
      let drp = Ord.compare xa xb in
      if drp > 0 then xnb::(union ta lb)
      else if drp = 0 then (xa,na+nb)::(union la lb)
      else xna::(union la tb)
  let rec inter ta tb = match (ta,tb) with
  | ([],_) | (_,[]) -> []
  | ((xa,na)::la,(xb,nb)::lb) ->
      let drp = Ord.compare xa xb in
      if drp > 0 then inter ta lb
      else if drp = 0 then (xa,Pervasives.min na nb)::(inter la lb)
      else inter la tb
  let rec diff ta tb = match (ta,tb) with
  | ([],_) -> []
  | (_,[]) -> ta
  | (((xa,na) as xna)::la,(xb,nb)::lb) ->
      let drp = Ord.compare xa xb in
      if drp > 0 then diff ta lb
      else if drp = 0 then 
	if na > nb then (xa,na-nb)::(diff la lb) else diff la lb
      else xna :: (diff la tb)
  let union_set ta tb = 
    let rec union_set ta tb = match (ta,tb) with
      | ([],_) -> of_set (SetList.of_list tb)
      | (_,[]) -> ta
      | (((xa,na) as xna)::la, (xb::lb)) ->
	  let drp = Ord.compare xa xb in
	  if drp > 0 then (xb,1)::(union_set ta lb)
	  else if drp = 0 then (xa,na+1)::(union_set la lb)
	else xna::(union_set la tb)
    in
    union_set ta (SetList.to_list tb)
  let inter_set ta tb = 
    let rec inter_set ta tb = match (ta,tb) with
    | ([],_) | (_,[]) -> []
    | (((xa,na) as xna)::la,xb::lb) ->
	let drp = Ord.compare xa xb in
	if drp > 0 then inter_set ta lb
	else if drp = 0 then xna::(inter_set la lb)
	else inter_set la tb
    in
    inter_set ta (SetList.to_list tb)
  let diff_set ta tb = 
    let rec diff_set ta tb = match (ta,tb) with
    | ([],_) -> []
    | (_,[]) -> ta
    | (((xa,na) as xna)::la,xb::lb) ->
	let drp = Ord.compare xa xb in
	if drp > 0 then diff_set ta lb
	else if drp = 0 then diff_set la lb
	else xna :: (diff_set la tb)
    in
    diff_set ta (SetList.to_list tb)
  let rec equal ta tb =  match (ta,tb) with
  | ([],[]) -> true
  | ([],_) | (_,[]) -> false
  | ((xa,na)::la,(xb,nb)::lb) -> 
      if Ord.compare xa xb = 0 && na = nb then equal la lb else false
  let rec subset ta tb =  match (ta,tb) with
  | ([],_) -> true
  | (_,[]) -> false
  | ((xa,na)::la,(xb,nb)::lb) -> 
      let drp = Ord.compare xa xb in
      if drp > 0 then subset ta lb
      else if drp = 0 && na <= nb then subset la lb
      else false
  let iter = List.iter
  let fold = fold
  let fold_right = List.fold_right
  let fold_left = List.fold_left
  let filter = filter
  let partition = partition
  let cardinal = List.length
  let elements = elements
  let min_elt = min_elt
  let max_elt = max_elt
  let min = min
  let max = max
  let mins = mins
  let maxs = maxs
  let choose = min_elt
  let compare =
    let rec cmp ta tb = match (ta,tb) with
    | ([],[]) -> 0
    | ([],_) -> -1
    | (_,[]) -> 1
    | ((xa,na)::la,(xb,nb)::lb) ->
	let drp = Ord.compare xa xb in
	if drp = 0 then if na=nb then cmp la lb else na-nb
	else drp
    in cmp
  let print = print
end

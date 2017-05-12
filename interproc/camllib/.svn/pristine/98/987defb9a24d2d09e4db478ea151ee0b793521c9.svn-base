(** Sets over totally ordered type with lists *)

(* version generique *)

type 'a t = 'a list

let print = Print.list
let empty = []
let is_empty t = (t=[])
let rec mem elt = function
  | [] -> false
  | x::l ->
      let drp = compare x elt in
      if drp > 0 then false
      else if drp=0 then true
      else mem elt l
let of_list l = List.stable_sort Pervasives.compare l
let to_list l = l
let singleton elt = [elt]
let rec add elt = function
  | [] -> [elt]
  | (x::l) as t ->
      let drp = compare x elt in
      if drp > 0 then elt::t
      else if drp=0 then t
      else x::(add elt l)
let rec remove elt = function
  | [] -> []
  | (x::l) as t ->
      let drp = compare x elt in
      if drp < 0 then x::(remove elt l)
      else if drp=0 then l
      else t
let rec union ta tb = match (ta,tb) with
| ([],_) -> tb
| (_,[]) -> ta
| (xa::la,xb::lb) ->
    let drp = compare xa xb in
    if drp > 0 then xb::(union ta lb)
    else if drp = 0 then xa::(union la lb)
    else xa::(union la tb)
let rec inter ta tb = match (ta,tb) with
| ([],_) | (_,[]) -> []
| (xa::la,xb::lb) ->
    let drp = compare xa xb in
    if drp > 0 then inter ta lb
    else if drp = 0 then xa::(inter la lb)
    else inter la tb
let rec diff ta tb = match (ta,tb) with
| ([],_) -> []
| (_,[]) -> ta
| (xa::la,xb::lb) ->
    let drp = compare xa xb in
    if drp > 0 then diff ta lb
    else if drp = 0 then diff la lb
    else xa :: (diff la tb)
let rec equal ta tb =  match (ta,tb) with
| ([],[]) -> true
| ([],_) | (_,[]) -> false
| (xa::la,xb::lb) -> if compare xa xb = 0 then equal la lb else false
let rec subset ta tb =  match (ta,tb) with
| ([],_) -> true
| (_,[]) -> false
| (xa::la,xb::lb) -> 
    let drp = compare xa xb in
    if drp > 0 then subset ta lb
    else if drp = 0 then subset la lb
    else false
let iter = List.iter
let rec fold f l accu =
  match l with
  | [] -> accu
  | a::l -> fold f l (f a accu)
let fold_right = List.fold_right
let fold_left = List.fold_left
let cardinal = List.length
let elements t = t
let min_elt = function
  | [] -> raise Not_found
  | x :: _ -> x
let rec max_elt = function
  | [] -> raise Not_found
  | [x] -> x
  | _ ::l -> max_elt l
let choose = min_elt
let compare =
  let rec cmp ta tb = match (ta,tb) with
  | ([],[]) -> 0
  | ([],_) -> -1
  | (_,[]) -> 1
  | (xa::la,xb::lb) ->
      let drp = compare xa xb in
      if drp = 0 then cmp la lb
      else drp
  in cmp
let rec filter f = function
  | [] -> []
  | x :: l -> 
      let suite = filter f l in
      if f x then x :: suite else suite
let partition f t =
  List.fold_right
    (begin fun x (a,b) ->
      if f x then
	(x :: a, b)
      else
	(a, x :: b)
    end)
    t ([],[])
let rec exists f = function
  | [] -> false
  | x :: l -> (f x) || (exists f l)
let rec for_all f = function
  | [] -> true
  | x :: l -> (f x) && (exists f l)

(* version parametree *)

(** Output signature of the functor {!SetList.Make} *)
module type S =
  sig
    type elt
    type t
    val print : 
      ?first:(unit, Format.formatter, unit) format ->
      ?sep:(unit, Format.formatter, unit) format ->
      ?last:(unit, Format.formatter, unit) format ->
      (Format.formatter -> elt -> unit) -> Format.formatter -> t -> unit
    val empty : t
    val is_empty : t -> bool
    val mem : elt -> t -> bool
    val of_list : elt list -> t
    val to_list : t -> elt list
    val singleton : elt -> t
    val add : elt -> t -> t
    val remove : elt -> t -> t
    val union : t -> t -> t
    val inter : t -> t -> t
    val diff : t -> t -> t
    val compare : t -> t -> int
    val equal : t -> t -> bool
    val subset : t -> t -> bool
    val iter : (elt -> unit) -> t -> unit
    val fold : (elt -> 'a -> 'a) -> t -> 'a -> 'a
    val fold_right : (elt -> 'a -> 'a) -> t -> 'a -> 'a
    val fold_left : ('a -> elt -> 'a) -> 'a -> t -> 'a
    val cardinal : t -> int
    val elements : t -> elt list
    val min_elt : t -> elt
    val max_elt : t -> elt
    val choose : t -> elt
    val filter : (elt -> bool) -> t -> t
    val partition : (elt -> bool) -> t -> (t * t)
    val exists : (elt -> bool) -> t -> bool
    val for_all : (elt -> bool) -> t -> bool
  end

(** Functor building an implementation of the SetList structure
   given a totally ordered type. *)
module Make(Ord: Set.OrderedType) = struct
  type elt = Ord.t
  type t = elt list
  let print = print
  let empty = empty
  let is_empty = is_empty
  let rec mem elt = function
    | [] -> false
    | x::l ->
	let drp = Ord.compare x elt in
	if drp > 0 then false
	else if drp=0 then true
	else mem elt l
  let of_list = of_list
  let to_list = to_list
  let singleton = singleton
  let rec add elt = function
    | [] -> [elt]
    | (x::l) as t ->
	let drp = Ord.compare x elt in
	if drp > 0 then elt::t
	else if drp=0 then t
	else x::(add elt l)
  let rec remove elt = function
    | [] -> []
    | (x::l) as t ->
	let drp = Ord.compare x elt in
	if drp < 0 then x::(remove elt l)
	else if drp=0 then l
	else t
  let rec union ta tb = match (ta,tb) with
  | ([],_) -> tb
  | (_,[]) -> ta
  | (xa::la,xb::lb) ->
      let drp = Ord.compare xa xb in
      if drp > 0 then xb::(union ta lb)
      else if drp = 0 then xa::(union la lb)
      else xa::(union la tb)
  let rec inter ta tb = match (ta,tb) with
  | ([],_) | (_,[]) -> []
  | (xa::la,xb::lb) ->
      let drp = Ord.compare xa xb in
      if drp > 0 then inter ta lb
      else if drp = 0 then xa::(inter la lb)
      else inter la tb
  let rec diff ta tb = match (ta,tb) with
  | ([],_) -> []
  | (_,[]) -> ta
  | (xa::la,xb::lb) ->
      let drp = Ord.compare xa xb in
      if drp > 0 then diff ta lb
      else if drp = 0 then diff la lb
      else xa :: (diff la tb)
  let rec equal ta tb =  match (ta,tb) with
  | ([],[]) -> true
  | ([],_) | (_,[]) -> false
  | (xa::la,xb::lb) -> if Ord.compare xa xb = 0 then equal la lb else false
  let rec subset ta tb =  match (ta,tb) with
  | ([],_) -> true
  | (_,[]) -> false
  | (xa::la,xb::lb) -> 
      let drp = Ord.compare xa xb in
      if drp > 0 then subset ta lb
      else if drp = 0 then subset la lb
      else false
  let iter = List.iter
  let fold = fold
  let fold_right = List.fold_right
  let fold_left = List.fold_left
  let cardinal = List.length
  let elements t = t
  let min_elt = min_elt
  let max_elt = max_elt
  let choose = choose
  let rec compare ta tb = match (ta,tb) with
  | ([],[]) -> 0
  | ([],_) -> -1
  | (_,[]) -> 1
  | (xa::la,xb::lb) ->
      let drp = Ord.compare xa xb in
      if drp = 0 then compare la lb
      else drp
  let filter = filter
  let partition = partition
  let exists = exists
  let for_all = for_all
end

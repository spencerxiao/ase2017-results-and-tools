(** Two-way hashtable between two data types *)

open Format

(** The type of two-way hashtables *)
type ('a,'b) t = {
  xy : ('a,'b) Hashhe.t;
  yx : ('b,'a) Hashhe.t
}

let hashx t = t.xy
let hashy t = t.yx

let clear t =
  Hashhe.clear t.xy;
  Hashhe.clear t.yx;
  ()

let reset t =
  Hashhe.reset t.xy;
  Hashhe.reset t.yx;
  ()

let create size = { xy = Hashhe.create size; yx = Hashhe.create size }
let add t x y =
  Hashhe.replace t.xy x y;
  Hashhe.replace t.yx y x

let y_of_x t x = Hashhe.find t.xy x
let x_of_y t y = Hashhe.find t.yx y
let removex t x =
  let y = y_of_x t x in
  Hashhe.remove t.xy x;
  Hashhe.remove t.yx y
let removey t y =
  let x = x_of_y t y in
  Hashhe.remove t.xy x;
  Hashhe.remove t.yx y

let memx t x = Hashhe.mem t.xy x
let memy t y = Hashhe.mem t.yx y
let iter t f = Hashhe.iter f t.xy
let fold t v f = Hashhe.fold f t.xy v
let cardinal t = Hashhe.fold (fun x y res -> res+1) t.xy 0
let print
  ?(first : (unit, Format.formatter, unit) format = ("[@[<hv>" : (unit, Format.formatter, unit) format))
  ?(sep : (unit, Format.formatter, unit) format = (";@ ":(unit, Format.formatter, unit) format))
  ?(last : (unit, Format.formatter, unit) format = ("@]]":(unit, Format.formatter, unit) format))
  ?(firstbind : (unit, Format.formatter, unit) format = ("" : (unit, Format.formatter, unit) format))
  ?(sepbind : (unit, Format.formatter, unit) format = (" => ":(unit, Format.formatter, unit) format))
  ?(lastbind : (unit, Format.formatter, unit) format = ("":(unit, Format.formatter, unit) format))
  px py fmt t
  =
  Hashhe.print ~first ~sep ~last ~firstbind ~sepbind ~lastbind
    px py
    fmt t.xy

(** Input signature of the functor {!DHashhe.Make}. *)
module type Param = sig
  module HashX : Hashhe.S
    (** Hashtable for objects in the first place of bindings *)
  module HashY : Hashhe.S
    (** Hashtable for objects in the second place of bindings *)
end

(** Output signature of the functor {!DHashhe.Make}. *)
module type S = sig
  module HashX : Hashhe.S
  module HashY : Hashhe.S
  type x = HashX.key
  type y = HashY.key
  type t
  val hashx : t -> y HashX.t
  val hashy : t -> x HashY.t
  val clear : t -> unit
  val reset : t -> unit
  val create : int -> t
  val add : t -> x -> y -> unit
  val y_of_x : t -> x -> y
  val x_of_y : t -> y -> x
  val removex : t -> x -> unit
  val removey : t -> y -> unit
  val memx : t -> x -> bool
  val memy : t -> y -> bool
  val iter : t -> (x -> y -> unit) -> unit
  val fold : t -> 'a -> (x -> y -> 'a -> 'a) -> 'a
  val cardinal : t -> int
  val print :
    ?first:(unit, Format.formatter, unit) format ->
    ?sep:(unit, Format.formatter, unit) format ->
    ?last:(unit, Format.formatter, unit) format ->
    ?firstbind:(unit, Format.formatter, unit) format ->
    ?sepbind:(unit, Format.formatter, unit) format ->
    ?lastbind:(unit, Format.formatter, unit) format ->
    (Format.formatter -> x -> unit) ->
    (Format.formatter -> y -> unit) ->
    Format.formatter -> t -> unit
end

(** Functor building an implementation of the DHashtbl structure
   given two hashtables *)
module Make(P : Param) = struct
  module HashX = P.HashX
  module HashY = P.HashY
  type x = HashX.key
  type y = HashY.key
  type t = {
    xy : y HashX.t;
    yx : x HashY.t
  }
  let hashx t = t.xy
  let hashy t = t.yx
  let clear t =
    HashX.clear t.xy;
    HashY.clear t.yx;
    ()
  let reset t =
    HashX.reset t.xy;
    HashY.reset t.yx;
    ()

  let create size = { xy = HashX.create size; yx = HashY.create size }
  let add t x y =
    HashX.replace t.xy x y;
    HashY.replace t.yx y x
  let y_of_x t x = HashX.find t.xy x
  let x_of_y t y = HashY.find t.yx y
  let removex t x =
    let y = y_of_x t x in
    HashX.remove t.xy x;
    HashY.remove t.yx y
  let removey t y =
    let x = x_of_y t y in
    HashX.remove t.xy x;
    HashY.remove t.yx y

  let memx t x = HashX.mem t.xy x
  let memy t y = HashY.mem t.yx y
  let iter t f = HashX.iter f t.xy
  let fold t v f = HashX.fold f t.xy v
  let cardinal t = HashX.fold (fun x y res -> res+1) t.xy 0
  let print
    ?(first : (unit, Format.formatter, unit) format option)
    ?(sep : (unit, Format.formatter, unit) format option)
    ?(last : (unit, Format.formatter, unit) format option)
    ?(firstbind : (unit, Format.formatter, unit) format option)
    ?(sepbind : (unit, Format.formatter, unit) format = (" <=> ":(unit, Format.formatter, unit) format))
    ?(lastbind : (unit, Format.formatter, unit) format option)
    px py fmt t
    =
    let (hash:(x,y) Hashhe.t) = Obj.magic t.xy in
    Hashhe.print ?first ?sep ?last ?firstbind ~sepbind ?lastbind
    px py
    fmt hash

end

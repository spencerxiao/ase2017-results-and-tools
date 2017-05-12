(** Two-way map between two ordered data types *)

(** The type of two-way maps *)
type ('a,'b) map = {
  xy : ('a,'b) Mappe.t;
  yx : ('b,'a) Mappe.t
}
type ('a,'b) t = ('a,'b) map

let mapx t = t.xy
let mapy t = t.yx
let is_empty t = Mappe.is_empty t.xy
let empty = { xy = Mappe.empty; yx = Mappe.empty }
let add x y t = {
  xy = Mappe.add x y t.xy;
  yx = Mappe.add y x t.yx
}
let y_of_x x t = Mappe.find x t.xy
let x_of_y y t =  Mappe.find y t.yx
let remove x t = {
  xy = Mappe.remove x t.xy;
  yx = Mappe.remove (y_of_x x t) t.yx
}
let memx x t = Mappe.mem x t.xy
let memy y t = Mappe.mem y t.yx
let merge t1 t2 = {
  xy =
  Mappe.merge
    (fun y1 y2 -> if y1=y2 then y1 else failwith "DMappe.merge: incompatible (x,y) bindings")
    t1.xy t2.xy
  ;
  yx =
  Mappe.merge
    (fun x1 x2 -> if x1=x2 then x1 else failwith "DMappe.merge: incompatible (y,x) bindings")
    t1.yx t2.yx
  ;
}
let common t1 t2 = {
  xy =
  Mappe.common
    (fun y1 y2 -> if y1=y2 then y1 else failwith "DMappe.common: incompatible (x,y) bindings")
    t1.xy t2.xy
  ;
  yx =
  Mappe.common
    (fun x1 x2 -> if x1=x2 then x1 else failwith "DMappe.common: incompatible (y,x) bindings")
    t1.yx t2.yx
  ;
}
let intersetx t setx = {
  xy = Mappe.interset t.xy setx;
  yx = Mappe.filter (fun y x -> Sette.mem x setx) t.yx
}
let intersety t sety = {
  xy = Mappe.filter (fun x y -> Sette.mem y sety) t.xy;
  yx = Mappe.interset t.yx sety;
}
let diffsetx t setx = {
  xy = Mappe.diffset t.xy setx;
  yx = Mappe.filter (fun y x -> not (Sette.mem x setx)) t.yx
}
let diffsety t sety = {
  xy = Mappe.filter (fun x y -> not (Sette.mem y sety)) t.xy;
  yx = Mappe.diffset t.yx sety;
}
let iter f t = Mappe.iter f t.xy
let fold f t v = Mappe.fold f t.xy v
let setx t = Mappe.maptoset t.xy
let sety t = Mappe.maptoset t.yx
let equalx t1 t2 = t1==t2 || Mappe.equal (=) t1.xy t2.xy
let equaly t1 t2 = t1==t2 || Mappe.equal (=) t1.yx t2.yx
let subsetx t1 t2 = t1==t2 || Mappe.subset (=) t1.xy t2.xy
let subsety t1 t2 = t1==t2 || Mappe.subset (=) t1.yx t2.yx
let cardinal t = Mappe.cardinal t.xy
let print ?first ?sep ?last ?firstbind ?(sepbind=(" <=> ":(unit, Format.formatter, unit) format)) ?lastbind px py fmt t =
  Mappe.print
    ?first ?sep ?last
    ?firstbind ~sepbind ?lastbind
    px py fmt t.xy

(** Input signature of the functor {!DMappe.Make}. *)
module type Param = sig
  module MappeX : Mappe.S
  module MappeY : Mappe.S
end

(** Output signature of the functor {!DMappe.Make}. *)
module type S = sig
  module MappeX : Mappe.S
  module MappeY : Mappe.S
  type x = MappeX.key
  type y = MappeY.key
  type t

  val mapx : t -> y MappeX.t
  val mapy : t -> x MappeY.t
  val is_empty : t -> bool
  val empty : t
  val add : x -> y -> t -> t
  val y_of_x : x -> t -> y
  val x_of_y : y -> t -> x
  val remove : x -> t -> t
  val memx : x -> t -> bool
  val memy : y -> t -> bool
  val merge : t -> t -> t
  val common : t -> t -> t
  val intersetx : t -> MappeX.Setkey.t -> t
  val intersety : t -> MappeY.Setkey.t -> t
  val diffsetx : t -> MappeX.Setkey.t -> t
  val diffsety : t -> MappeY.Setkey.t -> t
  val iter : (x -> y -> unit) -> t -> unit
  val fold : (x -> y -> 'c -> 'c) -> t -> 'c -> 'c
  val setx : t -> MappeX.Setkey.t
  val sety : t -> MappeY.Setkey.t
  val equalx : t -> t -> bool
  val equaly : t -> t -> bool
  val subsetx : t -> t -> bool
  val subsety : t -> t -> bool
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

(** Functor building an implementation of the DMappe structure
   given two map structures. *)
module Make(P : Param) = struct
  module MappeX = P.MappeX
  module MappeY = P.MappeY
  type x = MappeX.key
  type y = MappeY.key
  type t = {
    xy : y MappeX.t;
    yx : x MappeY.t
  }
  let mapx t = t.xy
  let mapy t = t.yx
  let is_empty t = MappeX.is_empty t.xy
  let empty = { xy = MappeX.empty; yx = MappeY.empty }
  let add x y t = {
    xy = MappeX.add x y t.xy;
    yx = MappeY.add y x t.yx;
  }
  let y_of_x x t = MappeX.find x t.xy
  let x_of_y y t = MappeY.find y t.yx
  let remove x t = {
    xy = MappeX.remove x t.xy;
    yx = MappeY.remove (y_of_x x t) t.yx
  }
  let memx x t = MappeX.mem x t.xy
  let memy y t = MappeY.mem y t.yx
  let merge t1 t2 = {
    xy =
    MappeX.merge
      (fun y1 y2 -> if (MappeY.Setkey.Ord.compare y1 y2)=0 then y1 else failwith "DMappe.merge: incompatible (x,y) bindings")
      t1.xy t2.xy
    ;
    yx =
    MappeY.merge
      (fun x1 x2 -> if (MappeX.Setkey.Ord.compare x1 x2)=0 then x1 else failwith "DMappe.merge: incompatible (y,x) bindings")
      t1.yx t2.yx
    ;
  }
  let common t1 t2 = {
    xy =
    MappeX.common
      (fun y1 y2 -> if (MappeY.Setkey.Ord.compare y1 y2)=0 then y1 else failwith "DMappe.common: incompatible (x,y) bindings")
      t1.xy t2.xy
    ;
    yx =
    MappeY.common
      (fun x1 x2 -> if (MappeX.Setkey.Ord.compare x1 x2)=0 then x1 else failwith "DMappe.common: incompatible (y,x) bindings")
      t1.yx t2.yx
    ;
  }
  let intersetx t setx = {
    xy = MappeX.interset t.xy setx;
    yx = MappeY.filter (fun y x -> MappeX.Setkey.mem x setx) t.yx
  }
  let intersety t sety = {
    xy = MappeX.filter (fun x y -> MappeY.Setkey.mem y sety) t.xy;
    yx = MappeY.interset t.yx sety;
  }
  let diffsetx t setx = {
    xy = MappeX.diffset t.xy setx;
    yx = MappeY.filter (fun y x -> not (MappeX.Setkey.mem x setx)) t.yx
  }
  let diffsety t sety = {
    xy = MappeX.filter (fun x y -> not (MappeY.Setkey.mem y sety)) t.xy;
    yx = MappeY.diffset t.yx sety;
  }
  let iter f t = MappeX.iter f t.xy
  let fold f t v = MappeX.fold f t.xy v
  let setx t = MappeX.maptoset t.xy
  let sety t = MappeY.maptoset t.yx
  let equalx t1 t2 = t1==t2 || MappeX.equal (fun y1 y2 -> (MappeY.Setkey.Ord.compare y1 y2 = 0)) t1.xy t2.xy
  let equaly t1 t2 = t1==t2 || MappeY.equal (fun x1 x2 -> (MappeX.Setkey.Ord.compare x1 x2 = 0)) t1.yx t2.yx
  let subsetx t1 t2 = t1==t2 || MappeX.subset (fun y1 y2 -> (MappeY.Setkey.Ord.compare y1 y2 = 0)) t1.xy t2.xy
  let subsety t1 t2 = t1==t2 || MappeY.subset (fun x1 x2 -> (MappeX.Setkey.Ord.compare x1 x2 = 0)) t1.yx t2.yx
  let cardinal t = MappeX.cardinal t.xy
  let print ?first ?sep ?last ?firstbind ?(sepbind = (" <=> ":(unit, Format.formatter, unit) format)) ?lastbind px py fmt t =
    MappeX.print ?first ?sep ?last ?firstbind ~sepbind ?lastbind px py fmt t.xy
end

(** Two-way map between two ordered data types, parametrized polymorphic version  *)

type ('a,'b) t = {
  xy : ('a,'b) PMappe.t;
  yx : ('b,'a) PMappe.t
}
let mapx t = t.xy
let mapy t = t.yx
let is_empty t = PMappe.is_empty t.xy
let empty cmpx cmpy = { xy = PMappe.empty cmpx; yx = PMappe.empty cmpy }
let add x y t = {
  xy = PMappe.add x y t.xy;
  yx = PMappe.add y x t.yx
}
let y_of_x x t = PMappe.find x t.xy
let x_of_y y t =  PMappe.find y t.yx
let removex x t = {
  xy = PMappe.remove x t.xy;
  yx = PMappe.remove (y_of_x x t) t.yx
}
let removey y t = {
  xy = PMappe.remove (x_of_y y t) t.xy;
  yx = PMappe.remove y t.yx
}
let remove = removex
let memx x t = PMappe.mem x t.xy
let memy y t = PMappe.mem y t.yx
let merge t1 t2 = {
  xy =
    PMappe.merge
      (fun y1 y2 -> if y1=y2 then y1 else failwith "DPMappe.merge: incompatible (x,y) bindings")
      t1.xy t2.xy
  ;
  yx =
    PMappe.merge
      (fun x1 x2 -> if x1=x2 then x1 else failwith "DPMappe.merge: incompatible (y,x) bindings")
      t1.yx t2.yx
  ;
}
let common t1 t2 = {
  xy =
    PMappe.common
      (fun y1 y2 -> if y1=y2 then y1 else failwith "DPMappe.common: incompatible (x,y) bindings")
      t1.xy t2.xy
  ;
  yx =
    PMappe.common
      (fun x1 x2 -> if x1=x2 then x1 else failwith "DPMappe.common: incompatible (y,x) bindings")
      t1.yx t2.yx
  ;
}
let intersetx t setx = {
  xy = PMappe.interset t.xy setx;
  yx = PMappe.filter (fun y x -> PSette.mem x setx) t.yx
}
let intersety t sety = {
  xy = PMappe.filter (fun x y -> PSette.mem y sety) t.xy;
  yx = PMappe.interset t.yx sety;
}
let diffsetx t setx = {
  xy = PMappe.diffset t.xy setx;
  yx = PMappe.filter (fun y x -> not (PSette.mem x setx)) t.yx
}
let diffsety t sety = {
  xy = PMappe.filter (fun x y -> not (PSette.mem y sety)) t.xy;
  yx = PMappe.diffset t.yx sety;
}
let iter f t = PMappe.iter f t.xy
let fold f t v = PMappe.fold f t.xy v
let setx t = PMappe.maptoset t.xy
let sety t = PMappe.maptoset t.yx
let equalx t1 t2 = t1==t2 || PMappe.equal (=) t1.xy t2.xy
let equaly t1 t2 = t1==t2 || PMappe.equal (=) t1.yx t2.yx
let subsetx t1 t2 = t1==t2 || PMappe.subset (=) t1.xy t2.xy
let subsety t1 t2 = t1==t2 || PMappe.subset (=) t1.yx t2.yx
let cardinal t = PMappe.cardinal t.xy
let print ?first ?sep ?last ?firstbind ?(sepbind=(" <=> ":(unit, Format.formatter, unit) format)) ?lastbind px py fmt t =
  PMappe.print
    ?first ?sep ?last
    ?firstbind ~sepbind ?lastbind
    px py fmt t.xy

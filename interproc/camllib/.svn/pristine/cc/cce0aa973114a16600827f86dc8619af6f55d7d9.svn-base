(** Two-way hashtable between two data types, parametrized polymorpphic version *)

type ('a,'b) t = {
  xy : ('a,'b) PHashhe.t;
  yx : ('b,'a) PHashhe.t
}
let hashx t = t.xy
let hashy t = t.yx
  
let clear t =
  PHashhe.clear t.xy;
  PHashhe.clear t.yx;
  ()
    
let create_compare cmpx cmpy size = {
  xy = PHashhe.create_compare cmpx size; 
  yx = PHashhe.create_compare cmpy size
}
let create hashx eqx hashy eqy size = { 
  xy = PHashhe.create hashx eqx size; 
  yx = PHashhe.create hashy eqy size
}
let add t x y =
  PHashhe.replace t.xy x y;
  PHashhe.replace t.yx y x

let y_of_x t x = PHashhe.find t.xy x
let x_of_y t y = PHashhe.find t.yx y
let removex t x =
  let y = y_of_x t x in
  PHashhe.remove t.xy x;
  PHashhe.remove t.yx y
let removey t y =
  let x = x_of_y t y in
  PHashhe.remove t.xy x;
  PHashhe.remove t.yx y
    
let memx t x = PHashhe.mem t.xy x
let memy t y = PHashhe.mem t.yx y
let iter t f = PHashhe.iter f t.xy
let fold t v f = PHashhe.fold f t.xy v
let cardinal t = PHashhe.fold (fun x y res -> res+1) t.xy 0
let print
    ?(first : (unit, Format.formatter, unit) format = ("[@[<hv>" : (unit, Format.formatter, unit) format))
    ?(sep : (unit, Format.formatter, unit) format = (";@ ":(unit, Format.formatter, unit) format))
    ?(last : (unit, Format.formatter, unit) format = ("@]]":(unit, Format.formatter, unit) format))
    ?(firstbind : (unit, Format.formatter, unit) format = ("" : (unit, Format.formatter, unit) format))
    ?(sepbind : (unit, Format.formatter, unit) format = (" => ":(unit, Format.formatter, unit) format))
    ?(lastbind : (unit, Format.formatter, unit) format = ("":(unit, Format.formatter, unit) format))
    px py fmt t
    =
  PHashhe.print ~first ~sep ~last ~firstbind ~sepbind ~lastbind
    px py
    fmt t.xy


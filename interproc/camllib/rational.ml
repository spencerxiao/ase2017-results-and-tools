(** Rational numbers *)

type t = {
  num : int;
  den : int
}

let gcd (x:int) (y:int) : int 
  =
  (* we assume a>=b *)
  let rec gcd (a:int) (b:int) : int
    =
    if (a<>b && b<>0) then
      gcd b (a mod b)
    else
      a
  in
  if x>y then gcd x y else gcd y x

let make (num:int) (den:int) : t =
  let (num,den) = 
    if den=0 then raise (Invalid_argument "Rational.make: zero denominator")
    else if den<0 then (-num,-den) 
    else (num,den)
  in
  let g = gcd (abs num) den in
  { num = num/g; den = den/g }
  
let to_string t =
  if t.den=1 then 
    string_of_int t.num 
  else
    Format.sprintf "%i/%i" t.num t.den

let print fmt t = 
  Format.pp_print_string fmt (to_string t)


let inv (x:t) : t =
  if x.num=0 then raise (Invalid_argument "Rational.inv: zero numerator")
  else if x.num < 0 then { num = -x.den; den = -x.num }
  else { num = x.den; den = x.num }

let neg (x:t) : t =
  { num = -x.num; den = x.den }

let add (x:t) (y:t) : t =
  let g = gcd x.den y.den in
  let p = (x.den / g) * y.den in
  let den = p in
  let num = x.num * (y.den / g) + y.num * (x.den / g) in
  make num den

let sub (x:t) (y:t) : t =
  let g = gcd x.den y.den in
  let p = (x.den / g) * y.den in
  let den = p in
  let num = x.num * (y.den / g) - y.num * (x.den / g) in
  make num den
    
let mul (x:t) (y:t) : t =
  let gx = gcd x.num y.den 
  and gy = gcd y.num x.den
  in {
    num = (x.num/gx) * (y.num/gy);
    den = (x.den/gy) * (y.den/gx)
  }

let div (x:t) (y:t) : t =
  mul x (inv y)

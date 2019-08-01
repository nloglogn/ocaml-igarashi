(* 1 *)
let geo_mean (x,y) = sqrt (x *. y);;

(* 2 *)
let bmi (name, height, weight) =
  let index = weight /. ((height /. 100.0) ** 2.0) in
  if index < 18.5 then name ^ "さんはやせています"
  else if index < 25.0 then name ^ "さんは標準です"
  else if index < 30.0 then name ^ "さんは肥満です"
  else name ^ "さんは高度肥満です";;

(* 3 *)
let f (x,y) = ((x + y)/2, (x - y)/2);;
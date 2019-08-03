(* 1 *)
let pow (x, n) =
  let rec iter (x, y, n) =
    if n = 0 then 1
    else iter (x, y * x, n - 1)
  in
  iter (x, 1, n);;

(* 2 *)
let pow2 (x, n) =
  let rec iter (x, y, n) =
    if n = 0 then y
    else if n mod 2 = 0 then
        iter (x * x, y, n / 2)
      else iter (x, y * x, n - 1)
  in
  iter(x, 1, n);;
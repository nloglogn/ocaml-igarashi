type arith =   Const of int | Add of arith * arith | Mul of arith * arith;;

let exp = Mul (Add (Const 3, Const 4), Add (Const 2, Const 5));;

let rec eval ar = match ar with
    Const a -> a
  | Add (ar1, ar2) -> (eval ar1) + (eval ar2)
  | Mul (ar1, ar2) -> (eval ar1) * (eval ar2);;

eval exp;;
type arith = Const of int | Add of arith * arith | Mul of arith * arith;;

let exp = Mul(Add (Add (Const 4, Const 6), Const 2), 
          Mul (Add (Const 3, Const 4), Add (Const 4, Add (Const 2, Const 5))));;

let rec string_of_arith ar = match ar with
    Const a -> string_of_int a
  | Add (Const a, Const b) -> (string_of_int a) ^ "+" ^ (string_of_int b)
  | Mul (Const a, Const b) -> (string_of_int a) ^ "*" ^ (string_of_int b)
  | Add (Const a, ar1) -> (string_of_int a) ^ "+" ^ (string_of_arith ar1)
  | Add (ar1, Const a) -> (string_of_arith ar1) ^ "+" ^ (string_of_int a)
  | Mul (Const a, ar1) -> (string_of_int a) ^ "*(" ^ (string_of_arith ar1) ^ ")"
  | Mul (ar1,Const a) -> "(" ^ (string_of_arith ar1) ^ ")*" ^ (string_of_int a)
  | Add (ar1, ar2) -> (string_of_arith ar1) ^ "+" ^ (string_of_arith ar2)
  | Mul (ar1, ar2) -> "(" ^ (string_of_arith ar1) ^ ")*(" ^ (string_of_arith ar2) ^ ")";;

string_of_arith exp;;

let rec expand ar = match ar with
    Mul (Add (ar1, ar2), ar3) -> Add(expand(Mul(expand(ar1),expand(ar3))), expand(Mul(expand(ar2),expand(ar3))))
    | Mul (ar1, Add (ar2, ar3)) -> Add(expand(Mul(expand(ar1),expand(ar2))), expand(Mul(expand(ar1),expand(ar3))))
    | Add (ar1, ar2) -> Add(expand(ar1), expand(ar2))
    | Mul (ar1, ar2) -> Mul(expand(ar1), expand(ar2))
    | ar1 -> ar1;;
 
expand exp;;

string_of_arith(expand exp)

(* 改良の余地あり。 *)
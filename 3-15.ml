(* int -> int -> int -> int -> は、
  int -> (int -> (int -> int)) の意味。
  たとえば、直方体の体積を求める関数 *)
let taiseki tate yoko takasa = tate * yoko * takasa;;

(* (int -> int) -> int -> int -> は、
  (int -> int) -> (int -> int)) の意味。
  たとえば、関数の値と引数を1シフトする関数 *)
let shift f = fun x -> f(x-1) + 1;;

(* (int -> int -> int) -> int -> は、
  (int -> (int -> int)) -> int) の意味。
  たとえば、2つの引数に0を代入し、値を2倍する関数 *)
let zero_bai f = 2 * f 0 0;;
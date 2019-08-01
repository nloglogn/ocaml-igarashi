(* 1 *)
(* 予想：中置演算子 *- が束縛されていない。*)
(* 結果：Error: Unbound value *- *)

(* 2 *)
(* 予想：0xfg は16進数の数字を表していない。例外を発生する。 *)
(* 結果：Exception: Failure "int_of_string". *)

(* 3 *)
(* 予想：関数 - : int -> int がint_of_float の引数と解釈される。型エラー *)
(* 結果：Error: This expression has type float -> int
       but an expression was expected of type int *)

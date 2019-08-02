(* OCamlの evaluation strategy は call-by-value であり、
 * 式の内側の式が最初に評価される。
 * したがって、例えば *)

let cond (b,e1,e2): int = if b then e1 else e2;;
let rec fact n = cond((n = 1), 1, n * fact (n - 1));;
fact 4;;

(* とすると、condのなかの式 fact(4-1) -> fact(3) が先に評価される。
 * すると、さらにcondが展開され、その中の fact(3 - 1) -> fact(2)が評価される。
 * この繰り返しが、n = 1 の場合の評価を素通りして無限に行われてしまうので、
 * Stack overflow エラーが出る。
 * if文ではなくて、condという関数になっているところがミソ。 *)

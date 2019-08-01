(* 1 *)
let x = 1 in let x = 3 in let x = x + 2 in x * x;;
(* x + 2 の x は 宣言 x = 3  を参照している。
 * x * x の x は 宣言 x = x + 2 を参照している。
 * 出力結果は、x = 1 と束縛したときの let x = 3 in let x = x + 2 in x * x
 * すなわち、 x = 3 と束縛したときの let x = x + 2 in x * x
 * すなわち、 x = 3 + 2 = 5 と束縛したときの x * x = 25. *)

(* 2 *)
let x = 2 and y = 3 in (let y = x and x = y + 2 in x * y) + y;;
(* y = x and x = y + 2 の x,y は x = 2 and y = 3 を参照している。
 * x * y は y = x and x = y + 2 の左辺を参照している。
 * 出力結果は、 x = 2, y = 3 と束縛したときの (let y = x and x = y + 2 in x * y) + y
 * すなわち、(y = 2, x = 3 + 2 = 5 と束縛したときの x * y) + 3
 * すなわち、5 * 2 + 3 = 13. *)

(* 3 *)
let x = 2 in let y = 3 in let y = x in let z = y + 2 in x * y * z;;
(* y = x は x = 2 を参照している。
 * z = y + 2 は y = x を参照している。
 * x * y * z は x = 2 と y = x と z = y + 2 を参照している。
 * 出力結果は、 x = 2 と束縛したときの let y = 3 in let y = x in let z = y + 2 in x * y * z
 * すなわち、 y = 3 と束縛したときの let y = 2 in let z = y + 2 in 2 * y * z)
 * すなわち、 y = 2 と束縛したときの let z = y + 2 in 2 * y * z
 * すなわち、 z = 2 + 2 = 4 と束縛したときの 2 * 2 * z = 2 * 2 * 4 = 16. *)
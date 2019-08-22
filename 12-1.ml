class calc = 
  object
    val mutable num = 0
    val mutable func = fun x -> x

    method input n = num <- n
    method plus = func <- (fun y -> num + y)
    method eq = func num
end;;

let c = new calc;;
c#input 4; c#plus; c#input 6; c#eq;;

(*
以上のコードを実行すると、
- : int = 12
と出力され、望んでいた答え10は得られない。
これは、plusメソッドによってfuncがfun y -> num + yに変えられたので、
c#input 6としてnumの値が6に変わるとfuncがfun y -> 6 + yになる。
funcの中身は変更可能なnumではなく、その時点の値で固定しなければならない。
*)
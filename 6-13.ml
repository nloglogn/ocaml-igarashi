type intseq = Cons of int * (int -> intseq)

let rec nthseq n (Cons(x, f)) =
  if n = 1 then x
  else nthseq (n-1) (f x);;

let rec fib1 x y = let fib2 x y = Cons(x, fib1 y) in Cons(x+y, fib2 x);;

let rec fib_n n =
    if n = 1 then let Cons(a1,f1) = fib1 1 0 in f1 a1
    else let Cons(a1,f1) = (fib_n (n-1)) in let Cons(a2,f2) = f1 a1 in f2 a2;;

fib_n 10;;

(* ↑副産物。せっかくなので残しておく *)

let rec fib3 x y = Cons(x, fib3 (x+y));;

let fib = fib3 1 0;;

nthseq 10 fib;;
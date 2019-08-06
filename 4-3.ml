(* funny には、関数f: 'a -> 'a に対して f∘f∘ … ∘ f (fはn個) を返す役割がある。
たとえば、repeatは次のようにも実装できる *)

let id x = x;;
let ($) f g x = f (g x);;

let rec funny f n = 
  if n = 0 then id
  else if n mod 2 == 0 then funny (f $ f) (n / 2)
  else funny (f $ f) (n / 2) $ f;;

let rec repeat f n x =
  (funny f n) x;;

  let fib n =
    let (fibn, _) =
      let iter_fib (x, y) = (x + y, x)
      in repeat iter_fib n (1,0)
  in fibn;;
let rec repeat f n x =
  if n > 0 then repeat f (n-1) (f x) else x;;

  let fib n =
    let (fibn, _) =
      let iter_fib (x, y) = (x + y, x)
      in repeat iter_fib n (1,0)
  in fibn;;
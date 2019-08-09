let squares r =
    let is_square n =
      let m = int_of_float (sqrt (float_of_int n) +. 0.5)
      in m * m = n
  in
    let rec sq r x ans =
      match x with
      | x when x * x > r - x * x -> ans
      | x ->
          if is_square (r - x * x) 
              then sq r (x+1) ((x,int_of_float (sqrt (float_of_int (r - x * x)) +. 0.5))::ans)
              else sq r (x+1) ans
  in sq r 0 [];;

squares 48612265;;


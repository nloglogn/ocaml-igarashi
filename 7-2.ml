exception Zeroprod

let prod_list l =
  let rec prod' = function
    [] -> 1
  | x :: rest -> if x = 0 then raise Zeroprod
                 else x * prod' rest
  in try prod' l with Zeroprod -> 0;;

  prod_list [1;2;3;4;5;6];;

  prod_list [1;2;3;0;5;6];;
exception Failure of string;;

let rec change coins amount =
  match (coins, amount) with
    (_,0) -> []
  | ((c::rest) as coins, total) -> 
      if c > total then change rest total
      else
        (try
          c :: change coins (total - c)
          with (Failure "change") -> change rest total)
  | _ -> raise (Failure "change");;

let us_coins = [25; 10; 5; 1];;
let gb_coins = [50; 20; 10; 5; 2; 1];;

change gb_coins 43;;
change us_coins 43;;

change [5; 2] 16;;


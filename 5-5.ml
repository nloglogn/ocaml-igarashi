let rec fold_right f l e = 
  match l with
  [] -> e
| x :: rest -> f x (fold_right f rest e);;

let rec map f = function
    [] -> []
  | x :: rest -> f x :: map f rest;;

let concat l = fold_right (@) l [];;
concat [[0; 3; 4]; [2]; []; [5; 0]]

let forall p l = fold_right (&&) (map p l) true ;;
forall (fun x -> x >= 5) [9; 20; 5];;
forall (fun x -> x >= 5) [6; 3; 9];;

let exists p l = fold_right (||) (map p l) false;;
exists (fun x -> (x mod 7) = 0) [23; -98; 19; 53];;
exists (fun x -> (x mod 7) = 0) [1*7+1; 24*7+2; 765*7+3; 9233*7+4];;
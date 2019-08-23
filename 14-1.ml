let l1 = `Cons (1, `Cons (2, `Nil));;
let l2 = `Cons (3, `Cons (4, `Nil));;

let rec append_list l1 l2 = match l1 with
    `Nil -> l2
  | `Cons(x, l) -> `Cons(x, append_list l l2);;

append_list l1 l2;;

let rec map_list f = function
    `Nil -> `Nil
  | `Cons(x,l) -> `Cons(f x, map_list f l);;

map_list (fun x -> x * x) l1;;
map_list (fun x -> x * x) l2;;

let downto1_list n =
  let rec iter n m acc =
    if n < m then acc
    else iter n (m+1) (`Cons(m,acc))
  in iter n 1 `Nil;;

downto1_list 6;;
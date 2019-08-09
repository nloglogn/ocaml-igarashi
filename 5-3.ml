(* 1 *)
let rec mem a s =
  match s with
    [] -> false
  | x :: rest -> if x = a then true
    else mem a rest;;


(* 2 *)
let rec intersect s1 s2 =
  match s1 with
    [] -> []
  | x :: rest -> if mem x s2 then x :: (intersect rest s2)
    else intersect rest s2;;

(* 3 *)
let rec union s1 s2 =
  match s1 with
    [] -> s2
  | x :: rest -> if mem x s2 then union rest s2
    else x :: (union rest s2);;

(* 4 *)
let rec diff s1 s2 =
  match s1 with
    [] -> []
  | x :: rest -> if mem x s2 then diff rest s2
    else x :: (diff rest s2);;
let find x l = 
  let rec find' = function
      [] -> raise Not_found
    | a :: l when a = x -> Some 1
    | _ :: l -> match find' l with Some a -> Some(1+a)
  in try find' l with Not_found -> None;;

find 7 [0; 8; 7; 3];;
find 9 [0; 8; 7; 3];;
let rec append_list l1 l2 = match l1 with
    `Nil -> l2
  | `Cons(x, l) -> `Cons(x, append_list l l2);;

let rec list_of_alist = function
    `Nil -> `Nil
  | `Cons(a,l) -> `Cons(a,list_of_alist l)
  | `App (l1, l2) -> append_list (list_of_alist l1) (list_of_alist l2);;

let l1 = `Cons(1, `Nil)
and l2 = `Cons(2,`Cons(1,`Nil));;
let l3 = `Cons(1, `App(l1, l2));;

list_of_alist l3;;
(* type 'a tree = Lf | Br of 'a * 'a tree * 'a tree;; *)

let comptree' n =
      let rec maketree x n = 
            if n = 0 then Lf
            else Br (x, maketree (x*2) (n-1), maketree (x*2+1) (n-1))
      in maketree 1 n;;

let comptree = comptree' 3;;

let rec reflect = function
            Lf -> Lf
      |     Br(x, left, right) -> Br(x, reflect right, reflect left);;

reflect comptree;;

(* 後半：
      preorder(reflect(t)) = reverse(postorder(t))
      inorder(reflect(t)) = reverse(inorder(t))
      postorder(reflect(t)) = reverse(preorder(t))
*)


type 'a tree = Lf | Br of 'a * 'a tree * 'a tree;;

let comptree' n =
      let rec maketree x n = 
            if n = 0 then Lf
            else Br (x, maketree (x*2) (n-1), maketree (x*2+1) (n-1))
      in maketree 1 n;;

let comptree = comptree' 3;;


let rec preord t l = 
      match t with
            Lf -> l
      |     Br(x,left, right) -> x :: (preord left (preord right l));;

let rec inord t l =
      match t with
            Lf -> l
      | Br(x, left, right) -> inord left (x :: (inord right l));;

inord comptree [];;

let rec postord t l =
      match t with
            Lf -> l
      | Br(x, left, right) -> postord left ((postord right (x::l)));;

postord comptree [];;
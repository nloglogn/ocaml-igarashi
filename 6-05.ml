type 'a tree = Lf | Br of 'a * 'a tree * 'a tree;;

let rec comptree x n =
      if n = 0 then Lf
      else  Br (x, comptree x (n-1), comptree x (n-1));;

comptree "a" 3;;

let comptree' n =
      let rec maketree x n = 
            if n = 0 then Lf
            else Br (x, maketree (x*2) (n-1), maketree (x*2+1) (n-1))
      in maketree 1 n;;

comptree' 3;;
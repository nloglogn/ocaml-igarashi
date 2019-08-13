type nat = Zero | OneMoreThan of nat;;

let rec add m n =
      match m with
            Zero -> n
      |     OneMoreThan m' -> OneMoreThan (add m' n);;

let rec mul m n =
      match m with
            Zero -> Zero
      |     OneMoreThan m' -> add (mul m' n) n;;

let monus m n =
      let rec monus_x m n k =
            match n with
                        Zero -> k
                  |     OneMoreThan n' ->
                  match m with
                        Zero -> Zero
                  |     OneMoreThan m' -> monus_x m' n' (OneMoreThan k)
      in monus_x m n Zero;;

type nat = Zero | OneMoreThan of nat;;

let minus m n =
      let rec minus_x m n k =
            match n with
                        Zero -> Some k
                  |     OneMoreThan n' ->
                  match m with
                        Zero -> None
                  |     OneMoreThan m' -> minus_x m' n' (OneMoreThan k)
      in minus_x m n Zero;;

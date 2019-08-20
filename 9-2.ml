module type TABLE2 = 
    sig
        type ('a, 'b) t 
        val empty : ('a, 'b) t
        val add : 'a -> 'b -> ('a, 'b) t -> ('a, 'b) t
        val retrieve : 'a -> ('a, 'b) t -> 'b option
        val dump : ('a, 'b) t -> ('a * 'b) list
    end;;

module TableTree : TABLE2 = 
  struct
    type ('a, 'b) t = Lf | Br of 'a * 'b *  ('a , 'b) t * ('a , 'b) t

    let empty = Lf

    let rec add key datum t =
      match t with
          Lf -> Br (key, datum, Lf, Lf)
        | Br (y, datum', left, right) when key = y -> Br(key, datum, left, right)
        | Br (y, datum', left, right) when key < y -> Br(y, datum', add key datum left, right)
        | Br (y, datum', left, right) -> Br(y, datum', left, add key datum right)

    let rec retrieve key t =
      match t with
          Lf -> None
        | Br(y, datum, left, right) ->
            if key = y then Some datum
            else if key < y then retrieve key left else retrieve key right

    let dump t =
      let rec inord t l = match t with 
         Lf -> l
      | Br(x, datum, left, right) -> inord left ((x, datum) :: (inord right l))
      in
      inord t []
    end;;
  
  let ( <<< ) table (key, content) = TableTree.add key content table;;

  let table = TableTree.empty
    <<< ("a", "the first letter of the English alphabet")
    <<< ("b", "the second letter of the English alphabet")
    <<< ("zzz", "sleeping noise");;
  
  TableTree.retrieve "a" table;;
  
  let table' = table <<< ("a", "an indefinite article");;
  
  TableTree.retrieve "a" table';;
  TableTree.retrieve "b" table';;
  TableTree.retrieve "zzz" table';;
  
  TableTree.dump table';;


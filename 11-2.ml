module type OrderedType =
  sig
    type t
    val compare : t -> t -> int
  end;;

  module type SET = 
  sig
    type elt
    type t
    val empty : t
    val mem : elt -> t -> bool
    val add : elt -> t -> t
    val inter : t -> t -> t
    val union : t -> t -> t
    val diff : t -> t -> t
    val elements : t -> elt list 
  end;;


module MakeAbstractSet (Order : OrderedType) : SET with type elt = Order.t
=
    struct
      type elt = Order.t
      type t = elt list

      let empty = []

      let rec mem elt = function
          [] -> false
        | x :: rest ->
          let r = Order.compare elt x in
          (r = 0) || ((r < 0) && mem x rest)
      
      let rec add elt = function
          [] -> [elt]
        | (x :: rest as s) ->
            match Order.compare elt x with
              0 -> s
            | r when r < 0 -> elt :: s
            | _ -> x :: (add elt rest)
    
      let rec inter s1 s2 =
        match (s1, s2) with
            (s1, []) -> []
          | ([], s2) -> []
          | ((e1::rest1 as s1), (e2::rest2 as s2)) ->
            match Order.compare e1 e2 with
                0 -> e1 :: inter rest1 rest2
              | r when r < 0 -> inter rest1 s2
              | _ -> inter s1 rest2

      let rec union s1 s2 = 
        match (s1, s2) with
            (s1,[]) -> s1
          | ([],s2) -> s2
          | ((e1::rest1 as s1), (e2::rest2 as s2)) ->
            match Order.compare e1 e2 with
                0 -> e1 :: union rest1 rest2
              | r when r < 0 -> e1 :: union rest1 s2
              | _ -> e2 :: union s1 rest2
              
      let rec diff s1 s2 =
        match (s1,s2) with
            (s1,[]) -> s1
          | ([],s2) -> []
          | ((e1::rest1 as s1), (e2::rest2 as s2)) ->
            match Order.compare e1 e2 with
                0 -> diff rest1 rest2
              | r when r < 0 -> e1 :: diff rest1 s2
              | _ -> diff s1 rest2

      let rec elements s = s
      end;;


  module AbstractIntSet = MakeAbstractSet (
    struct
      type t = int
      let compare i j = i - j
    end);;


open AbstractIntSet;;

let s1 = add 5 ( add 4 (add 3 (add 2 (add 1 empty))))
and s2 = add 9 ( add 7 (add 5 (add 3 (add 1 empty))));;

(mem 1 s1, mem 2 s2);;

let s3 = inter s1 s2;;
let s4 = union s1 s2;;
let s5 = diff s1 s2;;
elements s3;;
elements s4;;
elements s5;;


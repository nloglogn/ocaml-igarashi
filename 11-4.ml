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


module MakeAbstractSet (Order : OrderedType) : SET
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

    module BadPair =
    struct
      module Elt =
        struct
          type t = int
          let compare i j = i - j
        end
      module Set = MakeAbstractSet(Elt)
    end;;

module type NaiveSig =
  sig
    module Elt : OrderedType
    module Set : SET with type elt = Elt.t
  end;;

module MakeTest (P) =
  struct
    let test_elements set =
      let rec loop = function
          [] | [_] -> true
        | x::y::rest ->
          if P.Elt.compare x y > 0 then false
          else loop (y::rest)
      in loop (P.Set.elements set)
    end;;

    (* Syntax Error が出る。
    99行目を module MakeTest (P: NaiveSig) とすればエラーは出ない。
    http://www.billies-works.com/web/ocaml-11-4/ を参考にした *)
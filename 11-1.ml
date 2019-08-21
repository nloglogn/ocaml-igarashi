(*
実行結果は次のようになる：
module IntSet' :
  sig
    type elt = OrderedInt'.t
    type t = elt list
    val empty : 'a list
    val mem : OrderedInt'.t -> OrderedInt'.t list -> bool
    val add : OrderedInt'.t -> OrderedInt'.t list -> OrderedInt'.t list
    val inter :
      OrderedInt'.t list -> OrderedInt'.t list -> OrderedInt'.t list
    val elements : 'a -> 'a
  end

elt の型 OrderedInt'.t が int に等しいという情報が伝わっていない。
この状態で、

open IntSet';;
let s1 = add 2 (add 1 empty)
and s2 = add 1 (add 3 empty);;

などとしても型エラーがおこる。

*)
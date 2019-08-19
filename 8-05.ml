(*
# let x = ref [];;
val x : '_a list ref = {contents = []}
# (2 :: !x, true :: !x);;
Error: This expression has type int list
       but an expression was expected of type bool list
       Type int is not compatible with type bool 

このようになった。
xの型は '_a list ref 、すなわち多相でない仮の型となっている。
したがって、2 :: !x を評価した時点でxの型は int list ref と定まるから、
bool型の true をリストに加えることはできない。
*)
(* 
1. 正しい。型は 'a list list
2. 誤り。前者は int list 型だが後者は string list 型だから
3. 正しい。型は int list list
4. 誤り。:: は右結合なので最初に [3] :: []が評価されて 2 :: [[3]] となるが、2は int list 型ではないから
5. 正しい。型は 'a list list
6. 正しい。型は (bool -> bool) list *)
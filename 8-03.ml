let f = ref (fun y -> y + 1) (* ここの関数は関係ない。int -> int の参照でさえあればよい *) 
let funny_fact x = if x = 1 then 1 else x * (!f (x - 1));; (* 再帰を使った定義における再帰部分をfに変えただけ *)
f := funny_fact;; (* funny_fact を f に代入することによって再帰的なコードが完成する *)
funny_fact 5;; (* あとは従来の fact と同じ *)
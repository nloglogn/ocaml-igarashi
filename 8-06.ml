
let rec fr variable n p body =
  let f = fun () -> (variable := n) in
  f();
  if !variable <= p then 
begin body(); fr variable (n+1) p body end;;

let rec fr_down variable n p body =
  let f = fun () -> (variable := p) in
  f();
  if !variable >= n then 
begin body(); fr variable n (p-1) body end;;



(* 三角数を求める *)
let f n = 
  let i = ref 1 and res = ref 0 in
  fr i 1 n (fun () -> res := !res + !i);
  !res;;

f 10;;
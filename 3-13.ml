(* powをカリー化を用いて定義 *)
let pow x n =
  let rec prod f n =
    if n = 0 then 1 else (prod f (n-1)) * f(n)
    in
    prod (fun y -> x) n;;

(* pow n x の形で定義して、cubeを部分適用によって定義 *)
let pow2 n x =
  let rec prod f n =
    if n = 0 then 1 else (prod f (n-1)) * f(n)
  in
  prod (fun y -> x) n;;

let cube2 x = pow2 3 x;;

(* pow x n で定義されているときのcubeの定義 *)
let cube x = (pow x) 3;;
let l1 = `Cons(1, `Nil)
and l2 = `Cons(2,`Cons(1,`Nil));;
let l3 = `Cons(1, `App(l1, l2));;

let make_max' f = function
    `Cons(x, `Nil) -> x
  | `Cons(x, `Cons(y,l)) -> 
        if x > y then f (`Cons(x,l)) else f (`Cons(y,l));;
let rec max' l = make_max' max' l;;

let make_amax f = function
    (`Cons(_,`Nil) | `Cons(_,`Cons(_,_))) as l -> make_max' f l
  | `Cons(x,`App(u,v)) -> max x (max (f u) (f v));;

let rec amax l = make_amax amax l;;

amax l3;;

let make_map f h = function
    `Nil -> `Nil
  | `Cons(x,l) -> `Cons(h x, f h l);;
let rec map f l = make_map map f l;;

let make_amap f h = function
    (`Nil|`Cons(_,`Nil)|`Cons(_,`Cons(_,_))) as l -> make_map f h l
  | `Cons(x,`App(l1,l2)) -> `Cons(h x, `App(f h l1, f h l2));;
let rec amap f l = make_amap amap f l;;

amap (fun x -> x * x * x + x) l3;;
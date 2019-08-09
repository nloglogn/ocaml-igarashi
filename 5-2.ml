(* 1 *)
let rec downto1 n =
  match n with 
    1 -> [1];
  | _ -> n :: downto1 (n-1);;

downto1 6;;

(* 2 *)
let rec roman romlist n =
  match romlist with
    [] -> ""
    | (x,y) :: rest when x <= n -> y ^ (roman ((x,y)::rest) (n - x))
    | (x,y) :: rest -> (roman rest n);;
  
roman [(1000,"M");(500,"D");(100,"C");(50,"L");(10,"X");(5,"V");(1,"I")] 1984;;
roman [(1000,"M");(900,"CM");(500,"D");(400,"CD");(100,"C");(90,"XC");(50,"L");(40,"XL");(10,"X");(9,"IX");(5,"V");(4,"IV");(1,"I")] 1984;;

(* 3 *)
let rec nested_length = function
     [] -> 0
  |  x :: rest -> let rec length = function
      [] -> 0
    | _ :: rest -> 1 + length rest in
      (length x) + nested_length rest;;

nested_length [[1; 2; 3]; [4; 5]; [6]; [7; 8; 9; 10]];;

(* 4 *)
let rec concat = function
    [] -> [];
  | x :: rest -> x @ (concat rest);;

concat [[0; 3; 4]; [2]; []; [5; 0]];;

(* 5 *)
let rec zip l1 l2 =
  match (l1, l2) with
      ([],_) -> []
    | (_,[]) -> []
    | (x::rest1,y::rest2) -> (x,y)::(zip rest1 rest2);;

zip [2;3;4;5;6;7;8;9;0;11]
    [true;true;false;true;false;true;false;false;false;true];;

(* 6 *)
let rec unzip p =
  match p with
    [] -> ([],[])
  | (x,y)::rest -> let (p1,p2) = unzip rest in
      (x::p1, y::p2);;
  
unzip (zip [2;3;4;5;6;7;8;9;0;11]
[true;true;false;true;false;true;false;false;false;true]);;

(* 7 *)
let rec filter p l =
  match l with
    [] -> []
  | x :: rest -> if p x then (x :: filter p rest) else filter p rest;;

let is_positive x = (x > 0);;
filter is_positive [-9; 0; 2; 5; -3];;
let rec length = function
      [] -> 0
    | _ :: rest -> 1 + length rest;;
filter (fun l -> length l = 3) [[1; 2; 3]; [4; 5]; [6; 7; 8]; [9]];;

(* 8 *)
let take m l =
  let rec iter (l,n) =
    match l with 
      [] -> []
    | x::rest when n > 1 -> x::(iter (rest, (n-1)))
    | x::rest -> x::(iter ([], 0))
  in iter (l, m);;

let rec drop m l =
  match l with
    [] -> []
  | x :: rest when m > 0 -> (drop (m-1) rest)
  | x :: rest -> x :: rest;;

let ten_to_zero = downto1 10;;
take 8 ten_to_zero;;
drop 7 ten_to_zero;;

(* 9 *)
let max_list l =
  let n = length(l) in
  let rec iter (l,n,ans) =
    match (l,n,ans) with
      ([],_,ans) -> ans
    | (x :: rest,n,ans) -> 
        if x > ans
          then iter (rest,n-1,x)
          else iter (rest,n-1,ans)
  in iter (l,n,0);;

max_list [7; 9; 0; -5];
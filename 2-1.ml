(* エラーになる式が含まれている、という記述はver. 4.05.0においてはウソ。 *)

(* 1 *)
- - 1;; 
(* - : int = 1 *)

(* 2 *)
- 2+3;;
(* - : int = 1 *)

(* 3 *)
9 / -4;;
(* - : int = -2 *)

(* 4 *)
+3 + 5;;
(* - : int = 8 *)

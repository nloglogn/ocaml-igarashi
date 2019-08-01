float_of_int 3 +. 2.5;;
(* - : float = 5.5 *)

(* 2 *)
int_of_float 0.7;;
(* - : int = 0 *)

(* 3 *)

char_of_int ((int_of_char 'A') + 20);;
(* - : char = 'U' *)

(* 4 *)
int_of_string "0xff";;
(* - : int = 255 *)

(* 5 *)
5.0 ** 2.0;;
(* - : float = 25. *)
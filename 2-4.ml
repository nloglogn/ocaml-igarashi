(* 1 *)
float_of_int (int_of_float 5.0);;

(* 2 *)
(sin (3.14 /. 2.0)) ** 2.0 +. (cos (3.14 /. 2.0)) ** 2.0;;

(* 3 *)
int_of_float (sqrt (float_of_int (3 * 3 + 4 * 4)));;

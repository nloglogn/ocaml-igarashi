let round x =
  let y = floor x in
  if x -. y >= 0.5 then floor y +. 1.0 else y


(* 1 *)
let yen_of_dollar d =
  let y = d *. 114.32 in
  int_of_float (round y);;

(* 2 *)
let dollar_of_yen y =
  let cent = (float_of_int y) /. 114.32 *. 100.0 in
  (round cent) /. 100.0;;

(* 3 *)
let str_yen_of_dollar d =
  let y = yen_of_dollar d in
  (string_of_float d) ^ " dollars are " ^ (string_of_int y) ^ " yen.";;

(* 4 *)
let capitalize s =
  let a = int_of_char s in
  if 97 <= a && a <= 122
    then char_of_int (a - 32)
    else s;;

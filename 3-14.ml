let daikei f h a n = (f(a+.(float_of_int n)*.h) +. f(a+.(float_of_int n)*.h+.h)) *. h /. 2.0;;
let rec sum_of f n =
  if n = 0 then 0.0 else (sum_of f (n - 1)) +. f n;;
let integral f a b = 
  let division = 100000 in
  let h = (b -. a) /. (float_of_int division) in
  sum_of (daikei f h a) division;;

let sin_integral = 
  let pi = 3.1415926535 in
  integral sin 0.0 pi;;

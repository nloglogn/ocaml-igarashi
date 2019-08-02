  let rec pos n = 
    if n = 0 then 1.0 -. 1.0/.3.0
    else pos (n - 1) +. 1.0/.(float_of_int (4 * n + 1)) -. 1.0/.(float_of_int(4 * n + 3));;
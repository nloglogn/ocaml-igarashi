let rec iterpow (i,x,res,n) =
  if i > n then res
  else iterpow (i+1,x,res*x,n);;

(* 2^10 = 2014 *)
let a = iterpow(1,2,1,10);;


(* 6^5 = 7776 *)
let b = iterpow(1,6,1,5);;

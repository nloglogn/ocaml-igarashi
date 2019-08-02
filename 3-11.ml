(* 1 *)
  let gcd (m,n) =
    let rec gcdpair (m,n) =
      if m mod n = 0 then (n,0)
      else gcdpair (n,m mod n)
    in
    let (g,_) = gcdpair(m,n) in g;;

(* 2 *)
  let rec comb (n,m) = (* ただしn≧m *)
    if m = 0 || m = n then 1
    else comb(n-1,m) + comb(n-1,m-1);;

(* 3 *)
  let iterfib n =
    let rec tailfib (x,y,n) =
      if n = 0 then x
      else tailfib(x+y,x,n-1)
    in
    tailfib(1,0,n);;

(* 4 *)
  let max_ascii s =
    let rec maxrec (s,res,n) =
      if n = 0 then
        if s.[0] > res then s.[0]
        else res
      else
        if s.[n] > res then maxrec(s,s.[n],n-1)
        else maxrec(s,res,n-1)
    in let n = String.length s
  in maxrec (s,s.[n-1],n-1);;

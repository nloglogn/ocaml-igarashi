let nextrand seed =
  let a = 16807.0 and m = 2147483647.0 in
  let t = a *. seed
  in t -. m *. floor (t /. m)
let rec randlist n seed tail =
  if n = 0 then (seed, tail)
  else randlist (n - 1) (nextrand seed) (seed::tail);;

let rec quick_sort li = 
  let rec qsort2 l sorted =
  match l with
    ([] | [_]) as x -> sorted
  | pivot :: rest ->
      let rec partition left right yrest = match yrest with
        [] -> let right_new = pivot :: (qsort2 right sorted)
              in qsort2 left right_new
      | y :: ys -> if pivot < y then partition left (y :: right) ys
                   else partition (y :: left) right ys
                   in partition [] [] rest  
  in qsort2 li [];;

let z = snd (randlist 10 1.0 []);;
quick_sort z;;
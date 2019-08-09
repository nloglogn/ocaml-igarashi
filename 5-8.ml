let map2 f l =
  let rec loop f l accum =
    match l with
      [] -> accum
    | x :: rest -> loop f rest ((f x)::accum)
  in let rev_map = loop f l []
  in let rec rev l1 l2 =
    match l1 with
      [] -> l2
    | x :: rest -> rev rest (x :: l2)
  in rev rev_map [];;
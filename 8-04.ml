let fib n = 
  let i = ref 0 and p = ref (ref 0, ref 1) in
  for i = 1 to n do
    let x = !(fst !p) + !(snd !p) in
    let y = !(fst !p) in
    p := (ref x, ref y)
  done;
  !(fst !p);;

fib 10;;

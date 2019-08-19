let array_iteri f li =
    if li = [] then ()
    else
    let i = ref 1 in
    let l = ref li in
    while not (!l = []) do
      begin
        match !l with
          x::rest ->  f !i x; i := !i + 1; l := rest
      end
    done;;


array_iteri (fun i s -> print_string "Station #"; print_int i;
                print_string ": "; print_endline s)
  ["Tokyo"; "Shinagawa"; "Shin-Yokohama"; "Nagoya"; "Kyoto"; "Shin-Osaka"];;
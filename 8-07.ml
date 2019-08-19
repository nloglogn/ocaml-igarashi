let array_iter f ar =
    if ar = [| |] then ()
    else
    let i = ref 0 in
    let end_loop = ref true in
    while !end_loop do
      begin 
        try f ar.(!i); i := !i + 1
        with Invalid_argument "index out of bounds" -> end_loop := false
      end
    done;;


array_iter (fun s -> print_string "Station: "; print_endline s)
  [|"Tokyo"; "Shinagawa"; "Shin-Yokohama"; "Nagoya"; "Kyoto"; "Shin-Osaka"|];;
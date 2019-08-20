let display_file filename =
  let file = open_in filename in
  let i = ref 0 in 
  let flag = ref true in
  while !flag do
    begin
      i := !i + 1;
      print_int !i;
      print_string " ";
      try print_endline (input_line file);
      with End_of_file -> flag := false;
    end
  done;;

display_file "8-11.ml";;

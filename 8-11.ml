let display_file filename =
  let file = open_in filename in
  let flag = ref true in
  while !flag do
    begin
      try print_endline (input_line file);
      with End_of_file -> flag := false;
    end
  done;;

display_file "8-11.ml";;
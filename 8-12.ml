let cp filename1 filename2 =
  let file1 = open_in filename1 in
  let file2 = open_out filename2 in
  let flag = ref true in
  while !flag do
    begin
      try output_string file2 ((input_line file1) ^ "\n")
      with End_of_file -> flag := false; close_out file2
    end
  done;;

cp "8-12.ml" "8-12_.ml" ;;
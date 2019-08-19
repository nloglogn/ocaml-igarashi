let incr x = x := !x + 1;;

let x = ref 3;;
incr x;;
!x;;
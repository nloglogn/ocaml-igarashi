type 'a ref = { mutable contents : 'a };;

let reference r = r.contents;;
let assignment r x = r.contents <- x
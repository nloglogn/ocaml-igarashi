module type QUEUE = 
  sig
    type 'a t
    exception Empty
    val empty: 'a t
    val add: 'a t -> 'a -> 'a t
    val take: 'a t -> 'a * 'a t
    val peek: 'a t -> 'a
end;;

module Queue1 : QUEUE =
  struct
    type 'a t = 'a list

    exception Empty

    let empty = []

    let add q x = q @ [x];;

    let take q = match q with
        [] -> raise Empty
      | x :: rest -> (x, rest)

    let peek = function [] -> raise Empty | x :: rest -> x
  end;;

let q = Queue1.empty;;
let q = Queue1.add q 1;;
let q = Queue1.add q 2;;
let q = Queue1.add q 3;;
Queue1.peek q;;
let (x,q) = Queue1.take q;;
let (x,q) = Queue1.take q;;
let q = Queue1.add q 4;;
let (x,q) = Queue1.take q;;
let (x,q) = Queue1.take q;;
let q = Queue1.add q 5;;
Queue1.peek q;;


module Queue2 : QUEUE =
  struct
    type 'a t = Queue of ('a list * 'a list)

    exception Empty

    let empty = Queue ([],[])

    let add q x = match q with
        Queue ([],[]) -> Queue ([x],[])
      | Queue (p1,p2) -> Queue (p1,x::p2)

    let take q = match q with
        Queue ([],[]) -> raise Empty
      | Queue ([x],[]) -> (x,Queue ([],[]))
      | Queue (x::rest,[]) -> (x,Queue (rest,[]))
      | Queue (p1,[x]) -> (x,Queue (p1,[]))
      | Queue (p1,p2) -> let rec rev l acc =
          match l with
              [] -> acc
            | x :: rest -> rev rest (x::acc)
          in
          let p = rev p2 [] 
          in match p with [] -> raise Empty | x :: rest -> (x,Queue (p1,rev rest []))

    let peek = function
        Queue ([], _) -> raise Empty
      | Queue (x :: _, _) -> x
  end;;

let q = Queue2.empty;;
let q = Queue2.add q 1;;
let q = Queue2.add q 2;;
let q = Queue2.add q 3;;
Queue2.peek q;;
let (x,q) = Queue2.take q;;
let (x,q) = Queue2.take q;;
let q = Queue2.add q 4;;
let (x,q) = Queue2.take q;;
let (x,q) = Queue2.take q;;
let q = Queue2.add q 5;;
Queue2.peek q;;

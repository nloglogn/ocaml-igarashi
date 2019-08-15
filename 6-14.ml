type intseq = Cons of int * (int -> intseq);;
let rec nthseq n (Cons(x,f)) =
  if n = 1 then x
  else nthseq (n-1) (f x);;


let is_prime x =
  let rec is_divisible_from_2_to n =
    (n > 1) && ((x mod n == 0) || is_divisible_from_2_to (n-1))
  in not (is_divisible_from_2_to (x-1));;

let rec next_prime x = 
  if is_prime (x+1) then x+1 else next_prime (x+1);;

let rec prime_seq x = 
  if is_prime (x+1) then Cons(x+1, prime_seq) else prime_seq (x+1);;

nthseq 3000 (prime_seq 1);;


(* 1 *)
let is_prime x =
  let rec is_divisible_from_2_to n =
    (n < x) && ((x mod n == 0) || is_divisible_from_2_to (n+1))
  in not (is_divisible_from_2_to 1);;

nthseq 3000 (prime_seq 1);;

(* 2 *)
let is_prime x =
let rec is_divisible_from_2_to n =
  (n <= int_of_float(sqrt(float_of_int(x)))) && ((x mod n == 0) || is_divisible_from_2_to (n+1))
in not (is_divisible_from_2_to 1);;

nthseq 3000 (prime_seq 1);;

(* 3 *)
let is_prime x =
  let rec is_divisible_from_2_to n =
    let nthprime = (nthseq n (prime_seq [] 1)) in
    let nextprime = (nthseq (n+1) (prime_seq [] 1)) in
    (nthprime < x) && ((x mod nthprime == 0) || is_divisible_from_2_to nextprime)
  and prime_seq primes x =
    if is_prime (x+1) then Cons(x+1, prime_seq ((x+1)::primes)) else prime_seq primes (x+1)
  in not (is_divisible_from_2_to 1);;

 nthseq 3000 (prime_seq 1);; 

(* 4 *)
let is_prime x =
  let rec is_divisible_from_2_to n =
    let nthprime = (nthseq n (prime_seq [] 1)) in
    let nextprime = (nthseq (n+1) (prime_seq [] 1)) in
    (nthprime <= int_of_float(sqrt(float_of_int(x)))) && ((x mod nthprime == 0) || is_divisible_from_2_to nextprime)
  and prime_seq primes x =
    if is_prime (x+1) then Cons(x+1, prime_seq ((x+1)::primes)) else prime_seq primes (x+1)
  in not (is_divisible_from_2_to 1);;

nthseq 3000 (prime_seq 1);;


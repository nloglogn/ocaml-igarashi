(* 
 * fib 4 -> if 4 = 1 || 4 = 2 then 1 else fib(4 - 1) + fib(4 - 2)
 *       -> fib(4 - 1) + fib(4 - 2)
 *       -> fib 3 + fib 2
 *       -> (if 3 = 1 || 3 = 2 then 1 else fib(3 - 1) + fib(3 - 2))
 *           + (if 2 = 1 || 2 = 2 then 1 else fib(2 - 1) + fib(2 - 2))
 *       -> (fib(3 - 1) + fib(3 - 2))
 *           + (if 2 = 1 || 2 = 2 then 1 else fib(2 - 1) + fib(2 - 2))
 *       -> (fib(3 - 1) + fib(3 - 2)) + 1
 *       -> (fib 2 + fib 1) + 1
 *       -> ((if 2 = 1 || 2 = 2 then 1 else fib(2 - 1) + fib(2 - 2))
 *           + (if 1 = 1 || 1 = 2 then 1 else fib(1 - 1) + fib(1 - 2)))
 *           + 1
 *       -> (1 + 1) + 1
 *       -> 2 + 1
 *       -> 3
 *)
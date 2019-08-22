class calc = 
  object
    val mutable num = 0
    val mutable sum_temp = 0
    val mutable func = fun x -> x

    method input n = num <- n
    method plus = sum_temp <- sum_temp + num; func <- (fun y -> sum_temp + y)
    method eq = func num
end;;

let c = new calc;;
c#input 1; c#plus; c#input 2; c#plus; c#input 3; c#eq;;

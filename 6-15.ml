type ('a, 'b) sum = Left of 'a | Right of 'b;;

let f1 (x, y) = match y with
    Left a -> Left (x, a)
  | Right a -> Right (x,a);;

let f2 x = match x with
    Left (a, y) -> (a, Left y)
  | Right(a, y) -> (a, Right y);;

let f3 (x, y) = match (x,y) with
    (Left a, Left b) -> Left(Left (a,b))
  | (Left a, Right b) -> Right(Left (a,b))
  | (Right a, Left b) -> Left(Right (a,b))
  | (Right a, Right b) -> Right(Right (a,b))

let f4 x = match x with
    Left(Left (a,b)) -> (Left a, Left b) 
  | Right(Left (a,b)) -> (Left a, Right b)
  | Left(Right (a,b)) -> (Right a, Left b) 
  | Right(Right (a,b)) -> (Right a, Right b)
(* アルファベットの順番だけが違う *)

let f5 (x, y) = let f z = match z with
    Left a -> x a
  | Right a -> y a
  in f;;

let f6 x = 
      let f = (fun a -> x (Left a))
    and g = (fun b -> x (Right b))
    in (f,g);;



let f7 x = match x with
    Left f -> let f' a = Left (f a) in f'
  | Right f -> let f' a = Right (f a) in f'
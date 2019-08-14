type token = PCDATA of string | Open of string | Close of string;;
type ('a, 'b) xml = XLf of 'b option | XBr of 'a * ('a, 'b) xml list;;

let xml_of_tokens t =
  let rec parse tag t = match t with
      [] -> ([],[])
    | token :: rest -> match token with
        PCDATA b -> let (lis, rest1) = parse tag rest in
          (XLf (Some b) :: lis, rest1)
      | Open a -> let (lis1, rest1) = parse a rest in
                  let l1 = if lis1 = [] then [XLf None] else lis1 in
                  let (lis2, rest2) = parse tag rest1 in
                  let l2 = if lis2 = [XLf None] then [] else lis2 in
                  (XBr(a,l1) :: l2, rest2)
      | Close a -> ([], rest)
    in
    match parse "" t with
      ([],_) -> XLf None
    | (xml::rest,_) -> xml;;



let test = [Open "a"; Open "b"; Close "b";
            Open "c"; PCDATA "Hello"; Close "c"; Close "a"];;

xml_of_tokens test;;

(* http://gifnksm.hatenablog.jp/entry/20080316/1205688683 を参考にしました。 *)
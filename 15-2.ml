open Tk
open Printf

(* 残高操作 *)
let balance = ref 0
let add_balance x = balance := !balance + x

(* ウィジェットを作る *)
let top = openTk()
let tv_balance = Textvariable.create () 
let label1 = Label.create top ~textvariable:tv_balance ~relief:`Raised 


let print_balance tv =
  let s = sprintf "残高は %8d 円 です" !balance in
  if !balance < 0 then 
      let () = Label.configure label1 ~foreground:`Red in
      Textvariable.set tv s 
  else
        let () = Label.configure label1 ~foreground:`Black in
        Textvariable.set tv s

let bot_frame = Frame.create top
let entry = Entry.create bot_frame
and label2 = Label.create bot_frame ~text:"円"
and rb_frame = Frame.create bot_frame

let list_frame = Frame.create top
let lb = Listbox.create list_frame

let tv_button = Textvariable.create ()
let radiobuttons = 
  List.map
    (fun (t, a) ->
      Radiobutton.create rb_frame ~text:t ~value:a ~variable:tv_button)
      [("を預金する", "Deposit"); ("を引き出す", "Withdraw")]

let action entry tv_but tv_bal () =
  let y = int_of_string (Entry.get entry) in
  let message = match Textvariable.get tv_but with
      "Deposit" -> " 円預けました。"
    | "Withdraw" -> " 円引き出しました。"
    | _ -> failwith "Cannot happen"
    in (Listbox.insert ~index:`End ~texts:[(string_of_int y) ^ message] lb);
      match Textvariable.get tv_but with
        "Deposit" -> add_balance y; print_balance tv_bal
      | "Withdraw" -> add_balance (-y); print_balance tv_bal
      | _ -> failwith "Cannot happen"

let button = 
  Button.create bot_frame
    ~text:"実行" ~command:(action entry tv_button tv_balance)
  
(* ウィジェット配置と初期化 *)
let () =
  pack radiobuttons ~side:`Top;
  pack [coe entry; coe label2; coe rb_frame; coe button] ~side:`Left;
  pack [coe label1; coe bot_frame] ~side:`Top;
  pack [coe list_frame; coe lb] ~side:`Right ~fill:`X;
  print_balance tv_balance;
  mainLoop()
type figure_with_location =
  Point of float * float
| Circle of float * float * float
| Rectangle of float * float * float * float
| Square of float * float * float;;

let abs_float x = if x > 0.0 then x else 0.0 -. x;;


let overlap fig1 fig2 =
  match (fig1,fig2) with
    (Point(x1,y1),Point(x2,y2)) -> x1 = x2 && y1 = y2
  | (Point(x1,y1),Circle(r,x2,y2)) | (Circle(r,x2,y2),Point(x1,y1))
        -> (x1 -. x2) *. (x1 -. x2) +. (y1 -. y2) *. (y1 -. y2) <= r *. r
  | (Point(x1,y1),Rectangle(l1,l2,x2,y2)) | (Rectangle(l1,l2,x2,y2)),(Point(x1,y1))
        -> abs_float(x1 -. x2) <= l1 /. 2.0 && abs_float(y1 -. y2) <= l2 /. 2.0
  | (Point(x1,y1),Square(l,x2,y2)) | (Square(l,x2,y2),Point(x1,y1))
        -> abs_float(x1 -. x2) <= l /. 2.0 && abs_float(y1 -. y2) <= l /. 2.0
  | (Circle(r1,x1,y1),Circle(r2,x2,y2))
        -> sqrt((x1 -. x2) *. (x1 -. x2) +. (y1 -. y2) *. (y1 -. y2)) <= r1 +. r2
  | (Circle(r,x1,y1),Rectangle(l1,l2,x2,y2)) | (Rectangle(l1,l2,x2,y2),Circle(r,x1,y1))
        -> (x1-.x2-.l1/.2.0)*.(x1-.x2-.l2/.2.0) +. (x1-.x2-.l1/.2.0)*.(x1-.x2-.l2/.2.0) <= r*.r
        || (x1-.x2+.l1/.2.0)*.(x1-.x2-.l2/.2.0) +. (x1-.x2+.l1/.2.0)*.(x1-.x2-.l2/.2.0) <= r*.r
        || (x1-.x2-.l1/.2.0)*.(x1-.x2+.l2/.2.0) +. (x1-.x2-.l1/.2.0)*.(x1-.x2+.l2/.2.0) <= r*.r
        || (x1-.x2+.l1/.2.0)*.(x1-.x2+.l2/.2.0) +. (x1-.x2+.l1/.2.0)*.(x1-.x2+.l2/.2.0) <= r*.r
        || r +. abs_float(y1 -. y2) <= l2/.2.0
        || r +. abs_float(x1 -. x2) <= l1/.2.0
  | (Circle(r,x1,y1),Square(l,x2,y2)) | (Square(l,x2,y2),Circle(r,x1,y1))
        -> (x1-.x2-.l/.2.0)*.(x1-.x2-.l/.2.0) +. (x1-.x2-.l/.2.0)*.(x1-.x2-.l/.2.0) <= r*.r
        || (x1-.x2+.l/.2.0)*.(x1-.x2-.l/.2.0) +. (x1-.x2+.l/.2.0)*.(x1-.x2-.l/.2.0) <= r*.r
        || (x1-.x2-.l/.2.0)*.(x1-.x2+.l/.2.0) +. (x1-.x2-.l/.2.0)*.(x1-.x2+.l/.2.0) <= r*.r
        || (x1-.x2+.l/.2.0)*.(x1-.x2+.l/.2.0) +. (x1-.x2+.l/.2.0)*.(x1-.x2+.l/.2.0) <= r*.r
        || r +. abs_float(y1 -. y2) <= l/.2.0
        || r +. abs_float(x1 -. x2) <= l/.2.0
  | (Rectangle(l1,l2,x1,y1),Rectangle(l3,l4,x2,y2))
        -> abs_float(x1-.x2) <= l1/.2.0 +. l3/.2.0 && abs_float(y1-.y2) <= l2/.2.0 +. l4/.2.0
  | (Rectangle(l1,l2,x1,y1),Square(l,x2,y2)) | (Square(l,x2,y2),Rectangle(l1,l2,x1,y1))
        -> abs_float(x1-.x2) <= l1/.2.0 +. l/.2.0 && abs_float(y1-.y2) <= l2/.2.0 +. l/.2.0
  | (Square(l1,x1,y1),Square(l2,x2,y2))
        -> abs_float(y1-.y2) <= l1/.2.0 +. l2/.2.0 && abs_float(y1-.y2) <= l1/.2.0 +. l2/.2.0;;  
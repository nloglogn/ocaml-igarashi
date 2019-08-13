type 'a tree = Lf | Br of 'a * 'a tree * 'a tree;;
type 'a rosetree = RLf | RBr of 'a * 'a rosetree list;;

let rec tree_of_rtree = function
    RLf -> Br (None, Lf, Lf)
  | RBr (a, rtrees) -> Br (Some a, tree_of_rtreelist rtrees, Lf)
and tree_of_rtreelist = function
    [] -> Lf
  | rtree :: rest -> let Br (a, left, Lf) = tree_of_rtree rtree in
                        Br (a, left, tree_of_rtreelist rest);;

let rec rtree_of_tree = function
    Br(None, Lf, Lf) -> RLf
  | Br(Some a, left, right) -> let Br(b, leftb, rightb) = left
                              in RBr(a, (rtree_of_tree left) :: (rtreelist_of_tree rightb))
and rtreelist_of_tree = function
    Lf -> []
  | Br(None, Lf, right) -> RLf :: (rtreelist_of_tree right)
  | Br(Some a, left, right) -> (rtree_of_tree (Br(Some a, left, Lf))) :: (rtreelist_of_tree right);;

let rtree = 
      RBr ("a", [
            RBr ("b", [
                  RBr ("c", [RLf]);
            RLf;
            RBr ("d", [RLf])]);
      RBr ("e", [RLf]);
      RBr ("f", [RLf])]);;

tree_of_rtree rtree;;

rtree_of_tree (tree_of_rtree rtree);;
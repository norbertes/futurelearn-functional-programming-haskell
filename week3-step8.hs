data SimpleNum = One | Two | Many deriving (Show, Read, Eq)
let convert 1 = One
    convert 2 = Two
    convert _ = Many


data CricketScore = Score [Char] Int Int deriving Show
let x = Score "New Zealand" 350 4


data Tree = Leaf | Node Int Tree Tree deriving Show
let l = Node 3 Leaf Leaf


treeDepth :: Tree -> Int
treeDepth Leaf = 0
treeDepth (Node _ leftSubtree rightSubtree) =
    1 + max (treeDepth leftSubtree) (treeDepth rightSubtree)


isSortedTree :: Tree -> Int -> Int -> Bool
isSortedTree Leaf _ _ = True
isSortedTree (Node x leftSubtree rightSubtree) minVal maxVal =
    let leftSorted = isSortedTree leftSubtree minVal x
        rightSorted = isSortedTree rightSubtree x maxVal
    in x >= minVal && x < maxVal && leftSorted && rightSorted


addNewMax :: Tree -> Tree
-- add a new max element to tree
addNewMax Leaf = Node 0 Leaf Leaf  -- input tree with no nodes
addNewMax (Node x t1 Leaf) = Node x t1 (Node (x+1) Leaf Leaf)  -- this is the rightmost Node
addNewMax (Node x t1 t2) = Node x t1 (addNewMax t2) -- intermediate node, go down right subtree

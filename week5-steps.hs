let fibs = 1:1:(zipWith (+) fibs (tail fibs))

properfactors :: Int -> [Int]
properfactors x = filter (\y -> (x `mod` y == 0)) [2..(x-1)]

numproperfactors :: Int -> Int
numproperfactors x = length (properfactors x)

primes :: [Int]
primes = filter (\x-> (numproperfactors x == 0)) [2..]


-- What is type of  \f -> f f ?
-- If you try this out in ghci, you will get the error cannot construct the
--  infinite type. This expression is valid in dynamically typed languages but
--  not in statically typed ones.


-- data Tree a = Node __ __ | Leaf __
-- data Tree a = Node (Tree a) (Tree a) | Leaf a


-- Is correctly typed? Yes
-- join :: String -> [String] -> String
-- join str strs = foldl (++) str strs

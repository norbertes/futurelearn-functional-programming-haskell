hello :: String -> String
hello name = "Hello, " ++ name
myNameTest = hello "Norbert"

sq :: Int -> Int -> Int
sq x y = x*x+y*y
sqTest = sq 5 5

-- map (\x -> 2*x) [1..10]

-- roots :: Int -> Int -> Int -> String
-- roots a b c =
--   let
--     det2 = b*b-4*a*c
--     det = sqrt(det2)
--     rootp = (-b + det)/a/2
--     rootm = (-b - det)/a/2
--   in
--     [rootm, rootp]

-- max x y =
--   if x > y then x else y

-- data Color = Red | Blue | Yellow
-- color = set_color
-- action = case color of
--   Red -> action1
--   Blue -> action2
--   Yellow -> action3

-- [3*x | x <- [1..10]]

-- head :: [a] -> a
-- head [4,5,6] -- 4
-- tail :: [a] -> a
-- tail [4,5,6] -- [5,6]

-- xs = [1,2,xs2 !! 5,4]
-- xs2 = xs ++ xs
-- xs2 !! 2 -- > 2
-- xs !! 2 -- > 2

-- [1.1,1.2 .. 2.0]
-- 5 : []


main = putStrLn roots 1 2 3

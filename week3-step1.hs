-- [x0, x1, x2] == x0 : x1 : x2 : []
-- foldr cons [] xs = xs

filter :: (a -> Bool) -> [a] -> [a]
filter (<5) [3,4,5,6,7]


filter :: (a -> Bool) -> [a] -> [a]
filter pred [] = []
filter pred (x:xs)
    | pred x = x : filter pred xs
    | otherwise = filter pred xs

filter pred lst
  | null lst = []
  | otherwise = if pred x
     then x:filter pred xs
     else filter pred xs
       where x:xs=lst


(.) :: (b->c) -> (a->b) -> a -> c
(f . g) x = f (g x)


map :: (a->b) -> [a] -> [b]
map _ []     = []
map f (x:xs) = f x : map f xs


foldl :: (a->b->a) -> a -> [b] -> a
foldl f z0 xs0 = lgo z0 xs0
    where
        lgo z []     = z
        lgo z (x:xs) = lgk (f z x) xs

sum xs = foldr (+) 0 xs
sum = foldr(+) 0 -- point free style


map (+5) (map (*3) [1..10])
map ((+5) . (*3)) [1..10]

foldl (\acc elt -> elt:acc) "" "Reversing a string"
foldr (\elt acc -> acc ++ elt) "" "Reversing a string"

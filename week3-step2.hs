lst_ = map f lst
f x = x * (x+1)

lst = [1..10]

main = do
    print lst_



length lst =
  if lst == []
    then 0
    else let x:xs = lst in 1 + length xs

length lst
  | lst == [] = 0
  | otherwise = let x:xs = lst in 1 + length xs

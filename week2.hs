elem 3 [1,2,3]
3 `elem` [1,2,3]

1 + 1
(+) 1 1

zip [1,2,3] "abc"
zip3 [1,2,3,4,5] "abcd" "zyX"

length ['a' .. 'z']

zipWith max [1,2,3] [0,2,4] -- [1,2,4]
zipWith (+) [1,2,3] [0,2,4] -- [1,4,7]
zipWith (\x -> (\y -> (x,y))) [1,2,3] [0,2,4] -- [(1,0),(2,2),(3,4)]

map (\inputs -> xor (fst \inputs) (snd \inputs)) [(x,y) | x<-[True, False], y<-[False, True]]

--

putStrLn ("good" ++ "morning")

do { putStrLn "what is your name?"; x <- getLine; putStrLn ("hello " ++ x) }

do { putStrLn "name?"; n <- getLine; let nUpper = map toUpper n in putStrLn ("hello " ++ nUpper) }

read "42" :: Int

show (6*7)
putStrLn show (6*7) == print 42

let fact n = if n == 0 then 1 else n*fact(n-1)
map fact [1..10]

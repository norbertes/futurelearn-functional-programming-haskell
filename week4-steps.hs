--find the max value in an Int list

maxhelper :: Int -> [Int] -> Int
maxhelper x [] = x
maxhelper x (y:ys) = maxhelper
  (if x>y then x else y) ys
-- recurrent call for all elements


maxfromlist :: [Int] -> Maybe Int
maxfromlist [] = Nothing
maxfromlist (x:xs) = Just (maxhelper x xs)



let inc = (1+)
inc (Just 1) -- won't work - bad type
fmap inc (Just 1) -- it works
fmap inc Nothing -- works

let x = numeral ++ " minister"  where numeral = "prime" in x -- returns "prime minister"
-- The where clause is linked with the definition of x, not the overall let expression


-- <|> parse with 1st, if fails, try second
letter_digit :: Parser Char
letter_digit =
  do  x <- letter <|> digit
      return x

-- succeeds when all string is fine, not just one letter "bog" will fail in previous code
bag_bog_try :: Parser String
bag_bog_try =
  do  xs <- try (string "bag") <|> string "bog"
      return xs


do
  expr1
  expr2
-- ==
expr1 >> expr2



data PersonRecord = MkPersonRecord {
  name :: String
  address :: Address,
  id :: Integer,
  labels :: [Label]
} deriving (Show)

data Address = MkAddress {
    line1 :: String,
    number :: Integer,
    street :: String,
    town :: String,
    postcode :: String
} deriving (Show)

data Label = Green | Red | Blue | Yellow deriving (Show)

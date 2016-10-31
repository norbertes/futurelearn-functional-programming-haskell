-- What type should be an a?
(+) :: a -> a -> a
(<) :: a -> a -> Bool

(+) :: Num a => a -> a -> a
(<) :: Ord a => a -> a -> Bool

data Bright
    = Blue
    | Red
    deriving (Read, Show)

darkBright :: Bright -> Bool
darkBright Blue = True
darkBright Red  = False

lightenBright :: Bright -> Bright
lightenBright Blue = Red
lightenBright Red = Red

class Color a where
    dark :: a -> Bool
    lighten :: a -> a

instance Color Bright where
      dark = darkBright
      lighten = lightenBright



-- own show instance:
data Foo = Bar | Baz
instance Show Foo where
    show Bar = "it is a bar"
    show Baz = "this is a baz"



-- only functions:
let
    n = 10
    f x = x + 1
in
    f n
-- rewrite:
( \n -> ((\f -> f n) (\x -> x+1)) ) 10

-- true/false
true  = \x y -> x
false = \x y -> y


-- if/then/else
if cond then if_true else if_false

if_then_else cond if_true if_else
    = cond if_true if_false

-- lists (all 3 are the same)
list = [1,2,3]
list = 1:2:3:[]
list = cons 1(cons 2 (cons 3 []))

cons = \x xs -> (\c -> c x xs)
[] = \f -> true


(\x y -> x*x-y*y) 3 4 -- -7
map (\x -> length x) ["This","is", "a","test"]  -- [4,2,1,4]
(\x -> (\y -> y x)) "x" (\y -> y) -- "x"
(\x -> (\y -> x y)) "x"  -- error (string is not a fn)
(\x -> (\y -> y x)) "x"  -- partially applied fn
(\x f -> f x) 4 (\x -> x*x)  -- 16
(\x -> 1) 2 -- 1

-- Monads:
-- What is a Monad?
-- * A monad is an algebraic structure in category theory, and in Haskell it is
-- used to describe computations as sequences of steps, and to handle side
-- effects such as state and IO.
--
-- * Monads are abstract, and they have many useful concrete instances.
-- * Monads provide a way to structure a program.
-- * They can be used (along with abstract data types) to allow actions
-- (e.g. mutable variables) to be implemented safely.
--
-- Building blocks of a monad
-- A monad has three building blocks:
--
-- * A type constructor that produces the type of a computation,
-- given the type of that computation’s result.
-- * A function that takes a value, and returns a computation that—when
-- executed—will produce that value.
-- * A function that takes two computations and performs them one after
-- the other, making the result of the first computation available to the second.
--
-- Let’s restate this more precisely:
--
-- Definition of a monad
-- A monad consists of three objects, which must satisfy the monad laws.
-- Let’s look at the objects first:
--
-- * A type constructor MM, such that for any type aa, the type MaMa is the
--   type of a computation in the monad MM that produces a result of type aa.
--
-- * A function return::a→Mareturn::a→Ma. Thus if x::ax::a, then returnxreturnx
--   is a computation in MM that, when executed, will produce a value of type aa.
--
-- * A function (>>=)::Ma→(a→Mb)→Mb(>>=)::Ma→(a→Mb)→Mb.
--      * The first argument is a computation that produces a value of type aa.
--      * The second argument is a function that requires an argument of type
--        aa and returns a computation that produces a value of type bb.
--      * The result is a computation that will produce a value of type bb.
--        It works by running the first computation and passing its result to
--        the function that returns the second computation, which is then executed.

data Maybe a = Just a | Nothing
myHead :: [a] -> Maybe a
myHead [] = Nothing
myHead (x:xs) = Just x

myTail :: [a] -> Maybe [a]
myTail [] = Nothing
myTail (x:xs) = Just xs

-- Monad instance of Maybe:
import Control.Monad
instance Monad Maybe where
    return           =   Just
    Nothing  >>= f   = Nothing
    (Just x) >>= f   = f x
    fail _           =   Nothing

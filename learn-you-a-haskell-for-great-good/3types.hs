-- chapter 3 Types and Typeclasses

--haskell has a static type system but has type inference so types dont
--have to be explicity declared

--in ghci ':t' variable outputs the type

--functions also have types and we can explicity declare them
--for addThree, the return type is last and the parameters are the first three 'Int's
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

removeLowerCase :: [Char] -> [Char]
removeLowerCase st = [s | s <- st, s `elem` ['A'..'Z']]
rmLCTest = "ThIs Is A sTrInG"

removeUpperCase :: [Char] -> [Char]
removeUpperCase st = [s | s <- st, s `elem` ['a'..'z']]
rmUCTest = "ThIs Is A sTrInG"

removeWhiteSpace :: [Char] -> [Char]
removeWhiteSpace st = [s | s <- st, s /= ' ']
rmWSTest = "this string has no whitespace"

--use Integer instead of Int for really big numbers
factorial :: Integer -> Integer
factorial n = product [1..n]

--float for single precesion
circumference :: Float -> Float
circumference r = 2 * pi * r

--double for double precesion
circumferenceDouble :: Double -> Double
circumferenceDouble r = 2 * pi * r

-- :t can show return types of builtins
-- ghci> :t head
-- head :: [a] -> a
-- a is a type variable meaning it can be any type
-- functions with type variables are polymorphic functions
--another example
-- ghci> :t fst
-- fst :: (a, b) -> a

-- '=>' symbol is a class constraint
--type signature of '=='
--ghci> :t (==)  
--(==) :: (Eq a) => a -> a -> Bool  

--so '==' function takes to parameters of the same type and returns a Bool

--typeclasses
-- Eq - '==', '/='
-- Ord - '>', '<', '<=', etc
--ghci> :t (>)  
--(>) :: (Ord a) => a -> a -> Bool

-- show takes a value and presents it as a string
-- show 3
-- "3"

--read takes a string and retusn a type
-- ghci> read "True" || False
-- True

-- ghci> read "8.3" + 3
-- 11.3

--ghci> read "[1,2,3,4]" ++ [3]  
--[1,2,3,4,3]  

--use type annotations to specify what read should return
-- ghci> read "5" :: Float
-- 5.0
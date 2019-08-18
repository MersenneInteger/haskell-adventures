-- chapter 4 Syntax in Functions

--pattern matching
lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
--x or anything other than 7 will print the msg below
lucky x = "Sorry, you're out of luck, pal!"

sayMe :: (Integral a) => a -> String
sayMe 1 = "One"
sayMe 2 = "Two"
sayMe 3 = "Three"
sayMe 4 = "Four"
sayMe 5 = "Five"
--x or anything not between 1 and 5
sayMe x = "Not between 1 and 5"

--recursive factorial
factorial :: (Integral a) => a -> a
factorial 0 = 1 --base case
factorial n = n * factorial (n - 1) --general case

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)
vector1 = addVectors (2,2) (3,3)
vector2 = addVectors (3,1) (4,6)

first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, x, _) = x

third :: (a, b, c) -> c
third (_, _, x) = x

oneTwoThree = (1, 2, 3)
firstEx = first oneTwoThree
secondEx = second oneTwoThree
thirdEx = third oneTwoThree

pairs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]
addPairs = [a+b | (a, b) <- pairs]

head' :: [a] -> a
head' [] = error "Cant call head on an empty list"
head' (x:_) = x

headTest1 = head' [1,2,3]
headTest2 = head' [4,5,6]

tell :: (Show a) => [a] -> String  
tell [] = "The list is empty"  
tell (x:[]) = "The list has one element: " ++ show x  
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y  
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y

--length function using recursion
length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

--sum function using recursion
sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

capital :: String -> String
capital "" = "Empty string"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

-- Guards
bmiTell :: (RealFloat) a => a -> String
bmiTell bmi
    | bmi <= 18.5 = "You're underweight"
    | bmi <= 25.0 = "Normal"
    | bmi <= 30.0 = "Slightly overweight"
    | otherwise = "You're really fat"

bmiCalculator :: (RealFloat a) => a -> a -> String
bmiCalculator weight height
    | weight / height ^ 2 <= 18.5 = "You're underweight"
    | weight / height ^ 2 <= 25.0 = "You're normal"
    | weight / height ^ 2 <= 30.0 = "You're slightly overweight"
    | otherwise                   = "You're really fat"

--implementing max with guards
max' :: (Ord a) => a -> a -> a
max' a b
    | a > b = a
    | otherwise = b

--in one line:
--max' a b | a > b = a | otherwise = b

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a > b     = GT
    | a == b    = EQ
    | otherwise = LT

--where
bmiCalculator2 :: (RealFloat a) => a -> a -> String
bmiCalculator2 weight height
    | bmi <= 18.5 = "You're underweight"
    | bmi <= 25.0 = "You're normal"
    | bmi <= 30.0 = "You're slightly overweight"
    | otherwise                   = "You're really fat"
    where bmi = weight / height ^ 2

--or
bmiTell2 :: (RealFloat a) => a -> a -> String  
bmiTell2 weight height  
    | bmi <= skinny = "You're underweight, you emo, you!"  
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"  
    | otherwise     = "You're a whale, congratulations!"  
    where bmi = weight / height ^ 2
          skinny = 18.5
          normal = 25.0
          fat = 30.0

--get initials
initials :: String -> String -> String
initials firstName lastName = [f] ++ "." ++ [l] ++ "."
    where (f:_) = firstName
          (l:_) = lastName
        
myInitials = initials "Spike" "Speigel"

--another bmi calculator
calcBmis :: (RealFloat a) => [(a, a)] -> [a]  
calcBmis xs = [bmi w h | (w, h) <- xs]  
    where bmi weight height = weight / height ^ 2


--let bindings
--let bindings are expressions where where bindings are just syntactic constructs
--this means let bindings can be used anywhere, like in other expressions
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r^2
    in sideArea + 2 * topArea

randomFun = 4 * (let a = 9 in a + 1) + 2
squares = [let square x = x * x in (square 5, square 3, square 8)]
--separate bindings with semicolons
randomFun2 = (let a = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar = "there!" in foo ++ bar)

calcBmiWithLet :: (RealFloat a) => [(a,a)] -> [a]
calcBmiWithLet xs = [bmi | (w,h) <- xs, let bmi = w/h^2]

--case expressions

--case expression of pattern -> result  
--                   pattern -> result  
--                   pattern -> result  
--                   ...  

head2 :: [a] -> a
head2 [] = error "error: empty list"
head2 (x:_) = x

head3 :: [a] -> a
head3 xs = case xs of []-> error "error: empty list"
    (x:_) -> x


describeList :: [a] -> String
describeList xs = "The list is " ++ case xs of [] -> "empty."
                                               [x] -> "a singleton list."
                                               xs -> "a longer list."

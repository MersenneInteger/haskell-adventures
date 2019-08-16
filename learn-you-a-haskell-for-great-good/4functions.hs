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


-- learn you a haskell for great good
-- chapter 2 - starting out

--functions
doubleMe x = x + x

--doubleUs x y = x*2 + y*2
doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100
                        then x
                        else x * 2

conanO'Brien = "It's a-me, Conan O'Brien!"

-- '++' adds two lists
hello = "hello"
world = "world"
helloWorld = hello ++ " " ++ world

-- ':' adds a number/char to list/string
aList = [1,2,3,4,5]
bList = 0 : aList

str1 = "ello"
str2 = 'h' : str1

-- '!!' returns an element of a list by index
emptyList = []
emptyNestedList = [[], []]
firstElem = emptyNestedList !! 0

cList = [1,2,3,4,5]
secondElem = cList !! 2 --returns 3

firstThreeNums = [1,2,3]
secondThreeNums = [4,5,6]
thirdThreeNums = [7,8,9]

nestedNumList = [firstThreeNums, secondThreeNums, thirdThreeNums]
firstElemOfFirstElem = nestedNumList !! 0 !! 0
secondElemOfSecondElem = nestedNumList !! 1 !! 1
thirdElemOfThirdElem = nestedNumList !! 2 !! 2

-- head [list] - returns first element of a list
headOfList = head firstThreeNums

-- tail [list] - cuts off head off list and returns the rest
tailOfList = tail firstThreeNums

-- last [list] - return last element of a list
lastOfHeadList = last firstThreeNums

--init - takes list and returns everything except its last element
initList = init firstThreeNums

--will result in error
-- errorList = head emptyList

-- length - returns length obviously
checkedList = if length firstThreeNums > 0
    then tail firstThreeNums
    else emptyList

-- null returns True if list is empty and False if not
isListEmpty = if null emptyList
    then "list is empty"
    else "list is not empty"

--reverse - returns a reversed list
reversedFirstThreeNums = reverse firstThreeNums

--take - takes a number and a list and returns that many elements from the beginning of list
slicedList = take 1 firstThreeNums

-- drop - drops the number of elements from the beginning of a list
droppedList = drop 1 firstThreeNums

--maximum - returns largest element
maxList = maximum firstThreeNums

--minimum - returns smallest element
minList = minimum firstThreeNums

--sum - returns sum of elements in a list
sumList = sum firstThreeNums

--product - returns product of elements in a list
productList = product firstThreeNums

--elem - tests if item is an element in the list
isInList = 1 `elem` firstThreeNums

-- ranges - arithmetic sequences of elements that can be enumerated
oneToTwentyList = [1..9]
aToZList = ['a'..'z']
--adding steps
evensList = [2,4..20]
oddsList = [1,3..20]
threesList = [3,6..20]
twentyDownList = [20,19..1]

-- try to avoid floats in ranges
weirdFloatList = [0.1, 0.3 .. 1]

-- infinite list
infiniteList = [1,2..]

--cycle takes a list and cycles it into an infinite list
-- since list is infinite take a slice
cycleList = take 10 (cycle [1,2,3])
lolList = take 12 (cycle "LOL ")

--repeat - takes an element and creates an infinite list of the same element
lotsOfFives = take 10 (repeat 5)

--replicate - create a list with x elements of y element
threeTensList = replicate 3 10

-- list comprehensions
--create a list, inspired by set-builder notation
doublesList = [x*2 | x <- [1..10]]
doublesOverTwelveList = [x*2 | x <- [1..10], x*2 >= 12]

--numbers from 50 to 100 whose remainder when divided by 7 is 3
remainderThreeList = [x | x <- [50..100], x `mod` 7 == 3]

fizzBuzzNums = [x | x <- [1..100], x `mod` 3 == 0 || x `mod` 5 == 0]

--replace each odd number over 10 with 'BANG!' and if its less than 10, with 'BOOM'
boomBangs xs = [if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

--get 10..20 except for 13,15,19
predicateList = [x | x <- [10..20], x /= 13, x /= 15, x /=19]

--get products of corresponding elem from two lists
productList2 = [x*y | x <- [2,5,10], y <- [8,10,11]]

productList2OVer50 = [x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]

nouns = ["hobo", "frog", "pope"]
adjectives = ["lazy", "grouchy", "scheming"]
nounsAndAdjectives = [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]

-- '_' is just a placeholder variable we will never use
--this replaces every elem of a list with 1 and sums it up
length' xs = sum [1 | _ <- xs]

--remove all lower case letters from string
removeLowercase st = [c | c <- st, c `elem` ['A'..'Z']]

--remove all upper case letters from string
-- [return value | list value is gathered from, predicate]
removeUppercase st = [c | c <- st, c `elem` ['a'..'z']]

--remove odd nums
xxs = [[1,2,3,4,5], [6,7,8,9,10], [11,12,13,14,15]]
noOddNums = [[x | x <- xs, even x] | xs <- xxs]

--tuples
-- a way to store several values in a single value
--can consist of mixed data types
listOfTuples = [(1,2), (3,4), (5,6)]
loTFirstElem = listOfTuples !! 0

mixedTuple = ("Name", 22)

-- fst and snd only operate on pairs
--fst - take a pair and returns first component
pairFst = fst (8,11)

--snd - takes a pair and returns its second component
pairSnd = snd (8,11)

--zip produces a list of pairs
--takes two lists and zips them together in one list
list1 = [1,2,3,4,5]
list2 = [6,7,8,9,10]
zippedList = zip list1 list2

--zipping an infinite list with a finite one just cuts off to match the length of the shorter one
cutOffList = zip infiniteList [1,2,3,4,5]

--generate all triangles with sides equal to or smaller than 10
triangles = [(a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10]]

--same as above but right triangles
rightTriangles = [(a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]
rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]

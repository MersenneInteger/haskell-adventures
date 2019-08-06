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

-- Texas ranges




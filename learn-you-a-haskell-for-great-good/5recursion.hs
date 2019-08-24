-- chapter 5 recursion

--max function using recursion
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of an empty list"
maximum' [x] = x --edge condition
maximum' (x:xs) --split list into head and tail
    | x > maxTail = x --get max
    | otherwise = maxTail --continue comparing
    where maxTail = maximum' xs
--[2,5,1]
--x=[2] xs=[5,1]
--[2] [5] [1]
--[2] [5]
--[5]

--alternative way to write it
maximum2 :: (Ord a) => [a] -> a
maximum2 [] = error "maximum of empty list"
maximum2 [x] = x
maximum2 (x:xs) = max x (maximum' xs)

--replicate function
replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
    | n <= 0 = [] --returns and appends empty list, edge condition
    | otherwise = x:replicate' (n-1) x --append x

--take function
take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
    | n <= 0    = [] --if n is less than 0, return empty list
take' _ []      = [] --if list is empty, return empty list
take' n (x:xs)  = x : take' (n-1) xs

--reverse
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]
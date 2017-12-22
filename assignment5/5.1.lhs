> module WordList
> where
> import Data.List

3.2 

> allTrueFR :: [Bool] -> Bool
> allTrueFR  = foldr (&&) True

> allTrueFL :: [Bool] -> Bool
> allTrueFL  = foldl (&&) True

> allFalseFR :: [Bool] -> Bool
> allFalseFR xs   = not (foldr (||) False xs)

> allFalseFL :: [Bool] -> Bool
> allFalseFL xs   = not (foldl (||) False xs)

Neutral is actually the result of previous folding...

> memberFR :: (Eq a) => a -> [a] -> Bool
> memberFR el   = foldr (\x res -> el == x || res) False [1,2,3]

> memberFL :: (Eq a) => a -> [a] -> Bool
> memberFL el   = foldl (\res x -> el == x || res) False [1,2,3]

> smallestFR :: [Int] -> Int 
> smallestFR = foldr (min) maxBound

> smallestFL :: [Int] -> Int 
> smallestFL  = foldl (min) maxBound

> largestFR :: [Int] -> Int
> largestFR = foldr (max) minBound

> largestFL :: [Int] -> Int
> largestFL = foldl (max) minBound

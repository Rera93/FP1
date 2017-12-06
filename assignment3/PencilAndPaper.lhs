> module WordList
> where
> import Data.List

3.2 

> allTrue :: [Bool] -> Bool
> allTrue []         = True
> allTrue (x : xs)   = x && allTrue xs 

> allFalse :: [Bool] -> Bool
> allFalse []         = True
> allFalse (x : xs)   = not x && allFalse xs

> member :: (Eq a) => a -> [a] -> Bool
> member _el []                 = False
> member el (x : xs)            = el == x || member el xs

> smallest :: [Int] -> Int 
> smallest []        = maxBound
> smallest (x : xs)  = x `min` smallest xs

> largest :: [Int] -> Int
> largest []        = minBound 
> largest (x : xs)  = x `max` largest xs
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

3.3

runs is Non-empty and Non-decreasing

> runs :: (Ord a) => [a] -> [[a]]
> runs []                = []
> runs (x : xs)          = extend x (runs xs) 

> extend :: (Ord a) => a -> [[a]] -> [[a]]
> extend x []                =  [[x]]
> extend x (y : ys)  
>  | x <= head y             = (x : y) : ys 
>  | otherwise               = [x] : y : ys 
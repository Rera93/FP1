> {-# LANGUAGE UnicodeSyntax #-}

> module Char
> where
> import Unicode
> import Data.Char

equal      :: String → String → Bool
isNumeral  :: String → Bool
isBlank    :: String → Bool
fromDigit  :: Char → Int
toDigit    :: Int → Char
shift      ∷ Int -> Char -> Char

> equal :: String -> String -> Bool
> equal a b = let a' = map toLower a
>                 b' = map toLower b
>		  in a' == b'

 isNumeral :: String -> Bool
 isNumeral var = map (\c -> and 

> fromDigit :: Char -> Int
> fromDigit x = digitToInt x

> toDigit :: Int -> Char 
> toDigit x = intToDigit x

> swap, f2 :: (Int, Int) -> (Int, Int) 
> swap (x, y) = (y, x) 
> f2 (x, y)
>  | x > y = (x, y)
>  | otherwise = (y, x)

> convert :: (Int, (Char, Bool)) -> (Int, Char, Bool)
> convert (x, (y, z)) = (x, y, z)

> msg  ::  String
> msg  =  "MHILY LZA ZBHL XBPZXBL MVYABUHL HWWPBZ JSHBKPBZ \
>         \JHLJBZ KPJABT HYJUBT LZA ULBAYVU"

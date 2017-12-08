> {-# LANGUAGE UnicodeSyntax #-}
> module Format
> where
> import Prelude hiding (Word)
> import Unicode
> import WordList (Word, lorem)


> format :: Int -> [Word] -> [[Word]]
> format _ [] = []
> format lim list = (take (formatAux list 0 lim) list):(format lim (reverse (take ( (length list) - (formatAux list 0 lim) )  (reverse list) ) ))


> formatAux :: [Word] -> Int -> Int -> Int
> formatAux [] _n _lim = 0
> formatAux list n lim
>        | n == length(unwords list) = n
>        | lim >  length (unwords (take n ( list) ) )  = formatAux ( list) (n+1) lim
>        | lim <  length (unwords (take n (  list) ) )  =  n-1
>        | lim == length (unwords (take n (  list) ) )  = n


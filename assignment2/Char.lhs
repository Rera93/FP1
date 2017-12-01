> {-# LANGUAGE UnicodeSyntax #-}
> module Char
> where
> import Unicode
> import Data.Char
> import Data.List


2.2.1

> equal      ∷ String → String → Bool
> equal s1 s2 = map toLower s1 == map toLower s2

2.2.2

> isNumeral  ∷ String → Bool
> isNumeral s = and (map (\c -> (and[c > '0', c < '9'])) s)

> isBlank  ∷ String → Bool
> isBlank s = and (map (\c -> c==' ') s)

2.2.3

> fromDigit  ∷ Char → Int
> fromDigit a = digitToInt a


> toDigit    ∷ Int → Char
> toDigit a = intToDigit a

> shift      ∷ Int -> Char -> Char
> shift _ ' ' = ' '
> shift n c 
> 	| (((ord c) + n) > 90) = (chr (64+ ( (ord c + n) - 90 ) ))
>	| otherwise	= chr ((ord c) +n)

> shiftString :: Int -> String -> String
> shiftString n s = map (shift n) s

> msg  ∷  String
> msg  =  "MHILY LZA ZBHL XBPZXBL MVYABUHL HWWPBZ JSHBKPBZ \
>         \JHLJBZ KPJABT HYJUBT LZA ULBAYVU"

Cracked message is "FABER EST SUAE QUISQUE FORTUNAE APPIUS CLAUDIUS CAECUS DICTUM ARCNUM EST NEUTRON"
solution: shiftString 19 msg

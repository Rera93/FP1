> {-# LANGUAGE UnicodeSyntax #-}
> module Numeral
> where
> import Unicode

> type Base   =  Integer
> type Digit  =  Integer

> msdf :: Base -> [Digit] -> Integer
> msdf base = foldl (\a d -> base * a + d) 0 

> lsdf :: Base -> [Digit] -> Integer
> lsdf base = foldr (\d a -> d + base * a) 0

msdf, lsdf :: Base -> [Digit] -> Integer

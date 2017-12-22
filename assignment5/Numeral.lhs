> {-# LANGUAGE UnicodeSyntax #-}
> module Numeral
> where
> import Unicode

> type Base   =  Integer
> type Digit  =  Integer

msdf, lsdf :: Base -> [Digit] -> Integer

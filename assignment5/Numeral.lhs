> {-# LANGUAGE UnicodeSyntax #-}
> module Numeral
> where
> import Unicode

> type Base   =  Integer
> type Digit  =  Integer

5.2.1

> msdf :: Base -> [Digit] -> Integer
> msdf base = foldl (\a d -> base * a + d) 0 

> lsdf :: Base -> [Digit] -> Integer
> lsdf base = foldr (\d a -> d + base * a) 0

5.2.2

foldl can be expressed as foldr since no matter how right
foldr leans, there will be a point it comes back left again.

foldl :: (a -> b -> a) -> a -> [b] -> a
foldl f a bs = foldr (\b g x -> g (f x b)) id bs a

The vice verse is not true, since foldr can work on infinite 
lists, whereas foldl never does.

However, for finite lists, foldr can be written as a foldl

foldr :: (b -> a -> a) -> a -> [b] -> a
foldr f a bs = foldl (\g b x -> g (f b x)) id bs a


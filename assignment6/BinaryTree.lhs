> {-# LANGUAGE UnicodeSyntax #-}
> module BinaryTree
> where
> import Unicode

> data Tree elem = Empty | Node (Tree elem) elem (Tree elem)

> instance (Eq elem) => Eq (Tree elem) where 
>  Empty == Empty      = True
>  Empty == Node _ _ _ = False
>  Node _ _ _ == Empty = False
>  Node l1 n1 r1 == Node l2 n2 r2 = l1 == l2 && n1 == n2 && r1 == r2  

> instance (Ord elem) => Ord (Tree elem) where
>  Empty <= Empty = False
>  Empty <= Node _ _ _ = True
>  Node _ _ _ <= Empty = False 
>  Node l1 n1 r1 <= Node l2 n2 r2 = l1 <= l2 && n1 <= n2 && r1 <= r2 

> instance Functor Tree where
>   fmap _f Empty         =  Empty
>   fmap f  (Node l a r)  =  Node (fmap f l) (f a) (fmap f r)


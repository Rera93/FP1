> {-# LANGUAGE UnicodeSyntax #-}
> module RedBlackTree
> where
> import Unicode
> import QuickTest

> data RedBlackTree elem
>   =  Leaf
>   |  Red    (RedBlackTree elem) elem (RedBlackTree elem)
>   |  Black  (RedBlackTree elem) elem (RedBlackTree elem)
>   deriving (Show)

> registry  ∷  RedBlackTree String
> registry  =  Black (Red Leaf "Peter" Leaf) "Ralf" (Red Leaf "Stan" Leaf)


> instance Functor RedBlackTree where
>   fmap _f (Leaf)         =  Leaf
>   fmap f  (Red l a r)    =  Red (fmap f l) (f a) (fmap f r)
>   fmap f  (Black l a r)  =  Black (fmap f l) (f a) (fmap f r)

> member ∷ (Ord elem) ⇒ elem → RedBlackTree elem → Bool
> member _ Leaf = False
> member e (Red l a r) 
>       | e == a = True
>       | e < a = member e l
>       | otherwise = member e r
> member e (Black l a r) 
>       | e == a = True
>       | e < a = member e l
>       | otherwise = member e r



> insert ∷ (Ord elem) ⇒ elem → RedBlackTree elem → RedBlackTree elem
> insert x Leaf = black Leaf x Leaf
> insert x (Black l n r) 
>         | x == n = black l n r
>         | x < n = black (insert x l) n r
>         | otherwise = black l n black (insert x r)
> insert x (Red l n r) 
>         | x == n = black l n r
>         | x < n = black (insert x l) n r
>         | otherwise = black (l n (black insert x r))



> black ∷ RedBlackTree elem → elem → RedBlackTree elem → RedBlackTree elem
> black (Leaf) e (Leaf) = (Black Leaf e Leaf)
> black (Leaf) e (Black l n r) = (Red Leaf e (Black l n r))
> black (Black l n r) e (Leaf) = (Red (Black l n r) e Leaf)
> black (Black l1 n1 r1) e (Black l n r) = (Red (Black l1 n1 r1) e (Black l n r))
> black (Leaf) e (Red l n r) = (Black Leaf e (Red l n r))
> black (Red l n r) e (Leaf) = (Black (Red l n r) e Leaf)
> black (Red l1 n1 r1) e (Red l n r) = (Black (Red l1 n1 r1) e (Red l n r))

isRedBlackTree ∷ RedBlackTree elem → Bool
redBlackTrees ∷ [elem] → Probes (RedBlackTree elem)

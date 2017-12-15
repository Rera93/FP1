> {-# LANGUAGE UnicodeSyntax #-}
> module RedBlackTree
> where
> import Unicode
> import QuickTest

> data Color = R | B deriving (Show)

> data RedBlackTree elem
>   =  Leaf | Node Color (RedBlackTree elem) elem (RedBlackTree elem)
>   deriving (Show)

> testRBTree :: RedBlackTree Int 
> testRBTree = Node B (Node R Leaf 4 Leaf) 7 (Node R Leaf 10 Leaf)

 instance Functor RedBlackTree where
   fmap _f (Leaf)         =  Leaf
   fmap f  (Red l a r)    =  Red (fmap f l) (f a) (fmap f r)
   fmap f  (Black l a r)  =  Black (fmap f l) (f a) (fmap f r)

> member :: (Ord elem) => elem -> RedBlackTree elem -> Bool
> member x Leaf = False
> member x (Node _ l n r)
>  | x < n     = member x l
>  | x == n    = True
>  | otherwise = member x r

 insert :: (Ord elem) => elem -> RedBlackTree elem -> RedBlackTree elem
 insert x s = makeBlack $ ins s
  where ins E  = T R E x E
        ins (T color a y b)
          | x < y  = balance color (ins a) y b
          | x == y = T color a y b
          | x > y  = balance color a y (ins b)
        makeBlack (T _ a y b) = T B a y b

member ∷ (Ord elem) ⇒ elem → RedBlackTree elem → Bool
insert ∷ (Ord elem) ⇒ elem → RedBlackTree elem → RedBlackTree elem
black ∷ RedBlackTree elem → elem → RedBlackTree elem → RedBlackTree elem
isRedBlackTree ∷ RedBlackTree elem → Bool
redBlackTrees ∷ [elem] → Probes (RedBlackTree elem)

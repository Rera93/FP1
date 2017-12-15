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

> insert :: (Ord elem) => elem -> RedBlackTree elem -> RedBlackTree elem
> insert x rbTree = makeRootBlack $ ins rbTree
>  where ins Leaf  = Node R Leaf x Leaf
>        ins (Node color l n r)
>          | x < n  = balance color (ins l) n r
>          | x == n = Node color l n r
>          | x > n  = balance color l n (ins r)
>        makeRootBlack (Node _ l n r) = Node B l n r

> balance :: Color -> RedBlackTree elem -> elem -> RedBlackTree elem -> RedBlackTree elem
> balance B (Node R (Node R a x b) y c) z d = Node R (Node B a x b) y (Node B c z d)
> balance B (Node R a x (Node R b y c)) z d = Node R (Node B a x b) y (Node B c z d)
> balance B a x (Node R (Node R b y c) z d) = Node R (Node B a x b) y (Node B c z d)
> balance B a x (Node R b y (Node R c z d)) = Node R (Node B a x b) y (Node B c z d)
> balance color a x b = Node color a x b

isRedBlackTree ∷ RedBlackTree elem → Bool
redBlackTrees ∷ [elem] → Probes (RedBlackTree elem)

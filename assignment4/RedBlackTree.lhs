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
> testRBTree = Node B (Node B (Node R Leaf 4 Leaf) 7 Leaf) 9 (Node B Leaf 10 Leaf)

 instance Functor RedBlackTree where
   fmap _f (Leaf)         =  Leaf
   fmap f  (Red l a r)    =  Red (fmap f l) (f a) (fmap f r)
   fmap f  (Black l a r)  =  Black (fmap f l) (f a) (fmap f r)

5.1

> member :: (Ord elem) => elem -> RedBlackTree elem -> Bool
> member x Leaf = False
> member x (Node _ l n r)
>  | x < n     = member x l
>  | x == n    = True
>  | otherwise = member x r

5.2

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

5.3

Testing Values
{

> redCondTree :: RedBlackTree Int
> redCondTree = Node B (Node R (Node R Leaf 4 Leaf) 7 Leaf) 9 (Node B Leaf 10 Leaf)

> blackCondTree :: RedBlackTree Int 
> blackCondTree = Node B (Node B (Node R Leaf 4 Leaf) 7 Leaf) 9 (Node R Leaf 10 Leaf) 

> redRootTree :: RedBlackTree Int
> redRootTree = Node R (Node B (Node R Leaf 4 Leaf) 7 Leaf) 9 (Node B Leaf 10 Leaf)

> notSearchTree :: RedBlackTree Int
> notSearchTree = Node R (Node B (Node R Leaf 9 Leaf) 4 Leaf) 10 (Node B Leaf 7 Leaf)

}

> redInvariant :: RedBlackTree a -> Bool
> redInvariant Leaf = True
> redInvariant (Node B l _ r) =  redInvariant l && redInvariant r
> redInvariant (Node R l _ r) =  isNotRed l && isNotRed r && redInvariant l && redInvariant r

> isNotRed :: RedBlackTree a -> Bool
> isNotRed Leaf               = True
> isNotRed (Node B _ _ _)     = True
> isNotRed (Node R _ _ _)     = False 

> blackInvariant :: RedBlackTree a -> Bool
> blackInvariant Leaf           = True
> blackInvariant (Node _ l _ r) =  blackDepth l == blackDepth r && blackInvariant l && blackInvariant r
>      where
>        blackDepth :: RedBlackTree a -> Int
>        blackDepth Leaf           = 0
>        blackDepth (Node B l _ r) = 1 + blackDepth l
>        blackDepth (Node R l _ r) = blackDepth l

> checkRoot :: RedBlackTree a -> Bool
> checkRoot Leaf               = True
> checkRoot (Node B _ _ _)     = True
> checkRoot (Node R _ _ _)     = False

> inorder :: (Ord elem) => RedBlackTree elem -> [elem]
> inorder Leaf         = []
> inorder (Node _ l n r)  = inorder l ++ [n] ++ inorder r

> isSearchTree :: (Ord elem) => RedBlackTree elem -> Bool
> isSearchTree Leaf = True
> isSearchTree (Node c l n r) = ascendingList (inorder (Node c l n r))  

> ascendingList :: (Ord a) => [a] -> Bool
> ascendingList [] = True
> ascendingList [x] = True
> ascendingList (x:y:xs) = x <= y && ascendingList (y:xs)

> isRedBlackTree :: (Ord elem) => RedBlackTree elem -> Bool
> isRedBlackTree rbt = blackInvariant rbt  && redInvariant rbt && checkRoot rbt && isSearchTree rbt

redBlackTrees ∷ [elem] → Probes (RedBlackTree elem)

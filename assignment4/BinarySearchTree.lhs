> {-# LANGUAGE UnicodeSyntax #-}
> module BinarySearchTree
> where
> import Unicode
> import BinaryTree hiding (member)
> import QuickTest

> registry  :: Tree String
> registry  =  Node (Node (Node Empty "Frits" Empty) "Peter" Empty) "Ralf" Empty

4.1

> member :: (Ord elem) => elem -> Tree elem -> Bool
> member _ Empty = False 
> member x (Node l n r) 
>   | x == n = True  
>   | x < n  = member x l 
>   | x > n  = member x r

4.2 

> insert :: (Ord elem) => elem -> Tree elem -> Tree elem
> insert x Empty = singleton x
> insert x (Node l n r) 
>   | x == n = Node l x r 
>   | x < n  = Node (insert x l) n r
>   | x > n  = Node l n (insert x r)

4.3

> delete :: (Ord elem) => elem -> Tree elem -> Tree elem
> delete _ Empty = Empty 
> delete x (Node l n r)
>  | x == n = deleteParent (Node l x r) 
>  | x < n  = Node (delete x l) n r
>  | x > n  = Node l n (delete x r)

> deleteParent :: (Ord a) => Tree a -> Tree a 
> deleteParent (Node Empty n r) = r
> deleteParent (Node l n Empty) = l
> deleteParent (Node l n r) = (Node l n' r) 
> 	where 
>	 n' = leftistElement r

> leftistElement :: (Ord a) => Tree a -> a
> leftistElement (Node Empty n _) = n
> leftistElement (Node l _ _) = leftistElement l


insert ∷ (Ord elem) ⇒ elem → Tree elem → Tree elem
delete ∷ (Ord elem) ⇒ elem → Tree elem → Tree elem

isSearchTree ∷ (Ord elem) ⇒ Tree elem → Bool
trees ∷ [elem] → Probes (Tree elem)  -- should be defined in BinaryTree

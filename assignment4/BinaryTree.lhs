> {-# LANGUAGE UnicodeSyntax #-}
> module BinaryTree
> where
> import Unicode

> data Tree elem = Empty | Node (Tree elem) elem (Tree elem)
>   deriving (Show)

> instance Functor Tree where
>   fmap _f Empty         =  Empty
>   fmap f  (Node l a r)  =  Node (fmap f l) (f a) (fmap f r)

> ex1  ::  Tree Integer
> ex1  =  Node Empty 4711 (Node Empty 0815 (Node Empty 42 Empty))
> ex2  ::  Tree String
> ex2  =  Node (Node (Node Empty "Frits" Empty) "Peter" Empty) "Ralf" Empty
> ex3  ::  Tree Char
> ex3  =  Node (Node Empty 'a' Empty) 'k' (Node Empty 'z' Empty)

1.1

> givenTree :: Tree Char 
> givenTree =  Node (Node Empty 'a' (Node Empty 'b' Empty)) 'c' (Node (Node Empty 'd' Empty) 'f' (Node Empty 'g' Empty))

1.2 

Node Empty 4711 (Node Empty 0815 (Node Empty 42 Empty)) 

{ 4711 is the root. It contains only one child on the right being 0815.
  0815 has also one child on the right being 42.
  42 has no children. }

Node (Node (Node Empty "Frits" Empty) "Peter" Empty) "Ralf" Empty

{ "Ralf" is the root containing only one child on the left being "Peter".
  "Peter" has also one child on the left being "Frits".
  "Frits" has no children. }

Node (Node Empty ’a’ Empty) ’k’ (Node Empty ’z’ Empty)

{ 'k' is the root and it contains two children being 'a' on the left 
  and 'z' on the right. 'a' and 'z' have no children. }

1.3 

> size :: Tree elem -> Int
> size Empty         = 0
> size (Node l _ r)  = size l + 1 + size r

1.4

> maxHeight :: Tree elem -> Int 
> maxHeight Empty         = 0
> maxHeight (Node l _ r)  = size l `max` size r

> minHeight :: Tree elem -> Int 
> minHeight Empty         = 0
> minHeight (Node l _ r)  = size l `min` size r

1.5 

To find the min/max height, the size function is used. 
The max height of a binary tree can be defined throught the number of
nodes of the longest path. The min height is found through the number 
of nodes of the shortest path. The size is used to determing the number
of nodes in each situation.



member ∷ (Eq elem) ⇒ elem → Tree elem → Bool
preorder, inorder, postorder ∷ Tree elem → [elem]
layout ∷ (Show elem) => Tree elem → String
build ∷ [elem] → Tree elem
balanced ∷ [elem] → Tree elem
create ∷ Int → Tree ()

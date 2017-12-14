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

> capture :: Tree Char 
> capture =  Node (Node Empty 'a' (Node Empty 'b' Empty)) 'c' (Node (Node Empty 'd' Empty) 'f' (Node Empty 'g' Empty))

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



size ∷ Tree elem → Int
minHeight, maxHeight ∷ Tree elem → Int
member ∷ (Eq elem) ⇒ elem → Tree elem → Bool
preorder, inorder, postorder ∷ Tree elem → [elem]
layout ∷ (Show elem) => Tree elem → String
build ∷ [elem] → Tree elem
balanced ∷ [elem] → Tree elem
create ∷ Int → Tree ()

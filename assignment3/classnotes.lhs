> data Tree elem = Empty
> 				| Node (Tree elem) elem (Tree elem)
> 				deriving Show


Node (Node Empty 'a' Empty) 'b' Empty :: Tree Char

Data types describe data.


> tree :: (Integer, Integer) -> Tree Integer
> tree (l, r) 
>		| l > r = Empty
>		| otherwise = Node (tree (l, r-1)) r Empty


Tree is a container type. Evert data type comes with a pattern match

Skeleton

f :: Tree elem -> S
f Empty         = ....
f (Node l a r)  = ......f l ..... f r ....

> size :: Tree elem -> Integer
> size Empty      = 0
> size (Node l a r) = size l + 1 + size r

> height :: Tree elem -> Integer
> height Empty      = 0
> height (Node l a r) = 1 + (size l `max` size r)

> member :: (Eq elem) => elem -> Tree elem -> Bool
> member x Empty        = False
> member x (Node l a r) = x == a || member x l || member x r

Difference from Java, creates a new tree as result after insertion.

data RBTree elem = Empty | Node Colour (RBTree elem) elem (RBTree elem)
data Colour = Red | Black
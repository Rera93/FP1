> {-# LANGUAGE UnicodeSyntax #-}
> module MapReduce
> where
> import Prelude hiding (Monoid)
> import Unicode
> import Hardware

> class Monoid a where
>   ε    ∷  a
>   (•)  ∷  a → a → a

2.1

Out of the 16 cantidates only 4 of them fullfil the monoid requirements
AND, OR, XOR and XNOR

> newtype All = All { getAll :: Bool }
> instance Monoid All where
>    mempty                  = All True
>    mappend (All p) (All q) = All (p && q)

> newtype Any = Any { getAny :: Bool }
> instance Monoid Any where
>    mempty                  = Any False
>    mappend (Any p) (Any q) = Any (p || q)

> xor :: Bool -> Bool -> Bool
> xor True q = not q
> xor _    q = q

> newtype OnlyOne = OnlyOne { getOnlyOne :: Bool }
> instance Monoid OnlyOne where
>    mempty                          = OnlyOne False
>    mappend (OnlyOne p) (OnlyOne q) = OnlyOne (xor p q)

> eqv :: Bool -> Bool -> Bool
> eqv True q = q
> eqv _    q = not q

> newtype AllOrNone = AllOrNone { getAllOrNone :: Bool }
> instance Monoid AllOrNone where
>    mempty                              = AllOrNone True
>    mappend (AllOrNone p) (AllOrNone q) = AllOrNone (eqv p q)

2.2 

Reduce consists of folding those elements, so that in the end we produce just
one element.

And and Or are already predefined in different names.








> reduce  ∷  (Monoid m) ⇒ [m] → m
> reduce  =  foldr (•) ε

instance Monoid Bool where

> newtype OrdList elem = Ord [elem]

instance (Ord elem) ⇒ Monoid (OrdList elem) where

foldm ∷ (a → a → a) → a → ([a] → a)

> kpg ∷ (Bit, Bit) → (Carry → Carry)
> kpg (O,  O  )  =  \ _c  → O  -- kill
> kpg (O,  I  )  =  \ c   → c  -- propagate
> kpg (I,  O  )  =  \ c   → c  -- propagate
> kpg (I,  I  )  =  \ _c  → I  -- generate

> data KPG  =  K | P | G

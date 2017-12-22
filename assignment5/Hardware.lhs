> {-# LANGUAGE UnicodeSyntax #-}
> module Hardware
> where
> import Unicode

> data Bit  =  O | I
>   deriving (Eq, Ord, Show)

> infixr 3 &
> (&) ∷ Bit → Bit → Bit
> O & _b  =  O
> I & b   =  b

> infixr 2 !
> (!) ∷ Bit → Bit → Bit
> O ! b   =  b
> I ! _b  =  I

> infixr 4 ⊕
> (⊕) ∷ Bit → Bit → Bit
> O ⊕ O  =  O
> O ⊕ I  =  I
> I ⊕ O  =  I
> I ⊕ I  =  O

mapr ∷ ((a, state) → (b, state)) → (([a], state) → ([b], state))

> type Carry  =  Bit

> halfAdder :: (Bit, Bit) -> (Bit, Carry)
> halfAdder (bitA, bitB)  =  (bitA ⊕ bitB, bitA & bitB) 

> fullAdder :: ((Bit, Bit), Carry) -> (Bit, Carry)
> fullAdder ((bitA, bitB), carryIn) =
>  (((bitA ⊕ bitB) ⊕ carryIn), (bitA & bitB) ! ((bitA ⊕ bitB) & carryIn)) 

fullAdder ∷ ((Bit, Bit), Carry) → (Bit, Carry)

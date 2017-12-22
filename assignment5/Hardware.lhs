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

5.6.1

 type Sig = [Bit]
 type Sig2 = (Sig, Sig)

 add2 :: Sig2 -> Sig2 -> Sig -> (Sig,Sig2)
 add2 (a1,a0) (b1,b0) cin =
    let (c0,s0) = addS a0 b0 cin
        (c1,s1) = addS a1 b1 c0
    in (c1,(s1,s0))

 mapr :: ((a, state) -> (b, state)) -> (([a], state) -> ([b], state))
 mapr f (x:xs, st)= foldr (\y a -> (f y) : a) [] xs


5.6.2

> type Carry  =  Bit

> halfAdder :: (Bit, Bit) -> (Bit, Carry)
> halfAdder (bitA, bitB)  =  (bitA ⊕ bitB, bitA & bitB) 

> fullAdder :: ((Bit, Bit), Carry) -> (Bit, Carry)
> fullAdder ((bitA, bitB), carryIn) =
>  (((bitA ⊕ bitB) ⊕ carryIn), (bitA & bitB) ! ((bitA ⊕ bitB) & carryIn)) 


> {-# LANGUAGE UnicodeSyntax #-}
> module Expression
> where
> import Prelude hiding (fail)
> import Unicode ()
> import Parser

> infixl 6 :+:
> infixl 7 :*:


> data Expr
>   =  Lit Integer    -- a literal
>   |  Expr :+: Expr  -- addition
>   |  Expr :*: Expr  -- multiplication
>   deriving (Show)

An expression parser using >>=.

> expr, term, factor ∷ Parser Expr
> expr    =   term
>         .|  (term >>= \ i → symbol '+' >> expr >>= \ j → return (i :+: j))
> term    =   factor
>         .|  (factor >>= \ i → symbol '*' >> term >>= \ j → return (i :*: j))
> factor  =   (many1 digit >>= \ ds → return (Lit (read ds)))
>         .|  (symbol '(' >> expr >>= \ i → symbol ')' >> return i)

Using do-notation.

> expr', term', factor' ∷ Parser Expr
> expr'    =   do term'
>          .|  do i ← term' ;symbol '+' ; j ← expr' ; return (i :+: j)
> term'    =   do factor'
>          .|  do i ← factor' ; symbol '*' ; j ← term' ; return (i :*: j)
> factor'  =   do ds ← many1 digit ; return (Lit (read ds))
>          .|  do symbol '(' ; i ← expr' ; symbol ')' ; return i



5.3.1 The first grammar has recursion on the right, which can be handled by the defined parser, whereas the new grammar (expre) also has left recursion, which in turn leads to an infinite loop.

> expre ∷ Parser Expr
> expre    =   do ds ← many1 digit ; return (Lit (read ds))
>          .|  do i ← expre ; symbol '+' ; j ← expre ; return (i :+: j)
>          .|  do i ← expre ; symbol '*' ; j ← expre ; return (i :*: j)
>          .|  do symbol '(' ; i ← expre ; symbol ')' ; return i

Improvement in performance

5.3.2 After trying a few examples we observed that there was not a big difference in execution time, but actually we saw a great difference in the memory consumption.

With the simplest test 4*71+1 using the original expr' it consumed 321,136 bytes, whereas the exprImp one: 225,080.

For "5112312312*(4*710+212421)*(1*2123+22)": expr' consumed 2,862,680 bytes
                                             exprImp consumed 531,096 bytes

> exprImp, termImp, factorImp ∷ Parser Expr
> exprImp = do i <- termImp
>              do symbol '+'
>                 j <- factorImp
>                 return (i :+: j)
>               .| return i
> termImp = do i <- factorImp
>              do symbol '*'
>                 j ← termImp
>                 return (i :*: j)
>               .| return i
> factorImp  =   do ds ← many1 digit ; return (Lit (read ds))
>            .|  do symbol '(' ; i ← exprImp ; symbol ')' ; return i




parse expr "4*71+1"
parse expr "4 * 71 + 1"

Exercise 1.2

1.

    insertionSort( 7 : ( 9 : ( 2 : [] )))
    { definition of insertionSort | x as 7 and xs as 9 : ( 2 : [] ) }
=>  insert 7 ( insertionSort ( 9 : ( 2 : [] )))
    { definition of insertionSort | x as 9 and xs as 2 : [] } 
=>  insert 7 ( insert 9 ( insertionSort ( 2 : [] )))
    { definition of insertionSort | x as 2 and xs as []
=>  insert 7 ( insert 9 ( insert 2 (insertionSort [] )))
    { definition of insertionSort | empty list }
=>  insert 7 ( insert 9 ( insert 2 [] ))
    { definition of insert | a as 2 and empty list }
=>  insert 7 ( insert 9 ( 2 : [] ))
    { definition of insert | a as 9, b as 2 and xs as []. a > b }
=>  insert 7 ( 2 : (insert 9 [] ))
    { definition of insert | a as 9 and empty list }
=>  insert 7 ( 2 : (9 : [] ))
    { definition of insert | a as 7, b as 2 and xs as 9 : []. a > b } 
=>  2 : ( insert 7 (9 : [] ))
    { definition of insert | a as 7, b as 9 and xs as []. a < b }
=>  2 : ( 7 : ( 9 : [] )) 

2.

    twice (+1) 0  {apply (+1) to 0 twice }              
    { 1 + (1 + 0) }  
=>  2
    twice twice (*2) 1 
    { twice (twice (*2)) 1       - apply twice (*2) to 1 twice }
    { twice (*2) (twice (*2) 1)  - solve for second twice, apply (*2) to 1 twice }
    { twice (*2) (2 * ( 2 * 1 )) - result of second twice will be 4 }
    { twice (*2) 4               - solve for remaining twice, apply (*2) to 4 twice }
    { 2 * (2 * 4)                - result for remaining twice will be 16 }
=>  16

    Replace (" | " ++) "" with (+1) 0

    twice                         -> 2            -> 2^1    -> 2^(2^0)
    twice twice                   -> 4            -> 2^2    -> 2^(2^1)
    twice twice twice             -> 16           -> 2^4    -> 2^(2^2)
    twice twice twice twice       -> 65536        -> 2^16   -> 2^(2^4)
    twice (twice twice)           -> 16
    twice twice (twice twice)     -> 256
    twice (twice (twice twice))   -> 256 

    Note: 
    { twice twice twice == twice (twice twice) }
    { twice twice (twice twice) == twice (twice (twice twice))}

Exercise 1.3

1. 

     twice = \f -> \x -> f (f x)

     twice (+1) 0   { apply (+1) to 0 twice }
     { (\x -> 1 + (1 + x)) 0 => 1 + (1 + x) {x:= 0} => 1 + (1 + 0) => 2  }
=>   4

     twice twice (*2) 1  
     { twice (twice (*2)) 1       - apply twice (*2) to 1 twice }
     { twice (*2) (twice (*2) 1)  - solve for second twice, apply (*2) to 1 twice }
     { twice (*2) (\x -> 2 * (2 * x) 1 => 2 * (2 * x) {x:= 1} => 2 * (2 * 1) => 4  ) }
     { twice (*2) 4               - solve for remaining twice, apply (*2) to 4 twice }}
     { (\x -> 2 * (2 * x)) 4 => 2 * (2 * x) {x:= 4} => 2 * (2 * 4) => 16  }
=>   16

2.  

     (twice twice) (*2) 1 == twice (twice (*2)) 1 

     Type of twice =>   (t -> t) -> t -> t



Exercise 1.4

1.

Infix notation is problematic for both human readers and source code formatters.
The reader doesn't know the precedences of custom infix operators, he has to read
the modules from which the operators are imported from. This is even more difficult
because infix operators are usually imported unqualified, that is you don't know from
which module an operator is imported. The same problem arises for source code formatters. 

Prefix notation will solve precedence ambiguity in case of multiple operators. 
In other words, Prefix has to be used if operation is not associative while Infix
shines when operation is associative.

2.

Question unclear !

3. 

The fixity declaration infixr . will determine that . associates to the right. Therefore, the previous 
operation will binary numbers 1 . 0 . 1 . 1 will equal 13 instead of 11 and (1 . 1 . 0) + 4711 will equal 
4714 instead of 4717.

4. 

(((f x) >= 0) && a) || (((((g x) y) * 7) + 10) == (b - 5))
Exercise 1.2.1

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

Exercise 1.2.2

    twice (+1) 0 
    { 1 + (1 + 0) } 
=>  2

    twice twice (*2) 1 
    { twice (*2) 1 = 2 * ( 2 * 1 ) = 4 } 
    { the second twice will raise 4 to the power of 2 }
=>  16

Exercise 1.4

1.

Infix notation is problematic for both human readers and source code formatters. The reader doesn't know the precedences of custom infix operators, he has to read the modules from which the operators are imported from. This is even more difficult because infix operators are usually imported unqualified, that is you don't know from which module an operator is imported. The same problem arises for source code formatters. 

Prefix notation will solve precedence ambiguity in case of multiple operators. In other words, Prefix has to be used if operation is not associative while Infix shines when operation is associative.

2.

Question unclear !

3. 

The fixity declaration infixr . will determine that . associates to the right. Therefore, the previous 
operation will binary numbers 1 . 0 . 1 . 1 will equal 13 instead of 11 and (1 . 1 . 0) + 4711 will equal 
4714 instead of 4717.

4. 

(((f x) >= 0) && a) || (((((g x) y) * 7) + 10) == (b - 5))




 
   

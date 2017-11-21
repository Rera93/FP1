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
   

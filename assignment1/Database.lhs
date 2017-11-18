>{-# LANGUAGE UnicodeSyntax #-} 

> module Database
> where
> import Unicode

> type Person  =  (Name, Age, FavouriteCourse, Colour)
> type Name             =  String
> type Age              =  Integer
> type FavouriteCourse  =  String
> type Colour           =  String

> frits, peter, ralf, brigel :: Person
> frits  =  ("Frits",  33,  "Algorithms and Data Structures", "Yellow")
> peter  =  ("Peter",  57,  "Imperative Programming", "Blue")
> ralf   =  ("Ralf",   33,  "Functional Programming", "Red")
> brigel =  ("Brigel", 24,  "Embedded Systems", "Green")  
 
> students   ::  [Person]
> students   =  [frits, peter, ralf, brigel]

> age :: Person -> Age
> age (_n, a, _c, _cl)  =  a

> name :: Person -> Name
> name (n, _a, _c, _cl) = n

> favouriteCourse  :: Person -> FavouriteCourse
> favouriteCourse (_n, _a, c, _cl) = c

> showPerson :: Person -> String
> showPerson (n, a, c, cl) = n ++ " " ++ show a ++ " " ++ c ++ " " ++ cl 

> twins :: Person -> Person -> Bool
> twins (_n1, a1, _c1, _cl1) (_n2, a2, _c2, _cl2) = if a1 == a2 then True else False 

> increaseAge :: Person -> Person 
> increaseAge (n, a, c, cl) = (n, a + 1, c, cl)
 
name             ∷ Person → Name
favouriteCourse  ∷ Person → FavouriteCourse
showPerson       ∷ Person → String
twins            ∷ Person → Person → Bool
increaseAge      ∷ Person → Person

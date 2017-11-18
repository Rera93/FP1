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
 
name             ∷ Person → Name
favouriteCourse  ∷ Person → FavouriteCourse
showPerson       ∷ Person → String
twins            ∷ Person → Person → Bool
increaseAge      ∷ Person → Person

<<<<<<< HEAD
=======
> {-# LANGUAGE UnicodeSyntax #-}

>>>>>>> 1809607e199811b67e7a9863d5b08034af005a71
> module WordList
> where
> import Prelude hiding (Word)
> import Unicode
> import Data.List

> type Word  =  String

> lorem :: String
> lorem
>   = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam \
>     \nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam \
>     \erat, sed diam voluptua. At vero eos et accusam et justo duo dolores \
>     \et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est \
>     \Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur \
>     \sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et \
>     \dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam \
>     \et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea \
>     \takimata sanctus est Lorem ipsum dolor sit amet."


<<<<<<< HEAD
> wordList :: String -> [(Word, Int)]
> wordList someWord    = count group . sort . words someWord

> count :: [[String]] -> [(Word, Int)]
> count x              = (x, map length x)
=======
> wordList ∷ String → [(Word, Int)]
> wordList (s) = sortOn snd (zip (map head (group (sort (words lorem)))) (map length (group (sort (words lorem)))))

>>>>>>> 1809607e199811b67e7a9863d5b08034af005a71

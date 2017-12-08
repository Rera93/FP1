> module DNA
> where
> import Prelude hiding (filter)
> import Unicode
> import List 

Nucleobases or DNA-bases are the basic building blocks of
deoxyribonucleic acid (DNA).

> data Base  =  A | C | G | T
>   deriving (Eq, Ord)

Adenin (A), Cytosin (C), Guanin (G) und Thymin (T).

> instance Show Base where
>   showsPrec _ A  =  showChar 'A'
>   showsPrec _ C  =  showChar 'C'
>   showsPrec _ G  =  showChar 'G'
>   showsPrec _ T  =  showChar 'T'
>
>   showList  =  foldr (.) id . map shows

> base :: Char -> Maybe Base
> base 'A'  =  Just A
> base 'C'  =  Just C
> base 'G'  =  Just G
> base 'T'  =  Just T
> base _    =  Nothing

> type DNA      =  [Base]
> type Segment  =  [Base]

> dna  ::  DNA
> dna  =  [A, T, G, T, A, A, A, G, G, G, T, C, C, A, A, T, G, A]

> mm  ::  DNA
> mm  =  filter base
>    "ATGTAAAGGGTCCAATGACTGGAATTACTTCACAGCCCTGACACTGTGGAGAGATGGATA\
>    \CCAGTTTAATTATGGACAGCTGAGAATAATCTGGGAGTCACCTGCTCTGGATATTTATCA\
>    \TCATTATGAACTTCTCACCAGGCTGTGGCCCGAACACTTTCATAACGTCCCATTTGTGTT\
>    \GGGCAGACATTATGATCTATACAGAACCTGCCTTGTCTGTCACCTTTGAATTTATGGATA\
>    \GACAATTTAATAT\
>    \GTGTTCCTGGCAGCAAAGATAATCATGGAGAGTGGAGAGAAACTAACCTTACCATTGATA\
>    \GGGAAACTCTTGAAGTGTCAACTTCTCCATATTAAATCCAAGGACCAGCAGAGACGAGAA\
>    \AATGAAAAGAAGATGGTAGAAGAAAGAACAAAATCAGAAAAAGACAAAGGAAAAGGGAAG\
>    \TCTCCAAAGGAGAAGAAAGTTGCCAGTGCCAAGCCTGGGAAGGGAAAGAGCAAGGACCAG"

> readDNA :: FilePath -> IO [Base]
> readDNA path
>   =  do  x <- readFile path
>          return (filter base x)

> tails :: [a] -> [[a]]
> tails [] = []
> tails (x:xs) = xs : tails xs

`any` is applied to a predicate and a list. It determines if any element of
the list satisfies the predicate.  

> contains :: Segment -> DNA -> Bool
> contains seg strand = any (isPrefixOf seg) (tails strand)

> isPrefixOf :: Segment -> DNA -> Bool
> isPrefixOf [] _         =  True
> isPrefixOf _  []        =  False
> isPrefixOf (x:xs) (y:ys)=  x == y && isPrefixOf xs ys

alan's

 contains ∷ Segment → DNA → Bool
 contains s dnaSeq = checkSeq s (tails (dnaSeq))

 checkSeq :: Segment → [Base] -> Bool
 checkSeq s _ = False
 checkSeq s (x:xs) 
               | s == x = True 
               | otherwise = checkSeq s xs

contains            ∷ Segment → DNA → Bool
longestOnlyAs       ∷ DNA → Integer
longestAtMostTenAs  ∷ DNA → Integer

If you want to test your code on a larger example, say within GHCi

dna <- readDNA "mm1.dna"
longestOnlyAs dna

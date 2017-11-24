> numbers :: [String]
> numbers = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]

> nouns :: [String]
> nouns  = ["thumb", "shoe", "knee", "door", "hive", "sticks", "heaven", "gate", "spine", "again"]

> thisOldMan :: String
> thisOldMan = createThisOldMan numbers nouns

> createThisOldMan :: [String] -> [String] -> String
> createThisOldMan [] []  = []
> createThisOldMan (nu:nus) (no:nos) = "This old man, he played " ++ (nu) ++ ", \n" ++
> 				"He played knick-knack on my " ++  (no) ++ "; \n" ++
>				"With a knick-knack paddywhack,\n" ++
>				"Give the dog a bone,\n" ++
>				"This old man came rolling home.\n\n" ++ (createThisOldMan (nus) (nos))


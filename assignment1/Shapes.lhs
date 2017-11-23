>{-# LANGUAGE UnicodeSyntax #-}

> module Shapes
> where
> import Unicode

> data Shape
>   =  Circle Double            -- radius
>   |  Square Double            -- length
>   |  Rectangle Double Double  -- length and width
>   deriving (Show)

> showShape :: Shape -> String
> showShape (Circle r)       =  "circle of radius " ++ show r
> showShape (Square l)       =  "square of length " ++ show l
> showShape (Rectangle l w)  =  "rectangle of length " ++ show l
>                                 ++ " and width " ++ show w

> area :: Shape -> Double
> area (Circle r)            =  pi * r * r
> area (Square l)            =  l * l 
> area (Rectangle l w)       =  l * w

> perimeter :: Shape -> Double
> perimeter (Circle r)            =  2 * pi * r
> perimeter (Square l)            =  4 * l 
> perimeter (Rectangle l w)       =  2 * (l + w)

> center :: Shape -> (Double, Double)
> center (Circle r)            =  (r, r)
> center (Square l)            =  (l * 0.5, l * 0.5) 
> center (Rectangle l w)       =  let x = l * 0.5 
>                                     y = w * 0.5 
>                                     in (x, y)

> boundingBox :: Shape -> (Double, Double)
> boundingBox (Circle r)       =  let dim = 2 * r
>                                 in (dim, dim)
> boundingBox (Square l)       =  (l, l) 
> boundingBox (Rectangle l w)  =  (w, l)

area        ∷ Shape → Double
perimeter   ∷ Shape → Double
center       ∷ Shape → (Double, Double)  -- x- and y-coordinates
boundingBox  ∷ Shape → (Double, Double)  -- width and height

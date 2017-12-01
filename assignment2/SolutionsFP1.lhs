2.1

2.1.1
4 possible functions

> id' :: Bool -> Bool
> id' True = True 
> id' False = False

> alwaysTrue :: Bool -> Bool
> alwaysTrue _ = True

> alwaysFalse :: Bool -> Bool
> alwaysFalse _ = False

> not' :: Bool -> Bool
> not' False = True
> not' True = False

2.1.2

16 possible functions
Since we are taking a tuple of Booleans as input, there are four possible combinations between the inputs. Foe each possible combination there are two possible outputs. Therefore, the number of total functions is 4^2 = 16.

> and' :: (Bool, Bool) -> Bool
> and' (b1, b2) = b1 && b2

> or' :: (Bool, Bool) -> Bool
> or' (b1, b2) = b1 || b2

> exOr :: (Bool, Bool) -> Bool
> exOr (b1, b2) = if (b1 == b2)
>					then False
>					else or' (b1, b2)

> notAnd :: (Bool, Bool) -> Bool
> notAnd (b1, b2) = not (and' (b1, b2))

2.1.3

Bool -> (Bool -> Bool)
Function receiving an input of type Bool and producing a function as output. The function itself takes
a Bool as an input and returns a Bool as an output.

(Bool->Bool)
True  => True, False
False => True, False
The input of the function will take either True or False. For each True input, there are 2 possible outputs True or False. 
The same applies to the False input. In other words, the function (Bool -> Bool) will produce 2^2 total functions.

Now, lets take the whole function declaration in consideration. 
Bool -> (Bool -> Bool)
The Bool input takes two values: True or False. For each True input there are 4 outputs(TT, TF, FT, FF). The same for
the False output. Therefore, in total there are 2^4(16) total functions.    


2.2.1


2.3 

The results observed indicate that the Int type has a limitation on the range of possible values due to its bit size limitation. For that reason, unexpected results are obtained when the results are too large for the type Int (out of the Int type capacity of storage) as shown in product[1..21] for example.  

As explained before, when the Int type is used, there is a limitation in how large the numbers can be, due to the fixed precision of the machine-integer. Whereas the type Integer has a greater range of values and can "hold any value" up to the machine's memory size, thus the result from the function product is correct because it is within the range of the type Integer.

The machine yelds zero because the value stored in the bits of type Int represent the number zero due to the overflow caused by the result of product [1 .. 66] :: Int.

2.4.1

swap' :: (Int, Int) -> (Int, Int)
swap' (a1, a2) = (a2, a1)

swape :: (Int, Int) -> (Int, Int)
swape (x, _) = (x, x)

swapa :: (Int, Int) -> (Int, Int)
swapa (x, y) = (x + y, x * y)

2.4.2

only the function swap' remains functional, as the expected type results are maintained

> swap' :: (a, b) -> (b, a)
> swap' (a1, a2) = (a2, a1)

The other two functions don't work
swape returns type a in the first position of the tuple and that is not allowed.

swape :: (a, b) -> (b, a)
swape (x, _) = (x, x)

swape returns a unexpected type as well according to the function definition.

swapa :: (a, b) -> (b, a)
swapa (x, y) = (x + y, x * y)

2.4.3

The first type (Int, (Char, Bool)) is a tuple that contains a Int value and a nested tuple of Char and Bool, whereas the second type (Int, Char, Bool) has a triple that holds an Int, Char and Bool value, no nested tuples involved.

> convertFormat :: (Int, (Char, Bool)) -> (Int, Char, Bool)
> convertFormat (a, (b, c)) = (a, b, c)

2.5

2.5.1

(+4): The expression is well-formed and well-typed
div : The expression is well-formed and well-typed
div 7: The expression is well-formed and well-typed
(div 7) 4: The expression is well-formed and well-typed
div (7 4): The expression is not well-formed and not well-typed
7 'div' 4: The expression is well-formed and well-typed
+ 3 7: The expression is not well-formed and well-typed
(+) 3 7: The expression is well-formed and well-typed
(b, 'b', "b"): The expression is well-formed and well-typed
(abs, 'abs', "abc"): The expression is not well-formed and not well-typed
abs.negate: The expression is well-formed and well-typed
(*3).(+3): The expression is well-formed and well-typed

2.5.2

2.5.3

i x = x                         i::x -> x
k (x, y)  x                     k::(x, y)-> x 
b (x, y, z) = (x z) y           b::(z->y->x, y, z) -> x
c (x, y, z) = x (y z)           c::(y->x, z->y, z) -> x 
s (x, y, z) = (x z) (y z)		s::(z->y->x, z->y ,z)-> x


2.6.1

a)

> fa1 :: Int -> Int
> fa1 x = x 

b)

> fb1 :: a -> a
> fb1 a = a 

c)

> fc1 :: (Int, Int) -> Int
> fc1 (a,b) = a + b

d)

> fd1 :: (a, a) -> a
> fd1 (x,y) = y

e) 

> fe1 :: (a, b) -> a
> fe1 (a, _) = a

Int -> Int   
Depending on the system (32/64 bit), the number of total 
function will be: (2^32)^(2^32) / (2^64)^(2^64) 

a -> a 
There is only one function of type a -> a, 
a.k.a the identity function.

2.6.2

a)

> fa::(a,a)->(a,a)
> fa (x,y) = (x,y)

b)

> fb::(a,b)->(b,a)
> fb (x,y) = (y,x)

c)

> fc::(a->b)->a->b
> fc x y = x y

d)

> fd::(a,x) -> a
> fd (a, _) = a

e)

> fe::(x->a->b, a, x) ->b
> fe (b, a, x) = (b x) a

f)

> ff::(a->b, x->a, x)->b
> ff (b,a,x) = b (a x)

g)

> fg::(x->a->b, x->a, x) -> b
> fg (b, a, x) = (b x) (a x)
# Chapter 2 - Summary

* **Arithmetic**
    * Works mostly as expected
        * `1 + 1 == 2`
        * `3 - 1 == 2`
        * `3 * 2 == 6`
        * `5 / 2 == 2.5`
            * Notice that the division result was **not** truncated to an integer
        * `(1 + 2) * 3 == 9`
            * It's best to **always** use parens when negating numbers. `5 * -3` will make GHCI yell at you, but `5 * (-3)` works fine
* **Boolean Algebra**
    * `&&`, `||`, and `not` for Boolean AND, OR, and NOT
    * `True` and `False` for Boolean TRUE and FALSE
        * `True && False == False`
        * `True || False == True`
        * ` not True == False`
    * `==` and `/=` for testing for EQUALITY and INEQUALITY
        * `1 + 1 == 2` evaluates to `True`
        * `5 /= 4` evaluates to `True`
* **Basic Functions**
    * **Cannot** begin with an uppercase letter
        * We'll see why layer
    * Arguments are separated from the function name and other arguments with spaces
        * e.g. `min 2 3 == 2` invokes the standard library `min` function with arguments `2` and `3`
    * Functions can be *infix* (like numerical operators `+`, `-`, etc.) or *prefix* (like `min`)
        * Prefix functions can be made infix by using backticks
            * e.g. ``min 2 3 == 2 `min` 3``
    * Defining basic functions
        * `doubleMe x = x + x` defines a function called `doubleMe` that takes a single parameter `x` and evaluates to `x + x`
        * `doubleUs x y = 2*x + 2*y` defines a function called `doubleUs` that takes two parameters `x` and `y` and evaluates to `2*x + 2*y`
            * Because Haskell is purely functional, functions can have no side effects
* **Conditionals**
    * Unlike most imperitive languages, if-statements in Haskell are really *expressions* and thus return a value
        * This therefore means that the `else` clause is mandatory
            * e.g. `lowPassFilter x thresh = if x > thresh then thresh else x`
* **Lists**
    * *Homogeneous* data structures (i.e. stores several elements of the same type)
    * Strings are just lists of characters
    * Defined using brackets
        * `l = [1,2,3,4,5]` or `let l = [1,2,3,4,5]` (in GHCi)
    * Lists are concatenated with the `++` operator
        * e.g. `[1,2,3,4,5] ++ [6,7,8,9,10]` is `[1,2,3,4,5,6,7,8,9,10]`
        * Concatenation is a linear-time operation, however, so avoid it when one or both of the lists is long
    * For instant concatenation of a *single* iten to the *front* of a list, use the *cons* operator `:`
        * e.g. `1:[2,3,4]` is `[1,2,3,4]`
    * Lists use zero-based indexing. Use the `!!` operator to index into them.
        * e.g. `[1,2,3] !! 0` is `1`
    * Relational operators `<`, `<=`, `>`, `>=` can be used to compare lists lexicographically
        * `[3,2,1] > [2,1,0]`
        * `[3,2,1] > [2,10,100]`
        * `[3,4,2] > [3,4]`
        * `[3,4,2] > [2,4]`
        * `[3,4,2] == [3,4,2]`
    * Some useful list-related functions:
        * **`head`**: Returns first element of non-empty list
            * `head [5,4,3,2,1]` is `5`
        * **`tail`**: Removes head of non-empty list and returns result
            * `tail [5,4,3,2,1]` is `[4,3,2,1]`
        * **`last`**: Returns last element of non-empty list
            * `last [5,4,3,2,1]` is `1`
        * **`init`**: Removes last element of non-empty list and returns result
            * `init [5,4,3,2,1]` is `[5,4,3,2]`
    * Other useful list functions:
        * **`length`**: Returns number of elements in list
        * **`null`**: Returns `True` if list is empty, `False` otherwise
        * **`reverse`**: Returns the input list reversed
        * **`take`**: Extract given number of elements from list
            * `take 3 [1,2,3,4,5]` is `[1,2,3]`
            * `take 5 [1,2,3,4,5]` is `[1,2,3,4,5]`
            * `take 10 [1,2,3,4,5]` is `[1,2,3,4,5]`
        * **`drop`**: Works similarly to `take`, except that it removes from the list
        * **`maximum`**: Returns largest element
        * **`minimum`**: Returns smallest element
        * **`sum`**: Returns sum of elements
        * **`product`**: Returns product of elements
        * **`elem`**: Determines whether element is in list
            * ``3 `elem` [1,2,3,4,5]`` is `True`    
* **Ranges**
    * Allow construction of lists of arithmetic sequences
        * This means strings too
    * Default step is `1`, but a different step can also be specified
    * Defined using `..` operator
        * `[1..10]` is `[1,2,3,4,5,6,7,8,9,10]`
        * `[1,3..9]` is `[1,3,5,7,9]`
        * `['a'..'g']` is `"abcdefg"`
    * Descending lists *must* have a step
        * `[5,4..1]` is `[5,4,3,2,1]`
    * Some functions that produce infinite lists:
        * **`cycle`**: Cycles a list infinitely
            * `take 6 (cycle [1,2,3])` is `[1,2,3,1,2,3]`
        * **`repeat`**: Takes an element and produces an infinite list out of it
            * `take 6 (repeat 5)` is `[5,5,5,5,5,5]`
        * **`replicate`**: Takes an element and a size and produces a finite list out of it
            * `replicate 3 10` is `[10,10,10]`
* **List Comprehensions**
    * Allows lists to be constructed from more complex conditions
    * Similar to list comprehensions in Python
    * Allows optional conditionals to *filter* results
    * Examples:
        * `[2*x | x <- [1..10]]` is `[2,4,6,8,10,12,14,16,18,20]`
        * `[2*x | x <- [1..10], 2*x >= 12]` is `[12,14,16,18,20]`
        * `[(x,y) | x <- [1,2], y <- [3,4]]` is `[(1,1),(1,2),(2,1),(2,2)]`
* **Tuples**
    * Similar to lists, except that tuples are *non-homogeneous* and their size forms part of their type
    * Denoted with parens instead of brackets
        * e.g. `t = (1, "two", 3.0)`
    * Some functions for operating with tuples:
        * **`fst`**: Takes a 2-tuple and returns the first element
            * `fst (8,11)` is `8`
        * **`snd`**: Takes a 2-tuple and returns the second element
            * `snd (8,11)` is `11`
        * **`zip`**: Takes two lists and "zips" them together into a single list of 2-tuples
            * `zip [1,2,3] ['a','b','c']` is `[(1,'a'),(2,'b'),(3,'c')]`
            * `zip [1,2,3] [1..]` is `[(1,1),(2,2),(3,3)]`

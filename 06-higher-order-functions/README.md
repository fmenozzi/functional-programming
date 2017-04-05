# Chapter 6 - Summary

* **Curried Functions**
    * Every function in Haskell only takes one parameter
    * Functions seen thus far that appear to have taken more than one parameter are examples of *curied functions*.
    * As an example, consider the standard library function **`max`**:
        * Calling `max 4 5` first creates a function that takes a single parameter and returns the max of that parameter and `4`
        * Afterwords, 5 is applied to that function and the desired result is produced
        * This means that `max 4 5` and `(max 4) 5` produce exactly the same result
            * `max`'s type is `max :: (Ord a) => a -> a -> a`
            * This means that it could also be written as `max :: (Ord a) => a -> (a -> a)`
                * This could be read as "`max` takes an `a` and returns a function that takes an `a` and returns an `a`"
    * This is useful because it allows the construction of *partially-applied functions*. For example, we can create a function "on the fly" that compares a single number with `100` as follows:

      ```haskell
      compareWithHundred :: (Num a, Ord a) => a -> Ordering
      compareWithHundred = compare 100
      ```

    * Infix functions can also be partially applied by creating *sections*. For example,

      ```haskell
      divideByTen :: (Floating a) => a -> a
      divideByTen = (/10)
      ```

* **Higher-Order Functions**
    * Functions can take functions as parameters and return functions. For example,

      ```haskell
      applyTwice :: (a -> a) -> a -> a
      applyTwice f x = f (f x)
      ```

        * Note that the parens in the type declaration are required here, since `->` is right-associative

    * We can implement the standard library function **`zipWith`** using higher-order functions:

      ```haskell
      -- Take two lists and a function and combine the lists using that function
      zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
      zipWith' _ [] _ = []
      zipWith' _ _ [] = []
      zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
      ```

    * We can also implement the standard library function **`flip`**, which takes a function and two arguments and returns a function that flips the arguments:

      ```haskell
      flip' :: (a -> b -> c) -> (b -> a -> c)
      flip' f x y = f y x
      ```

* **Maps and Filters**
    * **`map`** takes a function and a list and applies that function to every element in the list to produce a new list:

      ```haskell
      map :: (a -> b) -> [a] -> [b]
      map _ [] = []
      map f (x:xs) = f x : map f xs
      ```

    * **`filter`** takes a *predicate function* and a list and returns a list of items that satisfy the predicate

      ```haskell
      filter :: (a -> Bool) -> [a] -> [a]
      filter _ [] = []
      filter f [x] = f x
      filter f (x:xs) = if f x then f x : filter f xs else filter f xs
      ```

        * The previous quicksort implementation can be made more readable by replacing the list comprehensions with calls to `filter`:

          ```haskell
          quicksort :: (Ord a) => [a] -> [a]
          quicksort [] = []
          quicksort [x] = [x]
          quicksort (x:xs) = smaller ++ [x] ++ greater
                           where
                               smaller = quicksort (filter (<=x) xs)
                               greater = quicksort (filter (>x) xs)
          ```

* **Lambdas**
    * Lambdas are *anonymous functions*
        * i.e., functions that don't have a name because they're only used once
    * Denoted with the `\` keyword (kinda looks like the Greek letter lambda)
    * After the `\` come arguments (separated by spaces), then `->` followed by the function body
        * Lambdas should be wrapped in parens
    * For example, suppose you want to find all odd integers in a list:

      ```haskell
      filter (\x -> odd x) [1..100]
      ```

        * Note that you could simply pass `odd` here; this is just a demonstration of syntax

* **Folds**
    * Recursive functions in Haskell that operate on lists often follow a similar pattern:
        1. Base case on empty list
        2. Recursive case on `(x:xs)`, where we do something with `x` and then recurse somehow on `xs`
    * This idiom is so common that Haskell includes several useful functions for encapsulating that behavior called *folds*
        * A fold takes a binary function, a starting value (often called the *accumulator*), and a list
            * The binary function itself takes two parameters: the accumulator and (depending on fold direction) an element from the list
            * It then produces a new accumulator based on the function body
    * Folds are similar to `map`, except that they reduce the list to a single value
    * For example, **`foldl`** folds from the *left* side of the list. We can use it to implement the standard library `sum` function:

      ```haskell
      sum' :: (Num a) => [a] -> a
      sum' xs = foldl (\acc x -> acc + x) 0 xs
      ```

      Or, because of currying, we can return a function directly as follows:

      ```haskell
      sum' :: (Num a) => [a] -> a
      sum' = foldl (+) 0
      ```

    * We can fold starting from the right instead with **`foldr`**
    * We can also use the **`foldl1`** and **`foldr1`** functions to call `foldl` or `foldr` with the first or last element, respectively, intsead of having to explicitly provide the initial accumulator

* **Function Application with $**
    * Similar to standard function application with spaces, except that it has the lowest precedence, rather than the highest
    * Used mostly as a convenience function to avoid writing so many parens
    * For example, `sqrt (3 + 4 + 9)` can be re-written as `sqrt $ 3 + 4 + 9`

* **Function Composition**
    * Similar to function composition in math
        * i.e. `(f o g)(x) = f(g(x))`
    * Useful for making functions to pass to other functions on the fly
    * For example, if we want to negate the sum of the tails of a list of lists, we could do it with lambdas:

      ```haskell
      map (\xs -> negate $ sum $ tail xs) [[1..5],[3..6],[1..7]]
      ```

      Or, we could use function composition:

      ```haskell
      map (negate . sum . tail) [[1..5],[3..6],[1..7]]
      ```

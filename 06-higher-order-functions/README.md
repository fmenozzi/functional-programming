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

# Chapter 5 - Summary

* **Recursion**
    * Defining functions in terms of themselves
    * Typically constitute a *base case*, which terminates the recursion, and a *recursive case* which perpetuates it
    * Useful in purely functional languages like Haskell with no side effects or iterative constructs like loops

* **Sample Recursive Functions**
    * Alternate implementation of standard library function **`maximum`**:

      ```haskell
      -- Get largest value in a list
      maximum' :: (Ord a) => [a] -> a
      maximum' [] = error "Empty list"
      maximum' [x] = x
      maximum' (x:xs) = max x (maximum' xs)
      ```

    * Alternate implementation of standard library function **`replicate`**:

      ```haskell
      -- Replicate a value a certain number of times to produce a list
      --
      -- NOTE: Num is not a subclass of Ord
      replicate' :: (Num i, Ord i) => i -> a -> [a]
      replicate' n x = if n <= 0 then [] else x:replicate' (n-1) x
      ```

    * Alternate implementation of standard library function **`take`**:

      ```haskell
      -- Takes a certain number of elements from a list
      take' :: Int -> [a] -> [a]
      take' _ [] = []
      take' n (x:xs) = if n <= 0 then [] else x:take' (n-1) xs
      ```

    * Alternate implementation of standard library function **`reverse`**:

      ```haskell
      -- Reverses a list
      reverse' :: [a] -> [a]
      reverse' [] = []
      reverse' (x:xs) = reverse' xs ++ [x]
      ```

    * Alternate implementation of standard library function **`repeat`**:

      ```haskell
      -- Repeat an value infinitely
      repeat' :: a -> [a]
      repeat' (x:xs) = x:repeat' xs
      ```

    * Alternate implementation of standard library function **`zip`**:

      ```haskell
      -- Zip two lists together into a list of 2-tuples
      zip' :: [a] -> [b] -> [(a,b)]
      zip' _ [] = []
      zip' [] _ = []
      zip' (x:xs) (y:ys) = (x,y):zip' xs ys
      ```

    * Alternate implementation of standard library function **`elem`**:

      ```haskell
      -- Determine if an element exists in a list
      elem' :: (Eq a) => a -> [a] -> Bool
      elem' a [] = False
      elem' a (x:xs) = if a == x then True else elem' a xs
      ```

    * Simple quicksort implementation:

      ```haskell
      -- Apply quicksort on a list using the first element as the pivot
      quicksort :: (Ord a) => [a] -> [a]
      quicksort [] = []
      quicksort (x:xs) = smaller ++ [x] ++ greater
                       where
                           smaller = [y | y <- xs, y <= x]
                           greater = [y | y <- xs, y > x]
      ```

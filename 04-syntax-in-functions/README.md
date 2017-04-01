# Chapter 4 - Summary

* **Pattern Matching**
    * Consists of specifying patterns to which some data should conform and destructuring data according to the pattern
    * Can pattern match on any type: numbers, characters, lists, tuples, etc.
    * Example function that utilizes simple pattern matching:

      ```haskell
      lucky :: (Integral a) => a -> String
      lucky 7 = "LUCKY NUMBER SEVEN!"
      lucky x = "Sorry, you're out of luck"
      ```

      When you call `lucky`, the patterns are checked from top to bottom to see if they conform to a pattern
    * Great for recursive functions:

      ```haskell
      factorial :: (Integral a) => a -> a
      factorial 0 = 1
      factorial n = n * factorial (n-1)
      ```
    * Pattern matching can fail if you don't specify a catch-all. For example,

      ```haskell
      charName :: Char -> String
      charName 'a' = "Albert"
      charName 'b' = "Brian"
      charName 'c' = "Cindy"
      ```

      will throw an exception if called with any input other than `'a'`, `'b'`, or `'c'`
    * Pattern matching works on tuples too:

      ```haskell
      -- Add two 2D vectors (represented as 2-tuples)
      addVectors :: (Num a) => (a,a) -> (a,a) -> (a,a)
      addVectors (x1,y1) (x2,y2) = (x1+x2,y1+y2)
      ```

    * Can also pattern match on list comprehensions:

      ```haskell
      -- Remove the third element in a list of 3-tuples
      firstTwo = [(a,b) | (a,b,_) <- [(1,2,3), (4,5,6), (7,8,9)]]
      ```

    * Pattern matching on lists is very common
        * Can match on empty list `[]` or any pattern that involves `:` and the empty list
            * Since e.g. `[1,2,3]` is syntactic sugar for `1:2:3:[]`, you can also use `[1,2,3]`
        * A typical pattern used is matching on `x:xs`, which binds `x` to the head of the list and `xs` to the rest
            * Patterns that use `:` only match against non-empty lists, so a separate match for `[]` must be used
            * If the list has only one element, that element is bound to `x` and `xs` is empty
        * This can extend to multiple "heads"
            * e.g. `x:y:z:zs` matches to lists of length 3 or more
        * This can be used to create an alternative `head` function:

          ```haskell
          head' :: [a] -> a
          head' [] = error "Empty list"
          head' (x:_) = x
          ```

            * **NOTE**: If we bind to several variables (even if some are `_`), we **MUST** use parens
            * **`error`** takes a `String` and produces a runtime error
        * *As patterns* allow you to pattern match portions of lists while still having a name bind to the whole list. For example:

          ```haskell
          firstLetter :: String -> String
          firstLetter "" = error "Empty string"
          firstLetter str@(c:cs) = "The first letter of " ++ s ++ " is " ++ c
          ```
* **Guards**
    * Way of testing whether some property of value is true or false
    * Example:

      ```haskell
      -- Given a BMI, report results
      bmiTell :: (Floating a) => a -> String
      bmiTell bmi
          | bmi <= 18.5 = "Underweight"
          | bmi <= 25.0 = "Normal"
          | bmi <= 30.0 = "Overweight"
          | otherwise   = "Obese"
      ```

        * **`otherwise`** is synonymous with `True`
* **Where Bindings**
    * Allow us not to repeat ourselves across guards
    * Denoted with **`where`** keyword

      ```haskell
      -- Given a weight and height, calculate BMI and report results
      bmiTell :: (RealFloat a) => a -> a -> String
      bmiTell weight height
          | bmi <= under  = "Underweight"
          | bmi <= normal = "Normal"
          | bmi <= over   = "Overweight"
          | otherwise     = "Obese"
          where bmi = weight / height^2
                (under, normal, over) = (18.5, 25.0, 30.0)
      ```

* **Let Bindings**
    * Similar to `where` bindings, except that `let` bindings are expressions
    * They also have a smaller scope than `where` bindings
        * e.g. can't be used across guards
    * For example:

      ```haskell
      cylinder :: (RealFloat a) => a -> a -> a
      cylinder r h =
          let sideArea = 2*pi*r*h
              topArea  = pi*r^2
          in
              sideArea + 2*topArea
      ```

    * The general syntax is `let <bindings> in <expression>`
        * Names defined in `let` block are only visible in the `in` block

* **Case Expressions**
    * Similar to switch-case in imperitive languages
    * Result is expression
    * Generalized form of pattern matching
        * Allows pattern matching pretty much anywhere
    * For example:

      ```haskell
      describeList :: [a] -> String
      describeList xs = "List is " ++ case xs of []  -> "empty"
                                                 [x] -> "singleton"
                                                 xs  -> "longer" 
      ```
    * Pattern matching in function definitions is syntactic sugar for case expressions

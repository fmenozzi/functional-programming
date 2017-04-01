# Chapter 4 - Summary

* **Pattern Matching**
    * Consists of specifying patterns to which some data should conform and destructuring data according to the pattern
    * Can pattern match on any type: numbers, characters, lists, tuples, etc.
    * Example function that utilizes simple pattern matching:

      ```haskell
      lucky :: (Integral a) => a -> String
      lucky 7 = "LUCKY NUMBER SEVENT!"
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

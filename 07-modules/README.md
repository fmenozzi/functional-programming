# Chapter 7 - Summary

* **Modules**
    * Collection of related functions, types, and typeclasses
    * A Haskell program is simply a collection of modules where the main modules loads other modules and does work with them
    * Haskell standard library is split into modules that do a variety of tasks
        * Manipulating lists
        * Concurrency
        * Complex numbers
        * etc.

    * All functions, types, and typeclasses dealt with so far are part of the **`Prelude`** module, which is imported by default

* **Loading Modules**
    * `import <module>`
        * In GHCi, use `+m <module>`
    * Modules must be loaded before defining any functions, so they're usually at the top of the file
    * For example, `Data.List` has lots of list-related functions:

      ```haskell
      import Data.List

      -- Get number of unique elements in a list
      --
      -- nub is defined in Data.List and removes duplicate elements
      numUniques :: (Eq a) => [a] -> Int
      numUniques = length . nub
      ```

    * You can import certain functions from a module:

      ```haskell
      import Data.List (nub, sort)
      ```

    * You can import all functions except for certain functions from a module:

      ```haskell
      import Data.List hiding (nub)
      ```

    * You can force imported functions to use their full qualified name:

      ```haskell
      import qualified Data.Map
      ```

    * You can force imported functions to use their full qualified name with a certain alias:

      ```haskell
      import qualified Data.Map as M
      ```

    * Haskell standard library reference can be found [here](https://downloads.haskell.org/~ghc/latest/docs/html/libraries/)
    * Search for functions and their locations using [Hoogle](https://www.haskell.org/hoogle/)

* **Data.List**
    * Contains useful list-related functions
        * Some of these are imported in `Prelude` by default
            * No name clashes between `Prelude` and `Data.List`

* **Data.Char**
    * Contains useful char-related functions
        * Also helpful when dealing with `String`

* **Data.Map**
    * *Association lists* (also called *dictionaries*) are lists that are used to store unordered key-value pairs
    * `Data.Map` provides such data structures (implemented as trees)
        * Because there are name clashes with `Prelude`, `Data.Map` should be imported qualified

* **Data.Set**
    * Offers sets (like those used in mathematics)
        * Because there are name clashes with `Prelude`, `Data.Set` should be imported qualified

* **Creating Custom Modules**
    * Create a file called `<module>.hs`
    * Create a list of functions that the module *exports*
        * i.e the functions visible outside of the module
    * For example, in the file `Test.hs`:

      ```haskell
      module Test (
          func1,
          func2,
      ) where

      func1 :: (Num a) => a -> a
      func1 x = x^2

      func2 = 4
      ```

# Chapter 3 - Summary

* **Haskell Type System**
    * Haskell is a *statically-typed* language, which means that every variable and function has an associated type
    * Haskell also utilizes *type inference* to reduce the number of explicit type declarations in programs
    * Use `:t` to determine the type of a function or variable in `ghci`
        * e.g. `:t 'a'` yields `'a' :: Char`
    * `::` is read "has type of"
    * Types are written in **CAPITAL LETTERS**
        * We'll see why in a second
    * Some common types:
        * **`Int`**: System-width integer
        * **`Integer`**: Unbounded integer
        * **`Float`**: Single-precision floating-point type
        * **`Double`**: Double-precision floating-point type
        * **`Bool`**: Boolean type, either `True` or `False`
        * **`Char`**: A single character
        * **`String`**: A list of characters (equivalent to `[Char]`)

* **Function Type Declarations**
    * Unless they're very short, functions should typically be declared with *type declarations*:

      ```haskell
      removeUppercase :: String -> String
      removeUppercase s = [c | c <- s, c `elem` ['a'..'z']]
      ```

      Here, `removeUppercase` is a function that takes a single `String` as input and returns a `String` as output
    * Functions can also take multiple parameters:

      ```haskell
      addThree :: Int -> Int -> Int -> Int
      addThree x y z = x + y + z
      ```

      Here, `addThree` takes three `Int` arguments and returns their sum. We'll see later why there's no syntactic distinction between separation of parameter and return types

* **Type Variables**
    * Type variables allow the use of any type in a Haskell program
        * Similar to generics in other languages
    * Typically denoted using lowercase letters
        * `a`, `b`, `c`, etc.
    * For example, the standard library function `head` is declared as follows:

      ```haskell
      head :: [a] -> a
      ```

      This means that `head` takes a list of any type and returns a value of that same type
    * Another example is the standard library `fst` function, whose declaration is as follows:

      ```haskell
      fst :: (a, b) -> a
      ```

      This means that `fst` takes a 2-tuple whose types are `a` and `b` and returns a value of type `a`. Note that `a` and `b` don't necessarily have to be distinct types.

* **Type Classes**
    * Similar to Java interfaces or Rust traits
    * Defines the behavior of types
    * For example, the `==` operator (which is really just a function) has the following type signature:

      ```haskell
      (==) :: (Eq a) => a -> a -> Bool
      ```
        * Everything before the `=>` is a *class constraint*
        * In this case, it means that the type variable `a` must satisfy the equality class constraint
    * Some basic typeclasses:
        * **`Eq`**: Used for types that support equality testing. All previously mentioned types (except for functions) are part of `Eq`.
        * **`Ord`**: Used for types that have an ordering
            * For example, `>` has the following signature:

              ```haskell
              (>) :: (Ord a) => a -> a -> Bool
              ```

            * To be a member of `Ord`, a function must first be in `Eq`
            * The **`compare`** function takes two `Ord`s and returns an `Ordering`, which is one of `GT`, `LT`, `EQ`
        * **`Show`**: Types that can be converted to `String`s. All types covered so far (except for functions) are in `Show`.
            * The **`show`** function converts its input to a `String` and has the following signature:

              ```haskell
              show :: (Show a) => a -> String
              ```

        * **`Read`**: Types that can be converted from a `String`. Conceptually the opposite of `Show`.
            * The **`read`** function takes a `String` and returns a type which is a member of `Read`:
                * `read "8.2"` is `8.2`
                * `read [1,2,3,4] ++ [5]` is `[1,2,3,4,5]`
                * However, `read "4"` produces an error, since the compiler can't infer the desired type
                    * The solution is to use an explicit **type annotation**
                        * `read "4" :: Int` is `4`
                        * *Kind of* like type casting in other languages
        * **`Enum`**: Types that are sequentially ordered
            * Can be used in list ranges
            * Have successors and predecessors, which can be obtained with **`succ`** and **`pred`**, respectively
            * `Enum` types include `()`, `Bool`, `Char`, `Ordering`, `Int`, `Integer`, `Float`, `Double`
        * **`Bounded`**: Types that have an upper and lower bound
            * `minBound :: Int` is `-2147483648`
            * `maxBound :: Bool` is `True`
        * **`Num`**: Numeric types
            * Includes `Int`, `Integer`, `Float`, `Double`
        * **`Integral`**: Integral types
            * Includes `Int`, `Integer`
        * **`Floating`**: Floating-point types
            * Includes `Float`, `Double`

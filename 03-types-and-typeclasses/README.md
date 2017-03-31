# Chapter 2 - Summary

* **Haskell Type System**
    * Haskell is a *statically-typed* language, which means that every variable and function has an associated type
    * Haskell also utilizes *type inference* to reduce the number of explicit type declarations in programs
    * Use `:t` to determine the type of a function or variable in `ghci`
        * e.g. `:t 'a'` yields `'a' :: Char`
    * `::` is read "has type of"
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

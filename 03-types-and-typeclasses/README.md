# Chapter 2 - Summary

* **Haskell Type System**
    * Haskell is a *statically-typed* language, which means that every variable and function has an associated type
    * Haskell also utilizes *type inference* to reduce the number of explicit type declarations in programs
    * Use `:t` to determine the type of a function or variable in `ghci`
        * e.g. `:t 'a'` yields `'a' :: Char`
            * `::` is read "has type of"
* **Function Type Declarations**
    * Unless they're very short, functions should typically be declared with *type declarations*

    ```
    removeUppercase :: String -> String
    removeUppercase s = [c | c <- s, c `elem` ['a'..'z']]
    ```

    * Test

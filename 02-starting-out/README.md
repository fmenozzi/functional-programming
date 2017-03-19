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

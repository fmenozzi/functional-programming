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
    * Arguments are separated from the function name and other arguments with spaces
        * e.g. `min 2 3 == 2` invokes the standard library `min` function
    * Functions can be *infix* (like numerical operators `+`, `-`, etc.) or *prefix*
        * Prefix functions can be made infix by using backticks
            * e.g. ``min 2 3 == 2 `min` 3``
        

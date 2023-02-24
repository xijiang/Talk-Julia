# Some random topic

## What is the result below?

```julia
x, y, z = 0, 0, 2

x == 0 & y == 0 & z == 0
```

The first thing you should notice is that the operator `&` is not the same as `&&`. The former is a bitwise operator, while the latter is a logical operator. `&` has a higher precedence than `==`, so the expression is evaluated as `x == (0 & y) == (0 & z) == 0`, or `0 = 0 = 0 = 0`.

To see how Julia evaluates the expression, you can use the `dump` function:

```julia
ex = :(x == 0 & y == 0 & z == 0)
dump(ex)
```

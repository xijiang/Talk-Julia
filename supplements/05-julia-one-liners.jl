## Swap two variables
a, b = b, a

## multiple assignment
a, b, c = 1, 2, 3

## multiple assignment with a tuple
(a, b, c...) = 1:5

## sum of even numbers
a = 1:10
sum(a[a .% 2 .== 0])

## read all lines of a file
lines = readlines("file.txt") # → Vector{String}

## write lines into a file
open("file.txt", "w") do f; println(f, join(lines, "\n")); end

## A square series
[x^2 for x in 1:10]  # or
map(x -> x^2, 1:10)

## Fizz Buzz
map(x -> x % 15 == 0 ? "FizzBuzz" : x % 3 == 0 ? "Fizz" : x % 5 == 0 ? "Buzz" : x, 1:100)

## space separated integers to a vector
parse.(Int, split("1 2 3 4 5"))

## if 5 is in a vector
5 ∈ [1, 2, 3, 4, 5] && println("5 is in the vector")

## piled smiles
map(x -> println("🌻" ^ x), 1:10);

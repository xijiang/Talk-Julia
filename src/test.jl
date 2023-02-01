## packages

N = 40
M = 1000
As = [randn(N, N) for _ in 1:M]
Bs = [randn(N, N) for _ in 1:M]

## 

using Folds
Folds.sum(A * B for (A, B) in zip(As, Bs))

##

using FLoops
@floop for (A, B) in zip(As, Bs)
    C = A * B
    @reduce() do (S = zero(C); C)
        S = S + C
    end
end

##

using LinearAlgebra: mul!
using Plots
y(x) = 2x
plot(y, 1, 2)

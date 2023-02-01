"""
    function mcπ(n)
Runs a simple Monte Carlo method to estimate pi with `n` samples.
"""
function mcπ(n)
    s = 0
    for _ in 1:n
        x, y = rand(), rand()
        x^2 + y^2 <= 1 && (s += 1)
        # or 
        # s += (x^2 + y^2) <= 1
    end
    return 4s/n
end

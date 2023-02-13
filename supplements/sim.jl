#!/usr/bin/env julia

## packages to be used
using LinearAlgebra, DataFrames

## Simulate a linkage map
function simChrMap(chr, M, nlc, cM=1e6)
    tbp = Int(floor(100M*cM))
    20nlc ≤ tbp || error("Asking too many loci: $nlc out of $tbp")
    pos = unique(sort(rand(1:tbp, nlc)))
    mlc = length(pos)
    if mlc ≠ nlc
        @warn "Only $mlc loci simulated, instead of $nlc"
    end
    DataFrame(chr=repeat([Int8(chr)], mlc), pos = Int32.(pos))
end

##

function simMap(nchr)
    Ms = sort(rand(nchr) + .5, rev=true)

end

"""
    simMap(M::Float64, nlc...; cM = 1e6)

Simulate a linkage map DataFrame with chromosome number of ``UInt8`` 
and base pair positions of ``UInt32``.
This can be used for crossover simulations.
"""
function simMap(M::Float64, nlc...; cM = 1e6)
    tbp = Int(floor(100M * cM))
    lmp = DataFrame(chr = UInt8[], pos = UInt32[])
    ich = Int8(1)
    for n in nlc
        20n < tbp || error("Asking too many loci: $n out of $tbp")
        pos = sort(rand(1:len, n))
        append!(lmp, DataFrame(chr=repeat([ich], length(pos)), pos = pos))
        ich += 1
    end
    lmp
end

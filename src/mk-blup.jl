#!/usr/bin/env julia

#= Exercise 1 in the Julia course by Gunnar
Use the SNP-data below to show equivalent results of G-BLUP (Van Radens method 
1) with SNP-BLUP. Model only the random part of the MME. Assume phenotypes for 
5 animals being 1, 2, 3, 4, 5 and a heritability of 0.5. Consider the 
following genotypes coded (0,1,2) for the 5 animals (5 rows) and 10 SNPs (10 
columns): 
2 0 2 1 1 0 2 0 0 1
0 0 0 2 2 1 1 0 1 1
2 2 0 1 0 0 1 2 2 2
0 0 0 0 1 2 1 2 1 0
0 2 1 2 1 2 0 1 1 0
=#
using LinearAlgebra, Statistics

## Data preparation
M = [2 0 2 1 1 0 2 0 0 1
     0 0 0 2 2 1 1 0 1 1
     2 2 0 1 0 0 1 2 2 2
     0 0 0 0 1 2 1 2 1 0
     0 2 1 2 1 2 0 1 1 0]
y = [1, 2, 3, 4, 5]
h² = .5

## Centralize M → Z
p = mean(M, dims=1) / 2
tpq = 2p * (1 .- p)'
Z = M .- 2p
λ = (1 - h²) / h² * tpq
λ = λ[1]

## MME for SNP-BLUP
lhs = [5 sum(Z, dims=1)
       sum(Z, dims=1)' Z'Z + λ * I]
rhs = [sum(y); Z'y]

bhat = lhs \ rhs
gebv = Z * bhat[2:end]
cor(gebv, y)


## SNP-BLUP with no centralization
lhs2 = M'M + λ * I
rhs2 = M'y
bhat2 = lhs2 \ rhs2
gebv2 = M * bhat2
cor(gebv2, y)

## GRM for GBLUP
grm = Z * Z' ./ tpq + 0.01I
giv = inv(grm)
λ2 = (1 - h²)/h²
lhs = [5 ones(5)'
       ones(5) I + λ * giv]
gebv3 = lhs \ [5; y]

## equivalence
cov(gebv, gebv3[2:end])
cov(gebv3[2:end], y)
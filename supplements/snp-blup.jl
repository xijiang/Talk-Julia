#!/usr/bin/env julia

## The model
#=
Suppose there are $n$ SNP/loci that can be genotyped. Then the phenotype of individual $i$ can be modeled as:
$$y_i = \mu + \sum_{j=1}^nm_{ij} + \varepsilon_i$$
=#

## Pacakges to be used
using LinearAlgebra
using Plots
using Random
using Statistics

## parameters
nlc = 2_000
nid = 1_000
nqtl = 300
h²  = 0.5
# alternatively
# nlc, nid, nqtl, h² = 2000, 1000, 300, 0.5

## The simulation
tsnp = rand([0, 1, 1, 2.], nlc, nid)
lqtl = sort(randperm(nlc)[1:nqtl])
eqtl = randn(nqtl) ./ sqrt(nqtl)
qsnp = view(tsnp, lqtl, :)
tbv = qsnp'eqtl
va = var(tbv)
ve = va / h² * (1 - h²)
err = randn(nid) .* sqrt(ve)
pht = tbv + err
var(pht)

## To have a look about TBV and phenotypes
scatter(tbv, ms = 2, label = "TBV")
scatter!(pht, ms = 2, label = "Phenotypes")

#-- SNP-BLUP
## frequencies
p = mean(tsnp, dims=2) ./ 2
q = 1 .- p
d = sqrt.(2p .* q)
tpq = 2p'q

## genotype standadize
z = tsnp .- 2p
z ./= d

## LHS
x = ones(nid)
λ = (1 - h²) / h² * nlc

lhs = zeros(nlc+1, nlc+1)
lhs[1] = nid
lhs[2:end, 1] = z * x
lhs[1, 2:end] = x'z'
lhs[2:end, 2:end] = z * z' + λ * I

## RHS
rhs = zeros(nlc + 1)
rhs[1] = sum(pht)
rhs[2:end] = z * pht

##
sol = lhs \ rhs
esnp = sol[2:end]
gebv = z'esnp
cov(gebv, tbv)
# This flie is made for getting nodes and weight of gauss quadrature



"""
gausslegendremesh(minLimit::Float64,maxLimit::Float64,step::Int,n::Int)
# Arguments
from minLimit to maxLimit to integral

make step nodes

n-different kinds of mesh
- n = 1, linear points
- n = 2, log points

# Example
```julia
x,w = gausslegendremesh(0.0,1.0,5,1)
([0.04691007703066802, 0.23076534494715845, 0.5, 0.7692346550528415, 0.9530899229693319], [0.11846344252809454, 0.23931433524968324, 0.28444444444444444, 0.23931433524968324, 0.11846344252809454])
```
"""
function gausslegendremesh(minLimit::Real,maxLimit::Real,step::Int,n::Int)
    x = Array{Float64}(undef,step,1)
    w = Array{Float64}(undef,step,1)
    x,w = gausslegendre(step)
    if minLimit > maxLimit
        error("domain must minLimit<maxLimit")
    end
    if n == 1 # 线性取点
        #放缩系数k
        k1 = (maxLimit - minLimit) / 2
        k2 = (minLimit + maxLimit) / 2
        x=k2 .+(k1 .*x)
        w .*= k1
    elseif n == 2 # log取点
        if minLimit < 0
            error("mesh domain must be positive when using this method")
        end
        minLimit=sqrt(minLimit)
        maxLimit=sqrt(maxLimit)
        x=minLimit*maxLimit*(maxLimit/minLimit).^x
        w .*= x .* (log(maxLimit) - log(minLimit))
    end
    x,w
end
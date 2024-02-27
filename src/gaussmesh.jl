# This flie is made for getting nodes and weight of gauss quadrature




# function gausslegendremesh
# from minLimit to maxLimit
# make step nodes
# n-different kinds of mesh
#
function gausslegendremesh(minLimit::Float64,maxLimit::Float64,step::Int,n::Int)
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
        if mi n < 0
            error("mesh domain must be positive when using this method")
        end
        minLimit=sqrt(minLimit)
        maxLimit=sqrt(maxLimit)
        x=minLimit*maxLimit*(maxLimit/minLimit).^x
        w .*= x .* (log(maxLimit) - log(minLimit))
    end
    x,w
end
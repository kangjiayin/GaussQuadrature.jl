# This flie is made for getting nodes and weight of gauss quadrature




# function gausslegendremesh
# from a to b
# make step nodes
# n-different kinds of mesh
#
function gausslegendremesh(a::Float64,b::Float64,step::Int,n::Int)
    x=Array{Float64}(undef,step,1)
    w=Array{Float64}(undef,step,1)
    x,w= gausslegendre(step)
    if n==1
        #放缩系数k
        k1= (b-a)/2
        k2= (a+b)/2
        x=k2 .+(k1 .*x)
        for i in eachindex(x)
            result+=f(x[i])*w[i]
        end
        result*=(b-a)/2
    elseif n==2
        a=sqrt(a)
        b=sqrt(b)
        x=a*b*(b/a).^x
        for i in eachindex(x)
            w[i]*=x[i]*(log(b)-log(a))
        end
    end
    x,w
end
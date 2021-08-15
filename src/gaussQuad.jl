# This module is made for Gauss quadrature.
## 2021.8.14
## Powered by Ashen
## Nankai University


using FastGaussQuadrature
using LinearAlgebra

export gausslegendreint
export gausschebyshevint
export gausschebyshevint64
export gausslegendreint64

point64, weight64=gausslegendre(64)
function gausslengndreint(a::Float64,b::Float64,step::Int,f::Function)
# """
#     该函数给出高斯勒让德积分
#     \int_a^b\ f(x)\rm{d}x
# """
    x,w= gausslegendre(step)
    result=0.::Float64
    for i in eachindex(x)
        result+=f(x[i])*w[i]
    end
    result
end




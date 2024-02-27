module Gaussquad
using FastGaussQuadrature, LinearAlgebra
export gausslegendreint
export creatGaussLegendreInt
# export gausschebyshevint
export gausschebyshevint64
export gausslegendreint8
export gausslegendreint16
export gausslegendreint32
export gausslegendreint64
export gausslegendreint128
export gausslegendremesh
export gausslegendreint512
export gausschebyshevint512
include("./gaussmesh.jl")
include("./gaussint.jl")
end # module

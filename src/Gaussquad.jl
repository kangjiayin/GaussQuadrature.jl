module Gaussquad
using FastGaussQuadrature, LinearAlgebra
export gausslegendreint
# export gausschebyshevint
export gausschebyshevint64
export gausslegendreint64
export gausslegendreint128
export gausslegendremesh
export gausslegendreint512
include("./gaussint.jl")
include("./gaussmesh.jl")
end # module

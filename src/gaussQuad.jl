module gaussquad
using FastGaussQuadrature, LinearAlgebra

export gausslegendreint
# export gausschebyshevint
export gausschebyshevint64
export gausslegendreint64


export gausslegendremesh

include("./gaussint.jl")
include("./gaussmesh.jl")

end # module

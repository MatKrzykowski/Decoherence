module Density_Matrix

include("gtensor.jl")
using LinearAlgebra
import .GTensor: gTensor

struct DensityMatrix
    ρ::Hermitian{Float64}
    is_eigen::Bool
    A::Matrix{Float64}
    g::gTensor
end

end
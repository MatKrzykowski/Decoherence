module Density_Matrix

include("gtensor.jl")
using LinearAlgebra
import .GTensor: gTensor

struct DensityMatrix
    ρ::Hermitian
    is_eigen::Bool
    A::AbstractMatrix
    g::gTensor
end

end
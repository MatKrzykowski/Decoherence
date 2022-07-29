module Density_Matrix

using LinearAlgebra

include("gtensor.jl")
import .GTensor: gTensor

function default_ρ()
    ρ = zeros(ComplexF64, 4, 4)
    ρ[3, 3] = 1
    return ρ
end

end
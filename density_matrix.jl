module Density_Matrix

using LinearAlgebra

struct DensityMatrix
    ρ::Hermitian
    is_eigen::Bool
    A::AbstractMatrix
    g::gTensor
end

end
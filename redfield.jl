using LinearAlgebra

I[1,2]

include("common.jl")
using .Common: commutator, ħ, time_unit

function Redfield(
    ρ::AbstractMatrix,
    params,
    t::Float64
)::AbstractMatrix
    # H = p
    # result = -1im / ħ * commutator(H, ρ) * time_unit
    # result
    H = params

    dρdt = vonNeumann(H, ρ) / π
    
#         for i, j, k, l in product([0, 1, 2, 3], repeat=4):
#             if j < i:
#                 continue
#             drhodt[i, j] += (self.R.exp_delta_omega(j, k, i, l, t) *
#                              self.R[k, j, i, l] * self.rho[l, k])
#             drhodt[i, j] -= (self.R.exp_delta_omega(k, i, k, l, t) *
#                              self.R[i, k, k, l] * self.rho[l, j])
#             drhodt[i, j] += (self.R.exp_delta_omega(j, l, i, k, t) *
#                              np.conj(self.R[k, i, j, l]) * self.rho[k, l])
#             drhodt[i, j] -= (self.R.exp_delta_omega(k, l, k, j, t) *
#                              np.conj(self.R[j, k, k, l]) * self.rho[i, l])



    remove_imag_from_diag!(X)

    π * dρdt * time_unit
end

function remove_imag_from_diag!(X::AbstractMatrix)
    for i in 1:size(X)[1]
        X[i, i] = real(X[i, i])
    end
end

function vonNeumann(
    H::AbstractMatrix,
    ρ::AbstractMatrix
)::Hermitian
    Hermitian(-1im / ħ / π * commutator(H, ρ))
end


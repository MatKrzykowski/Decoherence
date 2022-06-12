using PhysicalConstants.CODATA2018

############
# Matrices #
############

# Function calculating commutator or two matrices
function commutator(A::AbstractMatrix, B::AbstractMatrix)::AbstractMatrix
    A * B - B * A
end

# Pauli matrices
σ_x = [0.0 1.0
    1.0 0.0] / 2
σ_y = [0.0 -1.0im
    1.0im 0.0] / 2
σ_z = [1.0 0.0
    0.0 -1.0] / 2

######################
# Physical constants #
######################

ħ = PlanckConstant / 2 / π # Reduced planck constant
μ_B = BohrMagneton # Bohr magneton
k_B = BoltzmannConstant # Boltzmann constant
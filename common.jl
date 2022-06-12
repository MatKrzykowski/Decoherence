module Common

using Ansillary # For moving terminal cursor
using PhysicalConstants.CODATA2018 # For physical constants
using Unitful # For physical units

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

############################
# Bose-Einstein statistics #
############################

function n_B(ω::Quantity{Float64,Unitful.𝐓^-1},
    T::Quantity{Float64,Unitful.𝚯}
)::Float64
    if ω == 0u"Hz"
        return 0
    elseif T == 0u"K"
        return ω > 0u"Hz" ? 1.0 : 0.0
    end
    return abs(1.0 / expm1(ħ * ω / (k_B * T)) + 1.0)
end


################################
# Terminal cursor manipulation #
################################

move_cursor() = Cursor.move!(Cursor.Up(1))

end
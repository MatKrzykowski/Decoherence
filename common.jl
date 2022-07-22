module Common

using Ansillary # For moving terminal cursor
using LinearAlgebra
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
σ_0 = [1.0 0.0; 0.0 1.0]
σ_x = [0.0 1.0; 1.0 0.0] / 2
σ_y = [0.0 -1.0im; 1.0im 0.0] / 2
σ_z = [1.0 0.0; 0.0 -1.0] / 2
vec_σ = [σ_x, σ_y, σ_z]

function σ_ij(i::Int64, j::Int64)::AbstractMatrix
    result = zeros(Int64, 4, 4)
    result[i, j] = 1
    return result
end

###########
# Vectors #    
###########

# Return unit vector (versor)
function versor(v::AbstractVector)::AbstractVector
    return v / norm(v)
end

# In-place unit vector (versor)
function versor!(v::AbstractVector)::AbstractVector
    v /= norm(v)
end

# Give direction versor given angles
function versor_angles(ϕ::Float64, θ::Float64)::AbstractVector
    return [cos(ϕ) * sin(θ)  # x
        sin(ϕ) * sin(θ)      # y
        cos(θ)               # z
    ]
end

function angles(v::AbstractArray{Float64,1})::Tuple{Float64,Float64}
    v = versor(v)  # Change to versor for convinience

    # Calculate in-plane angle ϕ depending on the quadrant
    if v[1] == 0
        ϕ = sign(v[2]) * π / 2
    elseif v[1] > 0
        ϕ = atan(v[2] / v[1])
    else
        ϕ = π + atan(v[2] / v[1])
    end

    # Normalize ϕ so that 0 ≤ ϕ < 2π
    if ϕ < 0
        ϕ += 2 * π
    end

    # Calculate θ angle
    θ = acos(v[3])

    # Return the results
    return (ϕ, θ)
end

######################
# Physical constants #
######################

ħ = PlanckConstant / 2 / π # Reduced planck constant
μ_B = BohrMagneton # Bohr magneton
k_B = BoltzmannConstant # Boltzmann constant

#######################
# Physical quantities #
#######################

ε_unit = typeof(1.0u"V/m").parameters[2]
E_unit = typeof(1.0u"J").parameters[2]
B_unit = typeof(1.0u"T").parameters[2]
time_unit = 1u"ns"

############################
# Bose-Einstein statistics #
############################

# Calculate B-E distribution given angular frequency ω and temperature T 
function n_B(ω::Quantity{Float64,Unitful.𝐓^-1}, T::Quantity{Float64,Unitful.𝚯})::Float64
    # For 0 energy return 0 to avoid infinities - doesn't change the results
    if ω == 0u"Hz"
        return 0.0
        # Step function in limit T = 0K, avoids division by 0
    elseif T == 0u"K"
        return ω > 0u"Hz" ? 1.0 : 0.0
        # Otherwise apply proper formula
    else
        return abs(1.0 / expm1(ħ * ω / (k_B * T)) + 1.0)
    end
end

################################
# Terminal cursor manipulation #
################################

move_cursor() = Cursor.move!(Cursor.Up(1))

end

module Common

using Ansillary # For moving terminal cursor
using LinearAlgebra
using Unitful

include("constants.jl")
import .Constants: ħ, k_B

############
# Matrices #
############

# Function calculating commutator or two matrices
function commutator(A::AbstractMatrix, B::AbstractMatrix)::AbstractMatrix
    A * B - B * A
end

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

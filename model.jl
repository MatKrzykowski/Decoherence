module Model

using Unitful

include("constants.jl")
import .Constants: B_unit, ε_unit, E_unit

struct Model_struct
    B::Vector{Quantity{Float64,B_unit}}
    ε::Vector{Quantity{Float64,ε_unit}}
    E::Vector{Quantity{Float64,E_unit}}
end

# B = [0, 0, 1.0] * 1u"T"
model = Model_struct(
    [0, 0, 1.0] * 1u"T",
    [0, 0, 1.0] * 1u"V/m",
    [0, 0, 1.0] * 1u"eV",
    )

end
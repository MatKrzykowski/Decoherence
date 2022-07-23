module Model

using Unitful

include("constants.jl")
import .Constants: B_unit, ε_unit, E_unit, m_unit

struct QD_struct
    ΔE::Quantity{Float64,E_unit}
    t::Quantity{Float64,E_unit}
    r::Quantity{Float64,m_unit}
    w::Quantity{Float64,m_unit}
    h::Quantity{Float64,m_unit}
end

mutable struct Model_struct
    QD::Union{QD_struct, Nothing}
    B::Vector{Quantity{Float64,B_unit}}
    ε::Vector{Quantity{Float64,ε_unit}}
    E::Vector{Quantity{Float64,E_unit}}
end

QD = QD_struct(
    3u"meV",
    0.5u"meV",
    5u"nm",
    2u"nm",
    5u"nm",
)

model = Model_struct(
    nothing,
    zeros(Float64, 3) * 1u"T",
    zeros(Float64, 3) * 1u"V/m",
    zeros(Float64, 4) * 1u"eV",
)

end
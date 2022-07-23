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

struct Model_struct
    QD::QD_struct
    B::Vector{Quantity{Float64,B_unit}}
    ε::Vector{Quantity{Float64,ε_unit}}
    E::Vector{Quantity{Float64,E_unit}}
end

QD = QD_struct(
    1u"eV",
    1u"eV",
    1u"m",
    1u"m",
    1u"m",
)

model = Model_struct(
    QD,
    [0, 0, 1.0] * 1u"T",
    [0, 0, 1.0] * 1u"V/m",
    [0, 0, 1.0] * 1u"eV",
)

end
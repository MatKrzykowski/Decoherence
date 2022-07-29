module Options

using Unitful
using Parameters

include("constants.jl")
import .Constants: B_unit, ε_unit, E_unit, m_unit

@with_kw struct Ops
    carrier::Char = 'h'
    n_states::Int64 = 4
    ODE_abstol::Float64 = 1e-13
    ODE_reltol::Float64 = 1e-13
    read_from_file::Bool = false
    output_filename::String = "output.csv"

    is_hole::Function = () -> carrier == 'h'
    is_electron::Function = () -> carrier == 'e'
end

options = Ops()

struct QD_struct
    ΔE::Quantity{Float64,E_unit}
    t::Quantity{Float64,E_unit}
    r::Quantity{Float64,m_unit}
    w::Quantity{Float64,m_unit}
    h::Quantity{Float64,m_unit}
end

QD = QD_struct(
    3u"meV",
    0.5u"meV",
    5u"nm",
    2u"nm",
    5u"nm",
)

end
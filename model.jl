module Model

using Unitful
using LinearAlgebra

include("constants.jl")
include("options.jl")
import .Constants: B_unit, ε_unit, E_unit, m_unit
import .Options: options, QD_struct, QD

struct Model_struct
    QD::Union{QD_struct,Nothing}
    B::Vector{Quantity{Float64,B_unit}}
    ε::Vector{Quantity{Float64,ε_unit}}
    E::Vector{Quantity{Float64,E_unit}}
    H::Hermitian{Quantity{ComplexF64,E_unit},Matrix{Quantity{ComplexF64,E_unit}}}
    ĝ::Vector{Matrix{Float64}}
end

function gen_model()::Model_struct
    if options.read_from_file
        model = gen_model_from_files()
    else
        model = gen_model_from_params()
    end
    return model
end

# TO-DO: implement based off of Python
function gen_model_from_files()::Model_struct
    return Model_struct(
        nothing,
        zeros(Float64, 3) * 1u"T",
        zeros(Float64, 3) * 1u"V/m",
        zeros(Float64, 4) * 1u"eV",
        Hermitian(zeros(ComplexF64, 4, 4) * u"eV"),
        [
            Matrix([0.0 0.0 0.0; 0.0 0.0 0.0; 0.0 0.0 0.0]),
            Matrix([0.0 0.0 0.0; 0.0 0.0 0.0; 0.0 0.0 0.0]),
        ]
    )
end

function gen_model_from_params()::Model_struct
    return Model_struct(
        QD,
        zeros(Float64, 3) * 1u"T",
        zeros(Float64, 3) * 1u"V/m",
        zeros(Float64, 4) * 1u"eV",
        Hermitian(zeros(ComplexF64, 4, 4) * u"eV"),
        [
            Matrix([0.0 0.0 0.0; 0.0 0.0 0.0; 0.0 0.0 0.0]),
            Matrix([0.0 0.0 0.0; 0.0 0.0 0.0; 0.0 0.0 0.0]),
        ]
    )
end

gen_model().QD
end
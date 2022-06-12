module Simulation

include("common.jl")
using Unitful
import .Common: ε_unit, B_unit, E_unit

struct Sim
    ε::Vector{Quantity{Float64,ε_unit}}
    B::Vector{Quantity{Float64,B_unit}}
    E::Vector{Quantity{Float64,E_unit}}
end

function read_Sim_from_files(n_struct::Int64, n_calc::Int64, wkr_single::String)::Sim
    return Sim([0.0, 0.0, 0.0]u"V/m", [0.0, 0.0, 0.0]u"T", [0.0, 0.0, 0.0, 0.0]u"J")
end

function gen_Sim_from_assumptions()::Sim
    return Sim([0 0 0]u"V/m", [0 0 0]u"T", [0 0 0 0]u"meV")
end

end
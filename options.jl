module Options

using Parameters

@with_kw struct Ops
    carrier::Char = 'h'
    n_states::Int64 = 4
    ODE_abstol::Float64 = 1e-13
    ODE_reltol::Float64 = 1e-13
    output_filename::String = "output.csv"

    is_hole::Function = () -> carrier == 'h'
    is_electron::Function = () -> carrier == 'e'
end

options = Ops()

end
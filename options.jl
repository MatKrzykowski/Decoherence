module Options

using Parameters

@with_kw struct Ops
    carrier::Char = 'h'
    n_states::Int64 = 4

    is_hole::Function = () -> carrier == 'h'
    is_electron::Function = () -> carrier == 'e'
end

end
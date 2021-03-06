using DifferentialEquations
using LinearAlgebra

include("common.jl")
include("constants.jl")
include("options.jl")
using .Common: commutator
using .Constants: σ_x, σ_0, ħ, μ_B, time_unit
using .Options: options
using Unitful # For physical units

u0 = zeros(ComplexF64, 4, 4)
u0[1, 1] = 1.0
u0

function f(ρ, p, t)
    H = p
    result = -1im / ħ * commutator(H, ρ)
    result * 1u"s"
end

B = 1u"T"
H = Hermitian(B * μ_B * kron(σ_0, σ_x))

# display(f((H), u0, 0.0))

params = (H)
tspan = (0.0u"s", 1.0u"ns") ./ 1u"s"
prob = ODEProblem(f, u0, tspan, params)
sol = solve(prob, abstol=options.ODE_abstol, reltol=options.ODE_reltol)
sol

using Plots
gr()

plot(sol.t, real([x[1, 1] for x in sol.u]))
plot!(sol.t, real([x[2, 2] for x in sol.u]))
plot!(sol.t, real([tr(x) for x in sol.u]), label="trace")
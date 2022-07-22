using DifferentialEquations
using LinearAlgebra

include("common.jl")
using .Common: σ_x, σ_0, commutator, ħ, μ_B, time_unit
using Unitful # For physical units

u0 = zeros(ComplexF64, 4, 4)
u0[1, 1] = 1.0
u0

function f(ρ, p, t)
    H, time_unit = p
    -1im / ħ * commutator(H, ρ) * time_unit
end

B = 1u"T"
H = B * μ_B * kron(σ_0, σ_x)
f(u0, (H, 0), 0)
-1im / ħ * commutator(H, u0)
# f(u, p, t) = 0.98u
# u0 = 1.0

params = (H, time_unit)
tspan = (0.0u"s", 500u"ps")
prob = ODEProblem(f, u0, tspan ./ time_unit, params)
sol = solve(prob, abstol=1e-9, reltol=1e-9)
sol

# x = [x[1, 1] for x in sol.u]



using Plots
gr()

plot(sol.t, real([x[1, 1] for x in sol.u]))
plot!(sol.t, real([x[2, 2] for x in sol.u]))
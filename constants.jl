module Constants

using PhysicalConstants.CODATA2018 # For physical constants
using Unitful # For physical units

##################
# Pauli matrices #
##################

# Pauli matrices
const σ_0 = [1.0 0.0; 0.0 1.0]
const σ_x = [0.0 1.0; 1.0 0.0] / 2
const σ_y = [0.0 -1.0im; 1.0im 0.0] / 2
const σ_z = [1.0 0.0; 0.0 -1.0] / 2
const vec_σ = [σ_x, σ_y, σ_z]

######################
# Physical constants #
######################

const ħ = PlanckConstant / 2 / π # Reduced planck constant
const μ_B = BohrMagneton # Bohr magneton
const k_B = BoltzmannConstant # Boltzmann constant

#######################
# Material parameters #
#######################

const c_l = 5.15e3u"m/s" # Speed of sound in GaAs

#######################
# Physical quantities #
#######################

const ε_unit = typeof(1.0u"V/m").parameters[2]
const E_unit = typeof(1.0u"J").parameters[2]
const B_unit = typeof(1.0u"T").parameters[2]
const time_unit = 1u"ns"

end

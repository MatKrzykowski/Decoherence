include("common.jl")
include("decoherence.jl")
# import .common: Options
using ProgressBars
import .Decoherence: decoherence

# n_struct = [11]
# n_calc = 4:40
# options = Options()

# for (n_str, n_calc) in ProgressBar(product(n_struct, n_calc)
#                                    position=0,  # Position on top of the output
#                                    description="Calculation")  # Description
#     decoherence(n_str, n_calc, options)
# end

for i in ProgressBar(1:10, leave = true)
    decoherence()
end
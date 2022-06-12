module Decoherence

include("common.jl")
using ProgressBars
import .Common: move_cursor

function decoherence()
    x = 0
    for j in ProgressBar(1:10000000)
        x += 1
    end
    move_cursor()
end

end
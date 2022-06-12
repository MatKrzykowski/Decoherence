module Decoherence

using ProgressBars, Ansillary

function decoherence()
    x = 0
    for j in ProgressBar(1:10000000)
        x += 1
    end
    Cursor.move!(Cursor.Up(1))
end

end
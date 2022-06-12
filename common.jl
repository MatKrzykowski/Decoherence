# Function calculating commutator or two matrices
function commutator(A::AbstractMatrix, B::AbstractMatrix)::AbstractMatrix
    A * B - B * A
end

module GTensor

struct gTensor{gType<:AbstractMatrix{Float64}}
    g1::gType
    g2::gType
end

end
using QuadGK

function FF(i::Int, j::Int, ω::Float64, u::Float64)::Float64
    @assert 1 <= i <= 4
    @assert 1 <= j <= 4

    i = (i + 1) ÷ 2
    j = (j + 1) ÷ 2
    sign = i == 1 ? 1 : -1

    sigma_pow2 = l_xy^2 * (1.0 - u^2) + (l_z * u)^2

    if i == j # F++ || F--
        result = exp(1im * sign * ω / cl * r0 * u)
    else # //F+- || F-+
        result = exp(-r0 * r0 / sigma_pow2 / 2.0)
    end

    return result * exp(-1.0 * (ω / cl / 2.0)^2 * sigma_pow2)
end


quadgk(sin, 0, π)

# auto R_int = [&params](double u) -> double {
#                  double *alpha = (double *)params;
#                  double result;
#                  int    i, j, k, l;

#                  i = (int)alpha[0];
#                  j = (int)alpha[1];
#                  k = (int)alpha[2];
#                  l = (int)alpha[3];
#                  double omega = alpha[5];

#                  result = FF(i, j, omega, u) * FF(l, k, omega, u)

#                  return result;
#              };
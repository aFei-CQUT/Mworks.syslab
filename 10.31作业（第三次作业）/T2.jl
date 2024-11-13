using TyBase
using TyMath
using TyOptimization

function reaction_equations(v)

    x_A, T = v[1], v[2]

    T0 = 450.0 # 初始温度，K
    CA0 = 1.0 # 初始浓度，单位为 mol/L
    ΔHr_ρCp = 250.0 # 反应热相关参数，单位为 K
    k0 = exp(20)
    E_R = 10000.0 # 活化能与气体常数比值，K
    τ = 0.25 # 停留时间，h

    # 非线性方程组
    f1 = k0 * CA0 * (1 - x_A)^2 * τ * exp(-E_R / T) - x_A
    f2 = T - T0 - ΔHr_ρCp * x_A

    return [f1, f2]

end

# 使用fsolve求解
initial_guess = [0.5, 450.0] # 初始猜测值 [x_A, T]
result, _ = fsolve(reaction_equations, initial_guess)

println("反应物 A 的转化率 x_A 为 $(result[1])")
println("反应物 A 的反应温度 T 为 $(result[2]) K")

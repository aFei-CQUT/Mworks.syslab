using TyBase
using TyMath
using TyOptimization

const R = 8.314 # 气体常数 J/(mol·K)

# NH3 的临界参数
Tc = 405.5 # 临界温度，K
Pc = 11.3e6 # 临界压力，Pa
a = 0.42748 * R^2 * Tc^2.5 / Pc
b = 0.08664 * R * Tc / Pc

# 修改 R-K 方程
function RK_equation(P, V_m, T)
    
    return P - R * T / (V_m - b) + a / (T^0.5 * V_m * (V_m + b))
    
end

# 初始状态参数
P1 = 2.03e6 # 初始压力，Pa
T1 = 477.0 # 初始温度，K
V1 = 2.83  # 初始体积，m^3

# 求解初始状态下的摩尔体积 V_m1
# 初始猜测摩尔体积，假设为理想气体
initial_guess_Vm1 = R * T1 / P1
V_m1, _ = fzero(V_m -> RK_equation(P1, V_m, T1), initial_guess_Vm1)
println("初始状态摩尔体积 V_m1 = $(V_m1) m³/mol")

# 计算初始状态下的摩尔数 n
n = V1 / V_m1
println("总摩尔数 n = $(n) mol")

# 压缩后的状态参数
T2 = 448.6 # 压缩后的温度，K
V2 = 0.142 # 压缩后的体积，m^3

# 计算压缩后状态下的摩尔体积 V_m2
V_m2 = V2 / n
println("压缩后摩尔体积 V_m2 = $(V_m2) m³/mol")

# 使用理想气体方程估算初始猜测压力
initial_guess_P2 = n * R * T2 / V2
println("初始猜测压力 P2 = $(initial_guess_P2) Pa")

# 使用 R-K 方程求解压缩后的压力 P2
P2, _ = fzero(P -> RK_equation(P, V_m2, T2), initial_guess_P2)

println("压缩后的压力为 $(P2) Pa")

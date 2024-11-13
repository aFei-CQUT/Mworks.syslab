using TyBase
using TyMath
using TyPlot
using Printf

# 常量定义
const Pc = 11.28e6      # Pa
const Tc = 405.65       # K
const w = 0.2526        # 无量纲
const R = 8.314         # J/(mol·K)

# 定义 Pr 和 Tr 的网格数据（示例数据，请根据实际表格数据替换）
Pr_values = [0.2, 0.4, 0.6, 0.8, 1.0]       # 示例 Pr 网格
Tr_values = [1.0, 1.2, 1.4, 1.6, 1.8]       # 示例 Tr 网格

# 示例 Z0 和 Z1 表格数据 (Pr × Tr)，实际应用中，这些数据应来自于 NH₃ 的压缩因子表格
Z0_table = [
    1.1  1.09 1.07 1.05 1.03;
    1.0  0.99 0.97 0.95 0.93;
    0.9  0.89 0.87 0.85 0.83;
    0.8  0.79 0.77 0.75 0.73;
    0.7  0.69 0.67 0.65 0.63
]

Z1_table = [
    0.05 0.048 0.046 0.044 0.042;
    0.04 0.038 0.036 0.034 0.032;
    0.03 0.028 0.026 0.024 0.022;
    0.02 0.018 0.016 0.014 0.012;
    0.01 0.008 0.006 0.004 0.002
]

# 使用 meshgrid2 创建二维网格数据
Pr_grid, Tr_grid = meshgrid2(Pr_values, Tr_values)

# 定义二维插值函数
function get_Z(Pr, Tr, Pr_grid, Tr_grid, Z0_table, Z1_table, w)
    # 确保 Pr 和 Tr 是标量，因为上面运算出来的Pr，Tr是矩阵
    if !isscalar(Pr) || !isscalar(Tr)
        error("Pr 和 Tr 必须是标量")
    end
    
    # 使用 TyMath.interp2 进行二维插值
    Z0 = TyMath.interp2(Pr_grid, Tr_grid, Z0_table, Pr, Tr)
    Z1 = TyMath.interp2(Pr_grid, Tr_grid, Z1_table, Pr, Tr)
    
    # 确保 Z0 和 Z1 是标量
    Z0 = isscalar(Z0) ? Z0 : Z0[1]
    Z1 = isscalar(Z1) ? Z1 : Z1[1] # ? : 是三元运算符，? 表示判断，为真时执行 : 前面的，为假时执行 : 后面的
    
    Z = Z0 + w * Z1
    return Z
end

# 状态1已知
P1 = 2.03e6       # Pa
V1 = 2.83         # m³
T1 = 477.0        # K

# 对比压力和对比温度
Pr1 = P1 / Pc
Tr1 = T1 / Tc

# 获取状态1的 Z
Z_1th_state = get_Z(Pr1, Tr1, Pr_grid, Tr_grid, Z0_table, Z1_table, w)

# 计算物质的量 n
n = (P1 * V1) / (Z_1th_state * R * T1)

@printf("使用普维法计算得到的物质的量 n = %.6f mol\n", n)

# 终止条件
T2 = 448.6        # K
V2 = 0.142        # m³

# 计算状态2的摩尔体积
v2 = V2 / n

# 迭代求解状态2的 P2
# 初始化 P2 的猜测值，假设初始为理想气体情况
P2 = (R * T2) / v2

# 设置迭代参数
tolerance = 1e-6
max_iterations = 100
global iteration = 0
global abs_error = 1.0

while abs_error > tolerance && iteration < max_iterations
    global iteration += 1
    global Pr2 = P2 / Pc
    global Tr2 = T2 / Tc
    global Z2 = get_Z(Pr2, Tr2, Pr_grid, Tr_grid, Z0_table, Z1_table, w)
    
    println("Debug: Z2 = ", Z2, " type: ", typeof(Z2))
    
    P2_new = (Z2 * R * T2) / v2
    global abs_error = abs(P2_new - P2)
    global P2 = P2_new
    
    println("Debug: P2 = ", P2, " type: ", typeof(P2))
end

if iteration == max_iterations
    println("迭代未收敛。")
else
    @printf("\n使用普压法迭代试差计算得到的 P2 = %.6f MPa\n", P2 / 1e6)
    @printf("迭代次数: %d\n", iteration)
end

# 计算并打印其他参数
Z2_final = (P2 * v2) / (R * T2)
Pr2_final = P2 / Pc
Tr2_final = T2 / Tc

@printf("\n其他参数:\n")
@printf("v2 = %.6f m³/mol\n", v2)
@printf("Z2 = %.6f\n", Z2_final)
@printf("Pr2 = %.6f\n", Pr2_final)
@printf("Tr2 = %.6f\n", Tr2_final)

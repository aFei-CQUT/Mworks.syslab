using TyBase, TyMath

# 已知变量
F = 70.0  # 进料流量 (kg-mol/min)
x_feed = [0.15, 0.25, 0.40, 0.20]  # 进料中各成分的摩尔分数: [二甲苯, 苯乙烯, 甲苯, 苯]

# 各支流成分的摩尔分数
x_D1 = [0.07, 0.04, 0.54, 0.35]
x_B1 = [0.24, 0.42, 0.16, 0.18]
x_D2 = [0.15, 0.10, 0.54, 0.21]
x_B2 = [0.24, 0.65, 0.10, 0.01]

# 计算各成分的进料量
b = F .* x_feed  # [10.5, 17.5, 28.0, 14.0]

# 系数矩阵 A
A = [
    x_D1[1]  x_B1[1]  x_D2[1]  x_B2[1]
    x_D1[2]  x_B1[2]  x_D2[2]  x_B2[2]
    x_D1[3]  x_B1[3]  x_D2[3]  x_B2[3]
    x_D1[4]  x_B1[4]  x_D2[4]  x_B2[4]
]

# 解线性方程组 Ax = b，得到 D1, B1, D2, B2 的流量
flow_rates = A \ b

# 格式化输出，保留3位小数，并且进行右对齐
println("D1的流量为：", lpad(string(round(flow_rates[1], digits=3)), 10), " kg-mol/min")
println("B1的流量为：", lpad(string(round(flow_rates[2], digits=3)), 10), " kg-mol/min")
println("D2的流量为：", lpad(string(round(flow_rates[3], digits=3)), 10), " kg-mol/min")
println("B2的流量为：", lpad(string(round(flow_rates[4], digits=3)), 10), " kg-mol/min")

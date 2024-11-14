using TyBase, TyMath

# --- 第一小问求解 ---

# 进料流量 (kg-mol/min)
F = 70.0  

# 进料中各成分的摩尔分数: [二甲苯, 苯乙烯, 甲苯, 苯]
x_feed = [0.15, 0.25, 0.40, 0.20]

# 各支流成分的摩尔分数
x_D1 = [0.07, 0.04, 0.54, 0.35]
x_B1 = [0.24, 0.42, 0.16, 0.18]
x_D2 = [0.15, 0.10, 0.54, 0.21]
x_B2 = [0.24, 0.65, 0.10, 0.01]

# 计算各成分的进料量
b = F .* x_feed

# 系数矩阵 A, 列拼接
A = [x_D1 x_B1 x_D2 x_B2]

# 对于线性方程组 Ax = b 求解, 有 x = A^(-1) b
# 对于本题有 A flow_rates = b, 所以用左乘 A 的逆矩
flow_rates = A \ b
flow_rates = inv(A) * b

# 格式化输出，保留3位小数并进行右对齐
println("---------------- 第一小问求解 ----------------")
println()

# 以表格的形式输出D1, B1, D2, B2的流量
println(rpad("支流", 10), rpad("流量 (kg-mol/min)", 20))
println(rpad("D1", 10), rpad(string(round(flow_rates[1], digits=3)), 20, " "))
println(rpad("B1", 10), rpad(string(round(flow_rates[2], digits=3)), 20, " "))
println(rpad("D2", 10), rpad(string(round(flow_rates[3], digits=3)), 20, " "))
println(rpad("B2", 10), rpad(string(round(flow_rates[4], digits=3)), 20, " "))

# --- 第二小问求解 ---

# 计算D和B的总流量
D = flow_rates[1] + flow_rates[2]
B = flow_rates[3] + flow_rates[4]

# 计算D和B的各成分摩尔分数
x_D = (flow_rates[1] * x_D1 .+ flow_rates[2] * x_D2) ./ D
x_B = (flow_rates[3] * x_B1 .+ flow_rates[4] * x_B2) ./ B

println()
println("---------------- 第二小问求解 ----------------")
println()

# 输出D的流量及各成分摩尔分数
println(rpad("物流", 10), rpad("流量 (kg-mol/min)", 20))
println(rpad("D", 10), rpad(string(round(D, digits=3)), 20, " "))
println()
println(rpad("物质", 10), rpad("摩尔分数", 20))
println(rpad("二甲苯", 10), rpad(string(round(x_D[1], digits=3)), 20, " "))
println(rpad("苯乙烯", 10), rpad(string(round(x_D[2], digits=3)), 20, " "))
println(rpad("甲苯", 10), rpad(string(round(x_D[3], digits=3)), 20, " "))
println(rpad("苯", 10), rpad(string(round(x_D[4], digits=3)), 20, " "))

# 输出B的流量及各成分摩尔分数
println()
println(rpad("物流", 10), rpad("流量 (kg-mol/min)", 20))
println(rpad("B", 10), rpad(string(round(B, digits=3)), 20, " "))
println()
println(rpad("物质", 10), rpad("摩尔分数", 20))
println(rpad("二甲苯", 10), rpad(string(round(x_B[1], digits=3)), 20, " "))
println(rpad("苯乙烯", 10), rpad(string(round(x_B[2], digits=3)), 20, " "))
println(rpad("甲苯", 10), rpad(string(round(x_B[3], digits=3)), 20, " "))
println(rpad("苯", 10), rpad(string(round(x_B[4], digits=3)), 20, " "))

using TyBase
using TyMath
using TyPlot
using Printf

# 反应温度
T = 389.0

# 微分方程组
function reaction_odes(t, concentrations)

    global T
    c_A, c_B = concentrations

    dcAdt = -4000 * exp(-2500 / T) * c_A^2
    dcBdt = 4000 * exp(-2500 / T) * c_A^2 - 620000 * exp(-5000 / T) * c_B

    return [dcAdt, dcBdt]

end

# 变量范围
time_span = [0.0, 50.0]

# 初始条件
initial_conditions = [1.0, 0.0]

# ode45 求解
t_values, concentrations = ode45(reaction_odes, time_span, initial_conditions)

# 打印结果（仅打印部分数据以便查看）
@printf("Time\t\tc_A\t\tc_B\n")
for i in 1:10  # 打印前10行数据
    t = t_values[i]
    c_A = concentrations[i, 1]  # 访问每个时间点的c_A浓度
    c_B = concentrations[i, 2]  # 访问每个时间点的c_B浓度
    @printf("%f\t%f\t%f\n", t, c_A, c_B)
end

# 绘制浓度随时间变化的图
figure()
plot(t_values, concentrations[:, 1], "b", label="C_A")
hold("on")
plot(t_values, concentrations[:, 2], "r", label="C_B")
xlabel("Time")
ylabel("Concentration")
title("Concentration vs Time")
legend()

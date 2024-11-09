using TyBase
using TyMath
using TyPlot

# 定义反应速率方程
function reaction_odes(t, C)

    k1 = 1.0 # min^-1
    k2 = 5.0 # min^-1
    CA, CB, CC = C[1], C[2], C[3]

    dCA_dt = -k1 * CA
    dCB_dt = k1 * CA - k2 * CB
    dCC_dt = k2 * CB

    return [dCA_dt, dCB_dt, dCC_dt]
    
end

# 初始条件和时间区间
C0 = [1.5, 0.0, 0.0] # 初始浓度 CA0, CB0, CC0
tspan = [0.0, 10.0] # 时间区间，单位为分钟

# 使用ode45求解
t, C = ode45(reaction_odes, tspan, C0)

# 绘制浓度随时间变化的图
figure()
hold("on")
plot(t, C[:,1], label="C_A")
plot(t, C[:,2], label="C_B")
plot(t, C[:,3], label="C_C")

# 设置坐标轴标签和标题
xlabel("Time (min)")
ylabel("Concentration")
title("Concentration vs. Time")

# 显示图例
legend();

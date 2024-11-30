using TyBase
using TyMath
using TyPlot

x = vec([0 10 20 30 40 50 60])
y = vec([1.788 1.305 1.004 0.8012 0.6532 0.5492 0.4698])
xi = vec([5 12 28 35 44 56])

y_linear = interp1(x, y, xi)
y_spline = interp1(x, y, xi, "spline")

# 创建画布
figure()

# 保持当前图形，允许后续绘制
hold("on")

# 绘制原始数据点
scatter(x, y, "g", label="原始数据")

# 绘制线性插值结果
plot(xi, y_linear, "k*-", label="线性插值") # 黑色星号标记，带线

# 绘制样条插值结果
plot(xi, y_spline, "ro", label="样条插值") # 红色圆圈标记

# 图标题
title("插值比较")

# x 轴标题
xlabel("t")

# y 轴标题
ylabel("viscosity")

# 添加图例
legend("data", "linear interpolation", "spline interpolation");
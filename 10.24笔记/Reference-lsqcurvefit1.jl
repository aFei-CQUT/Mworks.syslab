using TyOptimization  # 导入优化库
using TyPlot          # 导入绘图库

# 定义拟合函数
fun = (x, xdata) -> x[1] .* exp.(x[2] .* xdata) 
# 拟合函数形式：y = A * exp(B * x)，其中A为x[1]，B为x[2]

# 初始猜测值
x0 = [100, -1]  # 参数初始猜测：A=100，B=-1

# 自变量数据（观测值）
xdata = [0.9, 1.5, 13.8, 19.8, 24.1, 28.2, 35.2, 60.3, 74.6, 81.3]
# 因变量数据（观测值）
ydata = [455.2, 428.6, 124.1, 67.3, 43.2, 28.1, 13.1, -0.4, -1.3, -1.5]

# 执行最小二乘曲线拟合
x, = lsqcurvefit(fun, x0, xdata, ydata)
# x为拟合得到的参数向量

# 创建用于绘图的时间范围
times = LinRange(xdata[1], xdata[end], 100) 
# 在自变量数据的范围内生成100个均匀分布的点

# 绘制结果
plot(xdata, ydata, "ko", times, fun(x, times), "b-") 
# 用黑色圆点绘制原始数据，用蓝色线绘制拟合曲线

legend(["Data", "Fitted exponential"])   # 添加图例
title("Data and Fitted Curve")           # 添加标题
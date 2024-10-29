using TyOptimization
using TyPlot

# 定义拟合函数
fun = (x, xdata) -> x[1] * exp.(x[2] * xdata)

# 初始猜测值
x0 = [1/2, -2]

# 自变量数据
xdata = LinRange(0, 3, 100)

# 生成带噪声的因变量数据
ydata = exp.(-1.3 .* xdata) + 0.05 .* randn(size(xdata))

# 设置边界条件
lb = [0, -2]      # 下界
ub = [3/4, -1]    # 上界

# 执行最小二乘曲线拟合
x, resnorm = lsqcurvefit(fun, x0, xdata, ydata, lb, ub)

# 绘制结果
plot(xdata, ydata, "ko", xdata, fun(x, xdata), "b-")
legend(["Data", "Fitted exponential"])
title("Data and Fitted Curve")
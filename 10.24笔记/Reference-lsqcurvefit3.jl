using TyOptimization  # 导入优化库
using TyMath          # 导入数学库
using TyPlot          # 导入绘图库

# 定义真实参数
a = 2      # x[1]，线性项的系数
b = 4      # x[2]，反正切函数的系数
t0 = 5     # x[3]，反正切函数的平移参数
c = 1/2    # x[4]，线性项的另一个系数

# 设置随机数生成器
rng = MT19937ar(5489)  # 使用Mersenne Twister随机数生成器

# 生成数据
xdata = LinRange(2, 7, 100)  # 在区间[2, 7]上生成100个均匀分布的点
ydata = a .+ b .* atan.(xdata .- t0) .+ c .* xdata .+ 1 ./ 10 .* randn(rng, size(xdata)) # 根据真实参数生成带噪声的数据点

# 定义拟合函数
myfun = (x, xdata) -> begin
    a = x[1]               # 提取参数a
    b = x[2]               # 提取参数b
    t0 = x[3]              # 提取参数t0
    c = x[4]               # 提取参数c
    F = a .+ b .* atan.(xdata .- t0) .+ c .* xdata  # 根据参数计算拟合值
    return F               # 返回拟合值
end

startpt = [1, 2, 3, 1]    # 初始猜测值
lb = zeros(4)             # 下界：所有参数的下界为0
ub = fill(7, 4)           # 上界：所有参数的上界为7
A = [-1 -1 1 1]           # 不等式约束矩阵
b = [0]                   # 不等式约束右侧常数
Aeq = []                  # 等式约束矩阵为空
beq = []                  # 等式约束右侧常数为空

# 执行最小二乘曲线拟合
x, res = lsqcurvefit(myfun, startpt, xdata, ydata, lb, ub, A, b, Aeq, beq)

# 绘制拟合结果
plot(xdata, ydata, "ro", xdata, myfun(x, xdata), "b-") # 用红色圆点绘制原始数据，用蓝色线绘制拟合曲线

# 输出拟合结果的参数乘以约束矩阵A（用于验证）
A * x
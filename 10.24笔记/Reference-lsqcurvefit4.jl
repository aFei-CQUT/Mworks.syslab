using TyOptimization  # 导入优化库
using TyMath          # 导入数学库
using TyPlot          # 导入绘图库

a = 2      # x[1]，线性项的系数
b = 4      # x[2]，反正切函数的系数
t0 = 5     # x[3]，反正切函数的平移参数
c = 1/2    # x[4]，线性项的另一个系数

rng = MT19937ar(5489)        # 设置随机数生成器

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

# 生成数据
xdata = LinRange(2, 7, 100)  # 在区间[2, 7]上生成100个均匀分布的点
ydata = a .+ b .* atan.(xdata .- t0) .+ c .* xdata .+ 1 ./ 10 .* randn(rng, size(xdata)) # 根据真实参数生成带噪声的数据点

# 绘制原始数据点
plot(xdata, ydata, "ro")  # 用红色圆点绘制数据点

# 设置参数的边界条件
lb = zeros(4)              # 下界：所有参数的下界为0
ub = fill(7, 4)            # 上界：所有参数的上界为7

# 定义线性约束（此处没有使用）
A = []                      # 线性不等式约束矩阵为空
b = []                      # 不等式约束右侧常数为空
Aeq = []                    # 等式约束矩阵为空
beq = []                    # 等式约束右侧常数为空

# 定义非线性约束函数
nlcon = x -> 
begin
    ceq = Float64[]       # 等式约束（此处为空）
    c = [x[1]^2 + x[2]^2 - 4^2]  # 不等式约束：x[1]^2 + x[2]^2 <= 16 (即半径为4的圆)
    return c, ceq         # 返回不等式和等式约束
end

x, res = lsqcurvefit(myfun, startpt, xdata, ydata, lb, ub, A, b, Aeq, beq, nlcon)

# 输出拟合结果和残差
println("Fitted parameters: ", x)
println("Residual: ", res)

# 绘制拟合结果与原始数据点
plot(xdata, ydata, "ro", xdata, myfun(x, xdata), "b-") 
legend(["Data", "Fitted curve"])  # 添加图例
title("Data and Fitted Curve")     # 添加标题

# 计算并输出约束函数值
c, ceq = nlcon(x)
println("Nonlinear inequality constraint (c): ", c)
println("Nonlinear equality constraint (ceq): ", ceq)

# 输出约束状态信息
if c[1] < 1e-8 
    println("Nonlinear inequality constraint is active at the solution.")
else 
    println("Nonlinear inequality constraint is not active at the solution.")
end

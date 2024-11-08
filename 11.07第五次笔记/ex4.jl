using TyOptimization

println( "-------------------------第一小问-------------------------")

# 定义目标函数系数（注意：我们将最大化问题转换为最小化问题）
f = [-70, -120]  # 取负值来转换最大化为最小化

# 定义不等式约束矩阵和右侧约束值
A = [
    9 4;
    4 5;
    3 10
]
b = [3600, 2000, 3000]

# 定义整数约束
intcon = 1:2  # x1 和 x2 都是整数

# 定义变量下上界
lb = [0, 0]  # 下界为0
ub = [Inf, Inf]  # 上界为无穷大

# 调用 intlinprog 函数
x, fval, exitflag = intlinprog(f, intcon, A, b, [], [], lb, ub)

# 检查是否找到了可行解
if exitflag == 1
    println("最优解:")
    println("x1 = ", x[1])
    println("x2 = ", x[2])
    println("最大总收益: ", -fval)  # 注意：我们需要取负值来得到最大化问题的结果
else
    println("未找到可行解")
end



# 感觉效果并不是很好，毕竟 x1 多生产的话，滞销不能算在利润，而且还可能亏
println( "-------------------------第二小问-------------------------")

# 定义多目标函数
function fun(x)
    f1 = -70 * x[1] - 120 * x[2]  # 利润最大化（取负值）
    f2 = x[1]                     # 尽量减少甲产品的产量
    f3 = -x[2]                    # 尽量增加乙产品的产量
    return [f1, f2, f3]
end

# 定义约束条件
A = [9.0 4.0; 4.0 5.0; 3.0 10.0]
b = [3600.0, 2000.0, 3000.0]
Aeq = []  # 定义空矩阵
beq = []  # 定义空向量

# 定义非线性约束（这里没有，但为了完整性保留）
function nonlcon(x)
    c = []    # 非线性不等式约束
    ceq = []  # 非线性等式约束
    return c, ceq
end

# 定义初始点
x0 = [100.0, 100.0]

# 定义变量下界和上界
lb = [0.0, 0.0]
ub = [1000.0, 1000.0]

# 定义目标和权重
goal = [-200000.0, 100.0, -400.0] # 目标值，利润最大化并减少 x1 及增加 x2
weight = [1, 10, 10]  # 利润权重最小，次目标权重增加

# 设置优化选项
options = optimoptions(:fgoalattain,
    MaxIterations = 1000,
    MaxFunctionEvaluations = 10000,
    OptimalityTolerance = 1e-6,
    StepTolerance = 1e-6,
    ConstraintTolerance = 1e-6,
    FunctionTolerance = 1e-6,
    Display = "iter-detailed",
    SpecifyObjectiveGradient = false,
    SpecifyConstraintGradient = false,
    UseParallel = false
)

# 运行 fgoalattain
x, fval, attainfactor, exitflag, output, lambda = fgoalattain(fun, x0, goal, weight, A, b, Aeq, beq, lb, ub, nonlcon, options)

println("优化结果：")
println("x1 = $(x[1]), x2 = $(x[2])")
println("目标值 = $(fval)")
println("达成系数 = $(attainfactor)")
println("退出标志 = $(exitflag)")
println("输出信息 = $(output)")
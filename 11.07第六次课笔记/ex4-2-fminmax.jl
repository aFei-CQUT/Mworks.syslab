# ex4-2 尝试求解用到的函数： fminimax

# 第二小问：fminimax 求解
println( "-------------------------极大极小函数-------------------------")

# # 定义多目标函数
# function objectives(x)
#     f1 = -70 * x[1] - 120 * x[2]  # 利润最大化
#     f2 = -x[1]                    # x1 最大化:尽管题目中描述是“尽可能少”，但是算法会做选择，
#                                   # 要尽量达到所有约束边界以达到"利润最大"
#                                   # 但问题是此时的利润不应该算 70*x1，总会有滞销
#     f3 = -x[2]                    # x2 最大化
#     return [f1, f2, f3]
# end

# 拿不准应该最大化 x1，还是最小化 x1，感觉都有道理，这里取最小。
function objectives(x)
    f1 = -70 * x[1] - 120 * x[2]  # 利润最大化
    f2 = x[1]                     # x1 最小化
    f3 = -x[2]                    # x2 最大化
    return [f1, f2, f3]
end

# 定义约束条件
A = [9.0 4.0; 4.0 5.0; 3.0 10.0]
b = [3600.0, 2000.0, 3000.0]
Aeq = Array{Float64}(undef, 0, 0)  # 定义空矩阵
beq = Float64[]                    # 定义空向量
nonlcon = nothing                  # 使用 `nothing` 表示无非线性约束

# 定义初始点
x0 = [100.0, 300]

# 定义变量下界和上界
lb = [0.0, 0.0]
ub = [1000.0, 1000.0]

# 设置优化选项
options = optimoptions(:fminimax,
    Display = "iter-detailed",
    MaxFunctionEvaluations = 10000,
    MaxIterations = 10000,
    ConstraintTolerance = 1e-6,
    OptimalityTolerance = 1e-6,
    StepTolerance = 1e-6,
    FiniteDifferenceType = "central",
    TypicalX = [100.0, 100.0]
)
# 运行 fminimax
x, fval, maxfval, exitflag, output, lambda = fminimax(objectives, x0, A, b, Aeq, beq, lb, ub, nonlcon)

# 输出详细结果
println("\n优化结果:")
println("最优解:")
println("  x1 (甲产品) = ", round(x[1], digits=4))
println("  x2 (乙产品) = ", round(x[2], digits=4))
println("\n目标函数值:")
println("  利润 = ", round(-fval[1], digits=4))
println("  甲产品生产量 = ", round(fval[2], digits=4))
println("  乙产品生产量 = ", round(-fval[3], digits=4))
println("\n最大目标函数值 = ", round(maxfval, digits=4))
println("退出标志 = ", exitflag)

println("\n优化过程信息:")
println("  迭代次数: ", output.iterations)
println("  函数评估次数: ", output.funcCount)
println("  算法: ", output.algorithm)
println("  一阶最优性: ", round(output.firstorderopt, digits=6))
println("  收敛原因: ", output.message)

println("\n约束条件满足情况:")
for i in eachindex(b)
    constraint_value = A[i,1] * x[1] + A[i,2] * x[2]
    println("  约束 $i: ", round(constraint_value, digits=4), " <= ", b[i])
end

println("\nLagrange 乘子:")
println("  不等式约束: ", round.(lambda.ineqlin, digits=4))
println("  下界: ", round.(lambda.lower, digits=4))
println("  上界: ", round.(lambda.upper, digits=4))

println("\n优化选项:")
println("  最大函数评估次数: ", options.MaxFunctionEvaluations)
println("  最大迭代次数: ", options.MaxIterations)
println("  约束容差: ", options.ConstraintTolerance)
println("  最优性容差: ", options.OptimalityTolerance)
println("  步长容差: ", options.StepTolerance)
println("  有限差分类型: ", options.FiniteDifferenceType)
println("  典型 X 值: ", options.TypicalX)
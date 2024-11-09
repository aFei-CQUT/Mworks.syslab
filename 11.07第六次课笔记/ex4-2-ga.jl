# ex4-2 尝试求解用到的函数： ga

# 第二小问：ga 函数求解，一般是找到一个或多个可行解（可以接受的解）
println( "-------------------------遗传算法-------------------------")
# 遗传算法求解
using TyGlobalOptimization

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

# 定义不等式约束
cons_ueq1(x) = 9.0 * x[1] + 4.0 * x[2] - 3600.0
cons_ueq2(x) = 4.0 * x[1] + 5.0 * x[2] - 2000.0
cons_ueq3(x) = 3.0 * x[1] + 10.0 * x[2] - 3000.0

# 将不等式约束函数组合成元组
constraint_ueq = (cons_ueq1, cons_ueq2, cons_ueq3)

# 定义等式约束 (在这个问题中没有等式约束,但为了完整性我们保留一个空元组)
constraint_eq = ()

# 设置变量范围
lb = [0.0, 0.0]
ub = [1000.0, 1000.0]

# 设置优化选项
options = ga_options(
    N = 200,                 # 设置种群规模
    iterations = 1000,        # 设置最大迭代次数
    g_tol = 1e-4,            # 设置不等式约束的容差
    f_calls_limit = 1000000, # 设置目标函数最大评估次数
    g_calls_limit = 1000000, # 设置不等式约束函数最大评估次数
    time_limit = 600.0,      # 设置最大运行时间为10分钟
    store_convergence = true,# 存储每次迭代状态
    debug = true,            # 报告每次迭代状态
    seed = 3,                # 设置随机种子
    draw_picture = true      # 绘制收敛图
)

# 使用多目标遗传算法求解
result = ga(objectives, lb, ub, constraint_ueq, constraint_eq, options)
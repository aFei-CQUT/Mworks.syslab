# 记录 debug 日志
#
# julia> 正在运行 T2-debug2.jl
# ERROR: PosDefException: matrix is not positive definite; Cholesky factorization failed.
# Stacktrace:
#   [1] checkpositivedefinite
#     @ C:\Users\Public\TongYuan\julia-1.9.3\share\julia\stdlib\v1.9\LinearAlgebra\src\factorization.jl:18 [inlined]

# 导入库
using TyOptimization

# 匿名目标函数
fun = x -> 10 * x[1] + 4.4 * x[2]^2 + 2 * x[3]

# 修改方式如下
# fun = x -> -(10 * x[1] + 4.4 * x[2]^2 + 2 * x[3])

# 初始猜测值
x0 = [2, 2, 1]

# 线性不等式约束，Ax <= b
A = [1 4 5; 1 3 2]
b = [32, 29]

# 线性等式约束 (Aeq * x = beq)，此处为空
Aeq = []
beq = []

# 变量下界、上界
lb = [2, 0, 0]
ub = []  # 无上界

# 定义非线性约束，返回g(x) <= 0形式的不等式约束和cep(x) = 0的等式约束
nonlcon = x -> begin
    g = [-x[2]^2 - 0.5 * x[3]^2 + 3]  # 非线性不等式约束
    cep = []  # 无非线性等式约束
    return g, cep
end

# 使用fmincon求解优化问题，返回最优解和目标函数的最小值
optimized_results, fval = fmincon(fun, x0, A, b, Aeq, beq, VLB, VUB, nonlcon)

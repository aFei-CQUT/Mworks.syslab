# 记录 debug 报错

# julia> 正在运行 ex13-bug2.jl
# ERROR: ArgumentError: number of rows of each array must match (got (1, 3))
# Stacktrace:
#   [1] _typed_hcat(#unused#::Type{Float64}, A::Tuple{Matrix{Float64}, Matrix{Float64}})
#     @ Base .\abstractarray.jl:1654
#   [2] typed_hcat
#     @ .\abstractarray.jl:1641 [inlined]
#   [3] hcat
#     @ .\array.jl:1956 [inlined]

# 经过反复实验，是 Aeq，beq 这里出现了bug：如果Aeq，beq线性不等式约束和非线性约束同时存在，接口出现错误
# 解决办法可以指定算法 options = optimoptions(:fmincon, Algorithm="sqp")

# 情况1: 原始代码 (报错)
using TyOptimization

fun = (x) -> exp(x[1] + 2 * x[2]^2 + 4 * x[1] * x[2] + 2 * x[2] + 1)
x0 = [-1, 1]

A = []
b = []
Aeq = [1 1]
beq = [0]
lb = []
ub = []

nonlincon = x -> begin
    C = [
        1.5 + x[1] * x[2] - x[1] - x[2],
        -x[1] * x[2] - 10
    ]
    Ceq = []
    return C, Ceq
end

xopt, fval = fmincon(fun, x0, A, b, Aeq, beq, lb, ub, nonlincon)


# # 情况2: 移除线性等式约束 (可以运行)
# using TyOptimization

# fun = (x) -> exp(x[1] + 2 * x[2]^2 + 4 * x[1] * x[2] + 2 * x[2] + 1)
# x0 = [-1, 1]

# A = []
# b = []
# Aeq = []
# beq = []
# lb = []
# ub = []

# nonlincon = x -> begin
#     C = [
#         1.5 + x[1] * x[2] - x[1] - x[2],
#         -x[1] * x[2] - 10
#     ]
#     Ceq = []
#     return C, Ceq
# end

# xopt, fval = fmincon(fun, x0, A, b, Aeq, beq, lb, ub, nonlincon)


# # 情况3: 使用SQP算法 (可以运行)
# using TyOptimization

# fun = (x) -> exp(x[1] + 2 * x[2]^2 + 4 * x[1] * x[2] + 2 * x[2] + 1)
# x0 = [-1, 1]

# A = []
# b = []
# Aeq = [1 1]
# beq = [0]
# lb = []
# ub = []

# nonlincon = x -> begin
#     C = [
#         1.5 + x[1] * x[2] - x[1] - x[2],
#         -x[1] * x[2] - 10
#     ]
#     Ceq = []
#     return C, Ceq
# end

# options = optimoptions(:fmincon, Algorithm="sqp")
# xopt, fval = fmincon(fun, x0, A, b, Aeq, beq, lb, ub, nonlincon, options)


# # 情况4: 移除非线性约束 (可以运行)
# using TyOptimization

# fun = (x) -> exp(x[1] + 2 * x[2]^2 + 4 * x[1] * x[2] + 2 * x[2] + 1)
# x0 = [-1, 1]

# A = []
# b = []
# Aeq = [1 1]
# beq = [0]
# lb = []
# ub = []

# xopt, fval = fmincon(fun, x0, A, b, Aeq, beq, lb, ub)
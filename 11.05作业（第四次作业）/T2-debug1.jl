# 记录 debug 日志
#
# julia> 正在运行 T2-debug1.jl
# Closest candidates are:
#   -(::Any, ::PyCall.PyObject)
#    @ PyCall C:\Users\Public\TongYuan\.julia\packages\PyCall\9ZDyP\src\pyoperators.jl:14
#   -(::Union{Int128, Int16, Int32, Int64, Int8, UInt128, UInt16, UInt32, UInt64, UInt8})
#    @ Base int.jl:85
#   -(::T, ::T) where T<:Union{Int128, Int16, Int32, Int64, Int8, UInt128, UInt16, UInt32, UInt64, UInt8}
#    @ Base int.jl:86
#   ...

# Stacktrace:
#  [1] top-level scope
#    @ e:\LGRepository\Mworks.syslab-Gitee\11.05第五次课作业\T2-debug.jl:36

# 导入库
using TyOptimization

# 匿名目标函数
fun = (x) -> 10 * x[1] + 4.4 * x[2]^2 + 2 * x[3]

# 初始猜测值
x0 = [2, 2, 1]

# 线性不等式约束，Ax <= b
A = [
    1 4 5;
    1 3 2
]
b = [
    32,
    29
]

# 线性等式约束 (Aeq * x = beq)，此处为空
Aeq = []
beq = []

# 变量下界、上界
lb = [2, 0, 0]
ub = []  # 无上界

# 定义非线性约束，返回g(x) <= 0形式的不等式约束和cep(x) = 0的等式约束
nonlcon = x -> begin
    C = [-x[2]^2 - 0.5 * x[3]^2 + 3]  # 非线性不等式约束
    Ceq = []  # 无非线性等式约束
    return C, Ceq
end

# 使用fmincon求解优化问题，返回最优解和目标函数的最小值
xopt, fval = fmincon(-fun, x0, A, b, Aeq, beq, lb, ub, nonlcon)

# 修改方式如下
# xopt, fval = fmincon(x -> -fun(x), x0, A, b, Aeq, beq, lb, ub, nonlcon)
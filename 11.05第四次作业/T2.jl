using TyOptimization

# 目标函数(注意这里是最小化负收益,相当于最大化收益)
function objective(x)
    return -(10*x[1] + 4.4*x[2]^2 + 2*x[3])
end

# 初始猜测值
x0 = [2, 1, 1]

# 非线性约束条件
function nonlcon(x)
    c = [3 - 0.5*x[3]^2 - x[2]^2]  # 非线性不等式约束
    ceq = []                       # 没有非线性等式约束
    return c, ceq
end

# 线性约束条件
A = [
    1 4 5;
    1 3 2
]
     
b = [
    32,
    29
]

# 变量下界
lb = [2, 0, 0]

# 使用fmincon求解
result = fmincon(objective, x0, A, b, [], [], lb, [], nonlcon)

# 可指定不同算法
# options = optimoptions(:fmincon, Algorithm="sqp")
# result = fmincon(objective, x0, A, b, [], [], lb, [], nonlcon, options)
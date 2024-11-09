using TyOptimization

# 定义目标函数系数
f = [200, 200, 200, 200, 200, 200, 200]

# 定义不等式约束矩阵和右侧约束值
A = [
    0 0 1 1 1 1 1;
    1 0 0 1 1 1 1;
    1 1 0 0 1 1 1;
    1 1 1 0 0 1 1;
    1 1 1 1 0 0 1;
    1 1 1 1 1 0 0;
    0 1 1 1 1 1 0
]
b = [18, 15, 12, 16, 19, 14, 12]

# 定义整数约束
intcon = 1:7

# 定义变量下上界
lb = zeros(7)  # 下界为0
ub = fill(Inf, 7)  # 上界为无穷大

# 调用 intlinprog 函数
x, fval, _ = intlinprog(f, intcon, [], [], A, b, lb, ub)

println("最优解: ", x)
println("最小总费用: ", fval)

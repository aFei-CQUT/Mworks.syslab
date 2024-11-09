using TyOptimization

# 定义目标函数系数
coeff = [40, 36]  # 一维数组

# 定义不等式约束矩阵
A = [8 * 25 8 * 15]  # 二维数组

# 定义右侧约束值
b = [1800]  # 一维数组

# 定义变量下上界
lb = [0.0, 0.0]  # 下界
ub = [Inf, Inf]  # 上界

# 调用 linprog 函数
x, fval, _ = linprog(coeff, A, b, [], [], lb, ub, [])
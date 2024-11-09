using TyOptimization

# 定义目标函数系数
coefficients = [-350,-300,-250]  # 注意这里取负值,因为intlinprog默认是最小化问题

# 定义约束条件矩阵A和向量b
A = [0.57 0.57 0.29;   # KNO3约束
     0.43 0.29 0.29;   # Ca3(PO4)2约束
     0.00 0.14 0.42]   # (NH4)2SO4约束

b = [70, 60, 30]

# 定义约束条件矩阵Aeq和向量beq
Aeq = []
beq = []

# 定义变量的下界和上界
lb = [0, 0, 0]
ub = []  # 不设上界

# 求解
result = linprog(coefficients, A, b, Aeq, beq, lb, ub)
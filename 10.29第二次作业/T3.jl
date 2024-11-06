using TyBase, TyMath, Printf

# 定义方程
A = [1 1; 2 4]
b = [36; 100]

# 求解
x = linsolve(A, b)

# 输出结果
@printf("鸡有：%d只，兔有：%d只。\n", x[1], x[2])
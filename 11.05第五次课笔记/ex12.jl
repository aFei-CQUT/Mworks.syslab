using TyBase, TyMath, TyOptimization

#=

H = [
	1/2 0;
	0	1/2
]

c = [-1, -2]

A = [
	2 3;
	1 4
]

b = [6, 5]

lb = [0, 0]

ub = [Inf, Inf]

xopt, fval, _ = quadprog(H, c, A, b, [], [], lb, ub)

=#

# 换用fmincon

fun = x -> -x[1] - 2 * x[2] + 1/2 * x[1]^2 + 1/2 * x[2]^2
x0 = [1, 1]
A = [2 3; 1 4]
b =[6, 5]
Aeq = []
beq = []
lb = [0, 0]
ub = [Inf, Inf]

xopt, fval = fmincon(fun, x0, A, b, Aeq, beq, lb, ub)
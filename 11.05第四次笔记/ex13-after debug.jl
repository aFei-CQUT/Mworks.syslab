using TyOptimization

fun = (x) -> exp(x[1] + 2 * x[2]^2 + 4 * x[1] * x[2] + 2 * x[2] +1)
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
		-x[1] * x[2] -10  	# 减号后面没有空格
	]

	# C = [
    # 	1.5 + x[1] * x[2] - x[1] - x[2],
    # 	- x[1] * x[2] - 10  # 减号和数值之间保持一致的空格风格
	# ]

	# C = [
    # 	1.5+x[1]*x[2]-x[1]-x[2],
    # 	-x[1]*x[2]-10  # 符号之间全部无空格
	# ]

	Ceq = []

	return C, Ceq
end

options = optimoptions(:fmincon, Algorithm="sqp")

xopt, fval = fmincon(fun, x0, A, b, Aeq, beq, lb, ub, nonlincon, options)
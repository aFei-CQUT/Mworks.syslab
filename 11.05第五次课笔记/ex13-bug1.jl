# 记录 debug 报错

# julia> 正在运行 ex13.jl
# ERROR: syntax: missing separator in array expression
# Stacktrace:
#  [1] top-level scope
#    @ e:\LGRepository\Mworks.syslab\11.05第四次笔记\ex13.jl:19

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
		1.5 + x[1] * x[2] - x[1] - x[2] ,
		-x[1] * x[2] - 10
		]
		
	Ceq = []

	return C, Ceq
end

options = optimoptions(:fmincon, Algorithm="sqp")

xopt, fval = fmincon(fun, x0, A, b, Aeq, beq, lb, ub, nonlincon, options)
using TyOptimization

function = (x) -> exp(x[1] + 2 * x[2]^2 + 4 * x[1] * x[2] + 2 * x[2] +1)
x0 = [-1, 1]
A = []
b = []
Aeq = [1, 1]
beq = [0]
lb = []
ub = []

nonlincon = x -> begin
	nonlinuneq = [
		1.5 + x[1] * x[2] - x[1] - x[2];
		-x[1] * x[2] -10
	]
	nonlineq = []

	return [nonlinuneq, nonlineq]
end

options = optimoptions(:fmincon, Algorithm="sqp")

xopt, fval = fmincon(function, x0, A, b, Aeq, beq, lb, ub, nonlincon, options)
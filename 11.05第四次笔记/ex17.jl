using TyOptimization

coeficients = [4000, 3000]
intcon = 1:2

A = [
    2 1;
    1 1;
    0 1
]
b = [
    10,
    8,
    7
]

Aeq = []
beq = []

lb = [0, 0]
ub = [0, Inf]

xopt, fval, _ = intlinprog(-coeficients, intcon, A, b, Aeq, beq, lb, ub)
using TyOptimization

H = [
    1 -1;
    -1 2
]

c = [-2,-6]

A = [
    1 1;
    -1 2

    ]
b = [2, 2]

Aeq = []

beq = []
lb = [0, 0]
ub = []

x, fval = quadprog(H, c, A, b, Aeq, beq, lb, ub)
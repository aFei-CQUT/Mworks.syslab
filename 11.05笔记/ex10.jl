using TyOptimization

coeff = - [6, 7]
A = [
    2 1;
    2 5;
    0 4
]

b = vec([60 100 60])

x, fval, = linprog(coeff, A, b, [], [], [0, 0], [])
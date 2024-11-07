using TyOptimization

f = (x) -> x[1]^2 + 25 * x[2]^2

x, fval = fminsearch(f, [1, 1])

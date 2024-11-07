using TyOptimization

f = (x) -> 2 * exp(-x) * sin(x)

x, _ = fminbnd(f, 0, 8)
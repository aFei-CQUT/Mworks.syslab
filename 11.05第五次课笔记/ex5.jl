using TyOptimization

f = ((x, y); ) -> (1 - x)^2 + 100 * (y - x^2)^2

x, fval = fminsearch(f, [-1.2, 2])
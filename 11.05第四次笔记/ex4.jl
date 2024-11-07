using TyOptimization

f = ((x, y); ) -> sin(1/2 * x^2 - 1/4 * y^2) * cos(2*x + 1 - exp(y))

x, fval, _ = fminunc(f, [1, 1])

using TyOptimization

# # Define the objective function
# f = (v) -> sin(1 / 2 * v[1]^2 - 1 / 4 * v[2]^2) * cos(2 * v[1] + 1 - exp(v[2]))

# # Perform optimization starting from [1, 1]
# x, fval = fminunc(f, [1, 1])

# # Output results
# println("Optimal x: ", x)
# println("Function value at optimal x: ", fval)
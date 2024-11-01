using TyMath

# 定义被积函数
fun(x) = exp(-x .^ 2) .* log(x) .^ 2

q1 = ty_integral(fun, 0, Inf)
println("q1：", q1)

q2 = ty_integral(fun, 0, Inf, rtol = 1e-8, atol = 1e-13)
println("q2：", q2)
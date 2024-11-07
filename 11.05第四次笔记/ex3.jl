using Optim

# 定义实验数据
Re = [4658, 5820, 6525, 7400, 9045, 10350, 11050, 11820, 12850, 13840]
λ = [0.0399, 0.0386, 0.0368, 0.0362, 0.0349, 0.0339, 0.0341, 0.0323, 0.0324, 0.0321]

# 定义目标函数
function objective(params)
    a, b, c = params
    return sum((a * Re[i]^b + c - λ[i])^2 for i in 1:length(Re))
end

# 使用Optim包进行优化
result = optimize(objective, [0.1, -0.2, 0.01], BFGS())

# 获取最优参数
a_opt, b_opt, c_opt = Optim.minimizer(result)

# 输出结果
println("最优参数:")
println("a = ", a_opt)
println("b = ", b_opt)
println("c = ", c_opt)

# 计算拟合误差
sse = Optim.minimum(result)
println("拟合误差 (SSE): ", sse)

# 计算决定系数 R²
λ_mean = mean(λ)
sst = sum((λi - λ_mean)^2 for λi in λ)
r_squared = 1 - sse / sst
println("决定系数 R²: ", r_squared)

# 输出拟合方程
println("拟合方程: λ = ", a_opt, " * Re^", b_opt, " + ", c_opt)

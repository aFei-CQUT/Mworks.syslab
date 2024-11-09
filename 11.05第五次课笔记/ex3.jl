using TyOptimization, TyMath

# 定义实验数据
Re = [4658, 5820, 6525, 7400, 9045, 10350, 11050, 11820, 12850, 13840]
λ = [0.0399, 0.0386, 0.0368, 0.0362, 0.0349, 0.0339, 0.0341, 0.0323, 0.0324, 0.0321]

# 定义目标函数
function objective(params)
    a, b, c = params
    @assert length(Re) == length(λ) "Re 和 λ 的长度必须相同"
    return sum(abs2, @. a * Re^b + c - λ)
end

# 初始参数猜测
x0 = [0.1, -0.2, 0.01]

# 使用 fminunc 进行优化
x_opt, fval, exitflag, output, grad, hessian = fminunc(objective, x0)

# 获取最优参数
a_opt, b_opt, c_opt = x_opt

# 输出结果
println("最优参数:")
println("a = ", a_opt)
println("b = ", b_opt)
println("c = ", c_opt)

# 计算拟合误差 (SSE)
sse = fval
println("拟合误差 (SSE): ", sse)

# 计算决定系数 R²
λ_mean = mean(λ)
sst = sum((λi - λ_mean)^2 for λi in λ)
r_squared = 1 - sse / sst
println("决定系数 R²: ", r_squared)

# 输出拟合方程
println("拟合方程: λ = ", a_opt, " * Re^", b_opt, " + ", c_opt)


# ------------------------------------------------------------------------------------
# # 使用 lsqcurvefit 函数拟合
# # 定义实验数据
# Re = [4658, 5820, 6525, 7400, 9045, 10350, 11050, 11820, 12850, 13840]
# λ = [0.0399, 0.0386, 0.0368, 0.0362, 0.0349, 0.0339, 0.0341, 0.0323, 0.0324, 0.0321]

# # 定义模型函数
# function model(params, x)
#     a, b, c = params
#     return a .* x.^b .+ c
# end

# # 初始参数猜测
# x0 = [0.1, -0.2, 0.01]

# # 使用 lsqcurvefit 进行拟合
# result = lsqcurvefit(model, x0, Re, λ)

# # 获取最优参数
# a_opt, b_opt, c_opt = result[1]  # 最优参数在返回元组的第一个元素中

# # 输出结果
# println("最优参数:")
# println("a = ", a_opt)
# println("b = ", b_opt)
# println("c = ", c_opt)

# # 计算拟合误差 (SSE)
# sse = result[2]  # 残差平方和在返回元组的第二个元素中
# println("拟合误差 (SSE): ", sse)

# # 计算决定系数 R²
# λ_mean = mean(λ)
# sst = sum((λi - λ_mean)^2 for λi in λ)
# r_squared = 1 - sse / sst
# println("决定系数 R²: ", r_squared)

# # 输出拟合方程
# println("拟合方程: λ = ", a_opt, " * Re^", b_opt, " + ", c_opt)
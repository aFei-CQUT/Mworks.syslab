using TyBase
using TyMath

# 线性函数
linear_fun = (params, xdata) -> params[1] .* xdata .+ params[2]

# 二次函数
quadratic_fun = (params, xdata) -> params[1] .* xdata.^2 .+ params[2] .* xdata .+ params[3]

# 指数衰减函数
exp_decay_fun = (params, xdata) -> params[1] .* exp.(-params[2] .* xdata)

# 逻辑增长函数
logistic_fun = (params, xdata) -> params[1] ./ (1 .+ exp.(-params[2] .* (xdata .- params[3])))

# 示例数据
xdata = collect(0:1:10)  # 自变量数据，从0到10，步长为0.1

# 调用线性函数
params_linear = [2, 3]  # 线性函数的参数：斜率和截距
linear_results = linear_fun(params_linear, xdata)
println("线性函数结果: ", linear_results)

# 调用二次函数
params_quadratic = [1, 0.5, 2]  # 二次函数的参数：a、b 和 c
quadratic_results = quadratic_fun(params_quadratic, xdata)
println("二次函数结果: ", quadratic_results)

# 调用指数衰减函数
params_exp_decay = [5, 0.5]  # 指数衰减函数的参数：初始值和衰减率
exp_decay_results = exp_decay_fun(params_exp_decay, xdata)
println("指数衰减结果: ", exp_decay_results)

# 调用逻辑增长函数
params_logistic = [100, 0.1, 5]  # 逻辑增长函数的参数：最大值、增长率和中点
logistic_results = logistic_fun(params_logistic, xdata)
println("逻辑增长结果: ", logistic_results)
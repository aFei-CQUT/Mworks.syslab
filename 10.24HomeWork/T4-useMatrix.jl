# 注意！！！本程序运行报错，仅为记录Bug
# Mworks帮助文档写到：lsqcurvefit函数xdata项可传入数组或矩阵，实际传入矩阵报错

using TyBase
using TyMath
using TyOptimization
using TyPlot
using Printf

# 动力学模型函数
function kinetic_model(params, pA, pB)
    k, KB = params
    return @. (k * pA * pB) / (1 + KB * pB)^2
end

# 实验数据
pA = [8.99, 14.22, 8.86, 8.32, 4.37, 7.75, 7.75, 6.17, 6.13, 6.98, 2.87] .* 1e-3
pB = [3.23, 3.00, 4.08, 2.03, 0.89, 1.74, 1.82, 1.73, 1.73, 1.56, 1.06] .* 1e-3
r = [0.672, 1.072, 0.598, 0.713, 0.610, 0.834, 0.828, 0.656, 0.694, 0.791, 0.418] .* 1e-4

# 参数上下界和初始值
lb = [0.0, 0.0]
ub = [Inf, Inf]
initial_params = [1.0, 1.0]

# 使用优化算法求解
params, resnorm = lsqcurvefit(kinetic_model, initial_params, [pA pB], r, lb, ub)
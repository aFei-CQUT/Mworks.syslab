using TyBase
using TyMath
using TyOptimization
using TyPlot
using Printf

# 动力学模型函数
function kinetic_model(res_opt, p)
    k, KB = res_opt
    n = length(p) ÷ 2
    # 分解 p 为 pA 和 pB
    pA = p[1:n]
    pB = p[n+1:end]
    return @. (k * pA * pB) / (1 + KB * pB)^2
end

# 实验数据
pA = [8.99, 14.22, 8.86, 8.32, 4.37, 7.75, 7.75, 6.17, 6.13, 6.98, 2.87] .* 1e-3  # 转换为 MPa
pB = [3.23, 3.00, 4.08, 2.03, 0.89, 1.74, 1.82, 1.73, 1.73, 1.56, 1.06] .* 1e-3  # 转换为 MPa
r = [0.672, 1.072, 0.598, 0.713, 0.610, 0.834, 0.828, 0.656, 0.694, 0.791, 0.418] .* 1e-4  # 转换为 mol/g.min

# 将 pA 和 pB 合并为一个一维数组
p = vcat(pA, pB)

# 参数上下界
lb = [0.0, 0.0]
ub = [Inf, Inf]

# 网格搜索范围
k_values = range(1.0, stop=1000.0, length=100)
KB_values = range(1.0, stop=2000.0, length=1000)

# 设定R²阈值
threshold_R_squared = 0.95

# 初始化最佳结果
global best_R_squared = -Inf
global best_params = nothing
global best_resnorm = Inf

# 网格搜索
for k_init in k_values
    for KB_init in KB_values
        local initial_params = [k_init, KB_init]
        local res_opt, resnorm = lsqcurvefit(kinetic_model, initial_params, p, r, lb, ub)
        
        # 计算 R²
        local predicted_r = kinetic_model(res_opt, p)
        local ss_res = sum((r - predicted_r).^2)
        local ss_tot = sum((r .- mean(r)).^2)
        local R_squared = 1 - ss_res / ss_tot
        
        # 更新最佳结果
        if R_squared > best_R_squared
            global best_R_squared = R_squared
            global best_params = res_opt
            global best_resnorm = resnorm
        end
        
        # 如果达到阈值，则停止搜索
        if best_R_squared >= threshold_R_squared
            break
        end
    end
    if best_R_squared >= threshold_R_squared
        break
    end
end

# 打印最佳结果
@printf("最佳拟合参数:\n")
@printf("k = %.6f\n", best_params[1])
@printf("KB = %.6f\n", best_params[2])
@printf("最佳 R² = %.6f\n", best_R_squared)
@printf("最佳残差范数: %.6e\n", best_resnorm)

# 预测 r 值
predicted_r = kinetic_model(best_params, p)

# 绘制实验数据和预测点
figure()
scatter(1:length(r), r, label="实验数据", color="red", s=100, marker="o")  # 实验数据点，红色圆圈
hold("on")
scatter(1:length(predicted_r), predicted_r, label="预测数据", color="blue", s=100, marker="x")  # 预测数据点，蓝色叉号
xlabel("数据点索引")
ylabel("反应速率 (mol/g.min)")
title("实验数据与预测数据")
legend()

# 绘制拟合曲面
figure()
pA_range = range(minimum(pA), stop=maximum(pA), length=50)
pB_range = range(minimum(pB), stop=maximum(pB), length=50)
fitted_surface = [kinetic_model(best_params, [pA, pB])[1] for pA in pA_range, pB in pB_range]
surface(pA_range, pB_range, fitted_surface, alpha=0.5, color="blue")
xlabel("pA (MPa)")
ylabel("pB (MPa)")
zlabel("反应速率 (mol/g.min)")
title("拟合曲面")
plt_view(40, 35);

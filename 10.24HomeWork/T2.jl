using TyBase
using TyMath
using TyPlot
using TyCurveFitting
using Printf

t = [1:1:9;]
cA = vec([0.9 0.61 0.42 0.28 0.17 0.12 0.08 0.045 0.03]);

# 待插值查询的点
tq = vec([1.5, 2.4, 3.5, 4.6, 5.5, 6.4, 7.5, 8.7]);

# 两种不同的插值方式
cAq_linear = interp1(t, cA, tq, "linear");
cAq_spline = interp1(t, cA, tq, "spline");

# 输出结果，保留 6 位小数
println("线性插值所得结果:")
for value in cAq_linear
    @printf("%.6f\n", value)
end

println("样条插值所得结果:")
for value in cAq_spline
    @printf("%.6f\n", value)
end

# 另一种格式化输出方式
# println("线性插值所得结果:")
# println(join(map(x -> @sprintf("%.6f", x), caq_linear), "\n"))
# println("样条插值所得结果:")
# println(join(map(x -> @sprintf("%.6f", x), caq_spline), "\n"))

figure()
hold(true) # 确保后续绘制不会覆盖之前的图形
scatter(t, cA, 10, "k", label="原始数据")
scatter(tq, cAq_linear, 20, "b", marker="h", filled=true, label="线性插值")
scatter(tq, cAq_spline, 10, "g", marker="d", filled=true, label="样条插值")

# 添加图例
legend()

# 拟合一阶动力学方程
ln_cA = log.(cA)  # 计算自然对数

# 使用线性回归拟合 ln(cA) = kt + C
lin_fit = fit("poly", t, ln_cA, order=1)
params = lin_fit.params

# 提取 k 和 C
k = params[1]
C = params[2]

# 输出拟合参数
println("拟合参数:")
println("k: ", k)
println("C: ", C)

# 绘制拟合曲线
fit_curve = exp.(k .* t .+ C)  # 恢复到原始形式 cA = e^(kt + C)
plot(t, fit_curve, color="m", label="拟合曲线")
legend()
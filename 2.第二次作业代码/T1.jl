using TyBase, TyMath, Printf

# 气液平衡数据
x = [0.178, 0.275, 0.372, 0.456, 0.650, 0.844]
y = [0.243, 0.382, 0.518, 0.616, 0.795, 0.931]

# 插值获取 x_f 和 x_d 对应的 y 值
y_f = interp1(x, y, 0.4)
y_d = interp1(x, y, 0.9, "linear", "linear")

# 使用 trapz 方法
x_range = range(0.4, stop=0.9, length=1000)
y_values = interp1(x, y, x_range, "linear")
integrand = 1 ./ (y_values .- x_range .- (0.9 .- y_values) ./ 5)
N_trapz = trapz(x_range, integrand)

# 使用 ty_integral 方法
p = polyfit(x, y, 2) # p 是一个元组，其中第一个元素是多项式系数
coefficients = p[1] # 提取多项式系数
integrand_poly(x) = 1 / (polyval(coefficients, x) - x - (0.9 - polyval(coefficients, x)) / 5)
N_ty_integral = ty_integral(integrand_poly, 0.4, 0.9)

# 确保 N_trapz 和 N_ty_integral 是标量
if isa(N_trapz, Matrix) && size(N_trapz) == (1, 1)
    N_trapz = N_trapz[1]
end

if isa(N_ty_integral, Matrix) && size(N_ty_integral) == (1, 1)
    N_ty_integral = N_ty_integral[1]
end

@printf("使用 trapz 方法计算得到的理论板数为： %.2f\n", N_trapz)
@printf("使用 ty_integral 方法计算得到的理论板数为： %.2f\n", N_ty_integral)

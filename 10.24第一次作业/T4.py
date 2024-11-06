import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit

# 设置中文显示
plt.rcParams['font.sans-serif'] = ['SimHei']  # 使用黑体
plt.rcParams['axes.unicode_minus'] = False  # 正常显示负号

# 实验数据
pA = np.array([8.99, 14.22, 8.86, 8.32, 4.37, 7.75, 7.75, 6.17, 6.13, 6.98, 2.87]) * 1e-3  # MPa
pB = np.array([3.23, 3.00, 4.08, 2.03, 0.89, 1.74, 1.82, 1.73, 1.73, 1.56, 1.06]) * 1e-3  # MPa
r = np.array([0.672, 1.072, 0.598, 0.713, 0.610, 0.834, 0.828, 0.656, 0.694, 0.791, 0.418]) * 1e-4  # mol/g·min

# 定义动力学方程
def kinetics(X, k, KB):
    pA, pB = X
    return k * pA * pB / (1 + KB * pB)**2

# 执行曲线拟合
initial_guess = [1.0, 1.0]
params, covariance = curve_fit(kinetics, (pA, pB), r, p0=initial_guess)

# 输出拟合结果
k, KB = params
print(f"拟合参数:\nk = {k:.6e}\nKB = {KB:.6e}")

# 计算拟合后的速率
r_fitted = kinetics((pA, pB), *params)

# 计算R²
SS_tot = np.sum((r - np.mean(r))**2)
SS_res = np.sum((r - r_fitted)**2)
R_squared = 1 - SS_res / SS_tot
print(f"R² = {R_squared:.4f}")

# 绘制散点图
plt.figure(figsize=(8, 6))
plt.scatter(range(1, len(r) + 1), r * 1e4, label="实验数据", marker='o')
plt.scatter(range(1, len(r_fitted) + 1), r_fitted * 1e4, label="拟合数据", marker='s')
plt.xlabel("数据点")
plt.ylabel("反应速率 r (10$^{-4}$ mol/g·min)")
plt.title("乙烯深度氧化反应速率拟合结果")
plt.legend()
plt.grid(True)
plt.show()
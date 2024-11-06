using TyBase
using TyMath
using TyPlot
using Printf # 右侧julia工作区不支持显示30万行以上的矩阵，REPL环境以循环方式输出也要很久

function dysdx(x, y)

    dy1dt = @. 0.04 * (1 - y[1]) - (1 - y[2]) * y[1] + 0.001 * (1 - y[2])^2
    dy2dt = @. -10^4 * dy1dt + 3000 * (1 - y[2])^2

    return [dy1dt dy2dt]

end

x, y = ode45(dysdx, [0 100], [0 1])

# 绘图
plot(x, y[:,1], "b", x, y[:,2], "r")
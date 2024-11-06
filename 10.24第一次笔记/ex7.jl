using TyOptimization

t = [3:3:24;]
y = [57.6, 41.9, 31, 22.7, 16.6, 12.2, 8.9, 6.5]
x0 = [10, -1] # 初始估计值
fun = (x, xdata) -> x[1] .* exp.(x[2] .* xdata)
x, resnorm, residual, exitflag,output, lambda, jacobian = lsqcurvefit(fun,x0,t,y)
x
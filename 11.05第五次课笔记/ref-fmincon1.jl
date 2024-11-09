using TyOptimization

# 这里好像必须要求是单个参数（vector），通过匿名函数的形式解包为两个
fun = x ->100*(x[2]-x[1]^2)^2 + (1-x[1])^2
x0 = [-1,2]

A = [1 2]
b = [1]

x, = fmincon(fun,x0,A,b)

using TyBase
using TyMath
using TyPlot
using Printf

# ode默认操作对象为数组形式，当存在幂数不为1的幂运算运时应改为元素逐步运算 .* ./ .^
# 可用语法糖 @. 或称为 宏 @.
dydt = (t, y) -> @. y + y^2

# function dydt(t, y)
#
#     return @. y + y^2
#
# end

# function dydt(x,y)                            
#
#     fval = @. y + y^2
#
#     return fval
#
# end 

# 使用 ode45 求解
x, y = ode45(dydt, [0, 1], 1)

# 打印结果
@printf("x = %s\n", x)
println()
@printf("y = %s\n", y)

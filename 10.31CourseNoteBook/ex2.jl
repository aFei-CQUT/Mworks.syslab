using TyOptimization

# function ammonial(x)
#     f1 = (x[1] - x[2]) * (3 * x[1] + x[2])^3 / ((1 - x[1]) * (5 - x[1] - x[2]) * (6 + 2 * x[1])^2) - 0.9618
#     f2 = x[2] * (3 * x[1] + x[2]) / ((x[1] - x[2]) * (5 - x[1] - x[2])) - 2.7
#     return [f1, f2]
# end

# 匿名函数的形式1
# ammonial = x -> begin
#     f1 = (x[1] - x[2]) * (3 * x[1] + x[2])^3 / ((1 - x[1]) * (5 - x[1] - x[2]) * (6 + 2 * x[1])^2) - 0.9618
#     f2 = x[2] * (3 * x[1] + x[2]) / ((x[1] - x[2]) * (5 - x[1] - x[2])) - 2.7
#     return [f1, f2]
# end

# 匿名函数的形式2
# ammonial = x -> [
#     (x[1] - x[2]) * (3 * x[1] + x[2])^3 / ((1 - x[1]) * (5 - x[1] - x[2]) * (6 + 2 * x[1])^2) - 0.9618,
#      x[2] * (3 * x[1] + x[2]) / ((x[1] - x[2]) * (5 - x[1] - x[2])) - 2.7
# ]

# 匿名函数的形式3
# 以下从函数定义的角度没有问题，但是fsolve要求一维数组（向量）形式
# ammonial = (x, y) -> [
#     (x - y) * (3x + y)^3 / ((1 - x) * (5 - x - y) * (6 + 2x)^2) - 0.9618,
#     y * (3x + y) / ((x - y) * (5 - x - y)) - 2.7
# ]

# 匿名函数的形式4
# let可实现上述接口功能，同时保证容易理解
# ammonial = v -> let x = v[1], y = v[2]
#     [
#         (x - y) * (3x + y)^3 / ((1 - x) * (5 - x - y) * (6 + 2x)^2) - 0.9618,
#         y * (3x + y) / ((x - y) * (5 - x - y)) - 2.7
#     ]
# end

# 匿名函数的形式5
# ammonial = v -> begin
#     x, y = v  # 解构向量
#     [
#         (x - y) * (3x + y)^3 / ((1 - x) * (5 - x - y) * (6 + 2x)^2) - 0.9618,
#         y * (3x + y) / ((x - y) * (5 - x - y)) - 2.7
#     ]
# end

# 匿名函数的形式6
# 可以使用((x, y),) 或 ((x, y);)代替解构或者说用逗号和分号实现隐式解构，省略了形式5中定义v的形式
# 注： 
#     1.只能用圆括号()解构，而不能用方括号[]解构
#       为区分参数解构和创建向量，参数解构用到元组圆括号，创建数组用到向量方括号
#     2.推荐使用分号，这符合julia的编程风格，可表语句结束或执行解构
ammonial = ((x, y);) -> [
    (x - y) * (3x + y)^3 / ((1 - x) * (5 - x - y) * (6 + 2x)^2) - 0.9618,
    y * (3x + y) / ((x - y) * (5 - x - y)) - 2.7
]

# 使用fsolve求解
initial_guess = [0.8, 0.6]
result = fsolve(ammonial, initial_guess)

# 输出结果
println("解: ", result)
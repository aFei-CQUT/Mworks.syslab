using TyBase, TyOptimization

p = 1.013e6
R = 8.314e6
T = 473.15
B = -388
C = -26000

# function willy(V)
#     global p, R, T, B, C
#     willyval = p * V / (R * T) - B / V - C / (V^2) - 1
#
#     return willyval
# end

# 另一种定义方式
# willy = V -> p * V /(R * T) - B /V - C / (V^2) - 1

# 还有另一种定义方式
willy = V-> begin
    p * V /(R * T) - B /V - C / (V^2) - 1
end



V0 = R * T / p
V = fzero(willy, V0)
using TyControlSystems: zpk

# 零点
z = [-3]

# 极点
p = [0 -1 -2]

# 增益向量
k = 2

sys = zpk(z, p, k)
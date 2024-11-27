# import TyControlSystems as TCS

# numerator = [2 3]
# denominator = [4 3 2 1]

# sys = TCS.tf(numerator, denominator)

using TyControlSystems: tf

# 分子
numerator = [2 3]

# 分母
denominator = [4 3 2 1]

sys = tf(numerator, denominator)
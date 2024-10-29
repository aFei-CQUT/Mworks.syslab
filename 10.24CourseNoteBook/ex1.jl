using TyBase
using TyMath

x = [20, 30]
y = [1.004, 0.8012]
xi = 25
yi = interp1(x, y, xi, "linear")
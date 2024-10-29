using TyBase
using TyMath

x = [0:pi/100:pi;]
y = sin.(x)

integral_t = trapz(x, y)
integral_s = sum(y[1:length(y)-1] * pi/100)
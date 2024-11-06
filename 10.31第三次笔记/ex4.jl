using TyBase
using TyMath
using TyPlot
using Printf

function dydx(x, y)
    funval = 2 * x

    return funval
    
end

x, y = ode45(dydx, [0, 5], 0)
figure()
plot(x, y, marker="o")
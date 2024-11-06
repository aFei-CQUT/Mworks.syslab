using TyBase
using TyMath
using Printf
using TyPlot

# odefun = (x, y) -> y - 2*x / y

# function odefun(x,y)
#
#     return y - 2*x / y
#
# end

function odefun(x,y)

    dydx = y - 2*x / y

    return dydx
end

x, y = ode45(odefun, [0, 1], 1)

figure()
plot(x, y, "-o")
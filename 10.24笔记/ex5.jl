using TyBase
using TyMath

t = [3:3:24;];
y = [57.6, 41.9, 31, 22.7, 16.6, 12.2, 8.9, 6.5];
p1, S1 = polyfit(t, y, 1)
p2, S2 = polyfit(t, y, 2)
y1 = polyval(p1, t)
y2 = polyval(p2, t)

println("Linear Fit Results (y1): ", y1)
println("Quadratic Fit Results (y2): ", y2)
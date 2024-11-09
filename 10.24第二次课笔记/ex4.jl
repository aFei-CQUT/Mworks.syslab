using TyBase
using TyMath
using TyCurveFitting
using TyPlot

t = [3:3:24;]
y = [57.6, 41.9, 31, 22.7, 16.6, 12.2, 8.9, 6.5]

fit1 = fit("poly1", t, y)
p1 = fit1.params
y1 = polyval(p1, t)

fit2 = fit("poly2", t, y)
p2 = fit2.params
y2 = polyval(p2, t)

figure()
hold("on")
scatter(t,y)
plot(t,y)
plotfit(fit1, "y:")
plotfit(fit2,"m-.")
xlabel("t")
ylabel("y")
legend("data","1st-order","2nd-order")
hold("off" )

figure()
plot(t,y,"r*",t,y1,"bo",t,y2,"k+")
xlabel("t")
ylabel("y")
legend("data","1st-order","2nd-order")
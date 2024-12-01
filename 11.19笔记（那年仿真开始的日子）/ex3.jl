using TyControlSystems: tf, zpk, step
using TyPlot

num = [2, 1]
den = [1, 3, 2]
sys1 = tf(num, den)

figure()
step1 = step(sys1)

z = [1]
p = [-2 -3]
k = 1
sys2 = zpk(z, p, k)

figure()
step2 = step(sys2)

figure()
step_combined = step(sys1, sys2);
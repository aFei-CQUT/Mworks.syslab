using TyControlSystems: tf, zpk, step
using TyPlot: figure, plot, xlabel, ylabel, legend, title, hold

num = [2 1]
den = [1 3 2]
sys1 = tf(num, den)
sys2 = zpk(1, [-2 -3], 1)
y1, t1, = step(sys1, 10, fig=false)
y2, t2, = step(sys2, 10, fig=false)

#plot the response
figure()
plot(t1, y1, "r", t2, y2, "b") # plot(t1, y1, 'r', t2, y2, "b") # 试试看单引号会报什么错
xlabel("time")
ylabel("y")
title("unit step response")
legend("sys1", "sys2")

figure()
hold("on") # 效果等同于 hold(true)，需要注意前者传入参数是字符串后者是布尔类型的 true 或者 false
# 试试看去掉 hold("on") 会发生什么
plot(t1, y1, "r")
plot(t2, y2, "b")

xlabel("time")
ylabel("y")
title("unit step response")
legend("sys1", "sys2");
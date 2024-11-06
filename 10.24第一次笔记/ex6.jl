using TyBase
using TyCurveFitting

t = [3:3:24;]
y = [57.6, 41.9, 31, 22.7, 16.6, 12.2, 8.9, 6.5]

fitexp = fit("exp1", t, y)
params = fitexp.params

plotfit(fitexp, t, y)
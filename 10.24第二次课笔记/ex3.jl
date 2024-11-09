using TyBase
using TyMath
using TyPlot

Tr = [1.1, 1.15];
Pr = [1.5, 2.00];
w = 0.25;
Z0 = [0.458 0.3953; 0.5798 0.476];
Z1 = [0.163 0.0698; 0.1548 0.1667];

Tri = 1.106;
Pri = 1.7476;
Z0i = interp2(Tr, Pr, Z0, Tri, Pri)
Z1i = interp2(Tr, Pr, Z1, Tri, Pri)

Z = Z0i + w * Z1i
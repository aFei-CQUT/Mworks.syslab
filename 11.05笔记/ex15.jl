using TyOptimization
options = optimset(Display="final")

C = [0.0372    0.2869
     0.6861    0.7071
     0.6233    0.6245
     0.6344    0.6170]
d = [0.8587
     0.1781
     0.0747
     0.8405]

x, = lsqnonnegm(C,d,options)

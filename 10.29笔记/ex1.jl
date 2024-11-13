using TyBase
using TyMath

t = [0:20:200;]
c = vec([0 0 0 0 0.4 5.5 16.2 11.1 1.7 0.1 0])
ct = c .* t

integral_d = trapz(t, c)
integral_n = trapz(t, ct)

integral = integral_n / integral_d

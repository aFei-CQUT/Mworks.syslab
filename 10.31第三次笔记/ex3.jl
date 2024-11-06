using TyBase
using TyMath
using TyOptimization
using Printf

# nonlinears = ((x, y, z); ) -> begin
#
# 	f1 = sin(x) + y^2 + log(z) - 7
# 	f2 = 3 * x + 2^y - z^3 + 1
# 	f3 = x + y + z - 5
#	
# 	return [f1, f2, f3]
#
# end


# function nonlinears(v)
#
#   x, y, z = v[1], v[2], v[3]
#
# 	f1 = sin(x) + y^2 + log(z) - 7
# 	f2 = 3 * x + 2^y - z^3 + 1
# 	f3 = x + y + z - 5
#
# 	return [f1, f2, f3]
#
# end


function nonlinears(v)

    let 

        x = v[1]
        y = v[2] 
        z = v[3]

        f1 = sin(x) + y^2 + log(z) - 7
        f2 = 3 * x + 2^y - z^3 + 1
        f3 = x + y + z - 5

	    return [f1, f2, f3]

    end

end

initial_guess = [1, 1, 1]
result, _ = fsolve(nonlinears, initial_guess)
print("这个方程组的解为", result)
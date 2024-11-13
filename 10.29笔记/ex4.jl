A=[6 -1 -3; 2 -5 2; 2 4 4]
b=[10;-3;20]

# AX = b
X = A \ b
println(X)

X = inv(A) * b
println(X)
using TyOptimization

function volume(x)
    # 水槽体积函数
    v = (3 - 2*x) * x

    return -v
end

x, fval, _ = fminbnd(volume, 0, 1.5)
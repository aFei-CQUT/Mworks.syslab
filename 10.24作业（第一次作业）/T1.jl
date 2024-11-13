using TyBase
using TyMath
using TyPlot

# 定义计算费用的函数
function calculate_prices(n)
    if n == 1
        return 150.0
    elseif n == 2
        return 150.0 + 120.0
    elseif n >= 3
        return 150.0 + 120.0 + (n-2) * 110.0
    end
end

# 创建数量和对应价格的数组
n = [1:1:10;];
prices = Float64[];

# 循环计算购买1到10台的价格并将结果放到prices中
for i in n
    push!(prices, calculate_prices(i))
end

# 输出结果
prices_10 = prices[10];
print("购买 10 台设备的总价格为: ", prices_10, "\$")

# 绘制条形统计图
figure(figsize=(10, 6))  # 设置图形大小
bar(n, prices, color=:skyblue, edgecolor=:black, linewidth=1.5)

# 添加标签和标题
xlabel("设备数量/个", fontsize=14)
ylabel("所需价格/\$", fontsize=14)
title("购买设备的总价格", fontsize=16, fontweight="bold")
grid(true)  # 添加网格
xticks(n);  # 设置 x 轴刻度
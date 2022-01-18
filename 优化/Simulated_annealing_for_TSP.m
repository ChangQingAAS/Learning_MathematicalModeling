% 模拟退火法解旅行商问题，地址坐标为2维
% data ：第一个和最后一个节点为出发点即最终点，其他节点为要求经过的节点

data = [
    70.0000 40.0000; 53.7121 15.3046; 52.5211 15.795;
    40.1400 20.3030; 36.9980 24.3992; 4.1591 3.1853;
    51.1758 0.0322; 46.3253 28.2753; 23.9876 9.4030;
    36.9545 23.0265; 15.7320 19.5697; 70 40
    ];
[data_number, data_dimension] = size(data)
distance = zeros(data_number); % 距离矩阵d,用的是欧氏距离

for i = 1:data_number - 1

    for j = i + 1:data_number
        % diatance^2  = (x1 -x2) * (x1 -x2) + (y1-y2) * (y1-y2)
        diatance(i, j) = sqrt((data(i, 1) - data(j, 1))^2 + (data(i, 2) - data(j, 2))^2)
    end

end

distance = distance + distance';
S0 = [];
Sum = inf;
rand('state', sum(clock));

% 从100个随机解中选出一个最好解
for j = 1:100
    S = [1 1 + randperm(data_number - 2), data_number] % 随机产生一个解
    temp = 0

    for i = 1:data_number - 1
        temp = temp + diatance(S(i), S(i + 1));
    end

    if temp < Sum
        S0 = S;
        Sum = temp;
    end

end

e = 0.1^2;
L = 20000
at = 0.9
T = 1

% 退火过程
while T > e
    % 产生新解
    for Lk = 1:10 %等温搜索10次
        c = 2 + floor((data_number - 2) * rand(1, 2))
        c = sort(c)
        c1 = c(1)
        c2 = c(2) % 选c1 c2位置的城市交换
        % 计算代价函数值
        df = diatance(S0(c1 - 1), S0(c2)) + distance(S0(c1), S0(c2 + 1)) - distance(S0(c1 - 1), S0(c1)) - distance(S0(c2), S0(c2 + 1))
        % 接受准则
        if df < 0
            S0 = [S0(1:c1 - 1), S0(c2:-1:c1), S0(c2 + 1:data_number)];
            Sum = Sum + df
        elseif exp(-df / T) > rand(1)
            S0 = [S0(1:c1 -1), S0(c2:-1:c1), S0(c2 + 1:data_number)];
            Sum = Sum + df;
        end

    end

    T = T * at
end

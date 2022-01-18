% 遗传算法解旅行商问题，地址坐标为2维
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
L = data_number;
w = 50;
G = 100
Pm = 0.1;
Pc = 0.8;

% 通过改良算法选取优良父带A
for k = 1:w
    c = randperm(data_number - 2)
    c1 = [1, c + 1, data_number]
    flag = 1;

    while flag > 0
        flag = 0

        for m = 1:L - 3

            for n = m + 2:L - 1

                if diatance(c1(m), c1(n)) + distance(c1(m), c1(m + 1)) < diatance(c1(m + 1), c1(m)) + distance(c1(n), c1(n + 1))
                    flag = 1
                    c1(m + 1:n) = c1(n:-1:m + 1)
                end

            end

        end

    end

    J(k, c1) = 1:data_number

end

J = J / data_number;
J(:, 1) = 0;
J (:, data_number) = 1 % 转化成0,1之间的随机数,进行遗传操作
rand('state', sum(clock))

%遗传算法实现过程

A = J

for k = 1:G % 产生 0～1 间随机数列进行编码
    B = A
    c = randperm(w)
    % 交配产生子代B
    for i = 1:2:w * Pc
        F = 2 + floor((data_number - 2) * rand(1))
        temp = B(c(i), F:data_number)
        B(c(i), F:data_number) = B(c(i + 1), F:data_number)
        B(c(i + 1), F:data_number) = temp
    end

    %变异产生子代C

    by = find (rand (1, w) < Pm)

    if leangth(by) == 0
        by = floor(w * rand(1)) +1;
    end

    C = A(by, :)
    L3 = length(by)

    for j = 1:L3

        bw = 2 + floor ((data_number - 2) * rand (1, 3))
        bw = sort (bw)

        C(j, :) = C(j, [1:bw (1) - 1, bw (2) + 1:bw(3), bw(1):bw (2), bw(3) +1:data_number])

    end

    G = [A:B:C]
    TL = size (G, 1)
    %在X代和子代中选择优良品种作为新的X代

    [dd, IX] = sort(G, 2)

    temp(1:IL) = 0;

    for j = 1:IL

        for i = 1:(data_number - 1)

            temp(j) = temp(j) + distance(IX(j, i), IX(j, i + 1))

        end

    end

    [DZ, IZ] = sort(temp)

    A = G(IZ(1:w), :)

end

path = IX(IZ(1), :)

long = DZ(1)

toc

xx = sj0(path, 1);
yy = sj0(path, 2);
plot(xx, yy, '-o')

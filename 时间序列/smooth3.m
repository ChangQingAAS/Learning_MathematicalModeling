% 三次指数平滑
function [Y, S1, S2, S3, a, b, c] = expsmooth3(Yt, alpha, t)
    %Yt:原时间序列；alpha:平滑系数；t:预测时长
    Yt = [1, 4, 5, 27, 34, 38, 36, 45, 46, 48, 49]; %Yt:原时间序列；
    alpha = 0.1 %alpha:平滑系数；
    t = 2 %t:预测时长
    %Y:预测值；S1/S2/S3:一次/二次/三次指数平滑值；a/b/c:预测公式参数
    n = length(Yt);
    %计算一次指数平滑值
    S1(1) = Yt(1);

    for i = 2:n
        S1(i) = alpha * Yt(i) + (1 - alpha) * S1(i - 1);
    end

    %计算二次指数平滑值
    S2(1) = S1(1);

    for i = 2:n
        S2(i) = alpha * S1(i) + (1 - alpha) * S2(i - 1);
    end

    %计算三次指数平滑值
    S3(1) = S2(1);

    for i = 2:n
        S3(i) = alpha * S2(i) + (1 - alpha) * S3(i - 1);
    end

    %计算参数a、b、c
    for i = 1:n
        a(i) = 3 * S1(i) - 3 * S2(i) + S3(i);
        b(i) = alpha / (1 - alpha)^2/2 * ((6 - 5 * alpha) * S1(i) - 2 * (5 - 4 * alpha) * S2(i) + (4 - 3 * alpha) * S3(i));
        c(i) = alpha / (1 - alpha)^2/2 * (S1(i) - 2 * S2(i) + S3(i));
    end

    %计算预测值Y
    for i = 1:t
        Y(i) = a(n) + b(n) * i + c(n) * i^2;
    end

    %绘图
    plot(1:n, Yt, (n + 1):(n + t), Y, '*');
end

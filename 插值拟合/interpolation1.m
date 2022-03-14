% 一维插值
% （1）输入已知数据，x,y
% （2）输入待插自变量的值x1

x0 = 1:10; %  插值点
y0 = [5 5 3 15 9 4 8 9 5 2]; % 插值点
x = 1:0.1:10; % 插值函数的自变量
y = interp1(x0, y0, x, 'spline'); % 插值方法有： linear, spline,cubic

plot(x0, y0, '+', x, y, 'red') %作图

xlabel('x'), ylabel('y')

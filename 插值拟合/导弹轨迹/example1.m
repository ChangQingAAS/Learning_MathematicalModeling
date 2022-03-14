syms x y %  用符号定义函数
syms z positive % 定义符号正变量

a = load('daodan.txt')
d = a(:, [2:end]) %取距离数据矩阵，因为a的第一列是时间节点
n = size(a, 1);
sol = [];

for i = 1:n
    eq1 = x^2 + y^2 + z^2 - d(i, 1)^2
    eq2 = x^2 + (y - 4500)^2 + z^2 - d(i, 2)^2
    eq3 = (x + 2014)^2 + (y - 2996)^2 + z^2 - d(i, 3)^2
    [xx, yy, zz] = solve(eq1, eq2, eq3) % 解方程组，解是符号型的
    sol = [sol; double([xx, yy, zz])]; % 将解转化为数值型的，且存入矩阵
    disp(sol)
end

% % 求最后一个区间的表达式
% pp1 = csape(a(:, 1), sol(:, 1));
% xishu1 = pp1.coefs(end, :);
% pp2 = csape(a(:, 1), sol(:, 2));
% xishu2 = pp2.coefs(end, :);
% pp3 = csape(a(:, 1), sol(:, 3)); % 求z(t)的三次样条插值函数
% xishu3 = pp3.coefs(end, :); % 显示最后一个区间上z(t)的系数

% % 有错

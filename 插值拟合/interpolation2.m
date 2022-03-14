% 二维插值步骤
% （1）先输入二维数据的x, y坐标值
% （2）输入Z数据
% （3）输入待插点的x, y坐标
% （4）应用函数插值即可

x0 = 1:5;
y0 = 1:3;

z0 = [82 81 80 82 84; 79 63 61 65 81; 84 84 82 85 86];

mesh(x0, y0, z0);

xi = 1:0.01:5;
yi = 1:0.01:3;
zi = interp2(x0, y0, z0, xi', yi, 'cubic');

mesh(xi, yi, zi);

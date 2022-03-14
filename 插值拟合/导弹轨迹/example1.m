syms x y %  �÷��Ŷ��庯��
syms z positive % �������������

a = load('daodan.txt')
d = a(:, [2:end]) %ȡ�������ݾ�����Ϊa�ĵ�һ����ʱ��ڵ�
n = size(a, 1);
sol = [];

for i = 1:n
    eq1 = x^2 + y^2 + z^2 - d(i, 1)^2
    eq2 = x^2 + (y - 4500)^2 + z^2 - d(i, 2)^2
    eq3 = (x + 2014)^2 + (y - 2996)^2 + z^2 - d(i, 3)^2
    [xx, yy, zz] = solve(eq1, eq2, eq3) % �ⷽ���飬���Ƿ����͵�
    sol = [sol; double([xx, yy, zz])]; % ����ת��Ϊ��ֵ�͵ģ��Ҵ������
    disp(sol)
end

% % �����һ������ı��ʽ
% pp1 = csape(a(:, 1), sol(:, 1));
% xishu1 = pp1.coefs(end, :);
% pp2 = csape(a(:, 1), sol(:, 2));
% xishu2 = pp2.coefs(end, :);
% pp3 = csape(a(:, 1), sol(:, 3)); % ��z(t)������������ֵ����
% xishu3 = pp3.coefs(end, :); % ��ʾ���һ��������z(t)��ϵ��

% % �д�

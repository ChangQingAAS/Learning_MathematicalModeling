%  �������̲���
% ��1��Ѱ�ҶԽ������Ӱ��ĸ���ָ�꣬������m��
% ��2��Ѱ������n�����������m*n�����Ӧ�ı�׼�����n*1
%  (3)������m*n��n*1�ֱ����������ѵ�������������д����е�P��T
% ��4�������µ����ݽ��з��棬���������д����е�P2��

clear;
clc;
P = [1, 2, 4; 5, 8, 3; 8, 7, 2]';
T = [5; 4; 6]';
%����minmax����������������Χ
net = newff(minmax(P), [7, 1], {'tansig', 'purelin'}, 'trainlm');
net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-5;
[net, tr] = train(net, P, T);
net.iw{1, 1} %����Ȩֵ
net.b{1} %������ֵ
net.lw{2, 1} %�����Ȩֵ
net.b{2} %�������ֵ
y3 = sim(net, P);

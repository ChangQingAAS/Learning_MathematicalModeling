%  神经网络编程步骤
% （1）寻找对结果产生影响的各种指标，假设有m个
% （2）寻找样本n个，构造矩阵m*n，其对应的标准输出是n*1
%  (3)将上述m*n与n*1分别带入网络中训练，类似于下列代码中的P与T
% （4）输入新的数据进行仿真，类似于下列代码中的P2；

clear;
clc;
P = [1, 2, 4; 5, 8, 3; 8, 7, 2]';
T = [5; 4; 6]';
%利用minmax函数求输入样本范围
net = newff(minmax(P), [7, 1], {'tansig', 'purelin'}, 'trainlm');
net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-5;
[net, tr] = train(net, P, T);
net.iw{1, 1} %隐层权值
net.b{1} %隐层阈值
net.lw{2, 1} %输出层权值
net.b{2} %输出层阈值
y3 = sim(net, P);

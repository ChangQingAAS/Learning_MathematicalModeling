p = [1, 2, 4; 5, 8, 3; 8, 7, 2]';
t = [5; 4; 6]';

[P, ps] = mapminmax(p);
[T, ts] = mapminmax(t);
net = newff(minmax(p), [10, 1], {'tansig', 'logsig'})
net.trainParam.show = 50;
net.trainParam.lr = 0.01;
net.trainParam.goal = 1e-10;
net.trainParam.epochs = 20000;
net = train(net, P, T);
yn = sim(net, P)
y = mapminmax.reverse(yn, ts)

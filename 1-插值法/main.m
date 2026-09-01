X=[1 5 10 30 45 50 60];
Y=[15.8 16.8 16.2 15.6 15  14.7 14.3];
t=35;
%% 调用牛顿插值函数进行拟合
[N,r1]=newton(X,Y,t); % N为多项式的系数，r1为x=t的误差

%% 绘制拟合图像
x=X(1):0.1:X(end-1);
y=polyval(N,x); % 计算多项式的值
plot(x,y,'linewidth',2)
hold on
plot(X,Y,'o')
clc
clear
syms x
h=x^3-x-1;
h1=exp(3*x)-1-3*x-4.5*x^2;
x0 = 0.5;
% solve(h,x)
[x,k,lter_value1]=newton_eq(h,0.5,100)
[x,k,lter_value2]=newton_eq1(h,0.5,100)
[x,k,lter_value3]=newton_eq(h1,0.5,100)
[x,k,lter_value4]=newton_eq1(h1,0.5,100)


%% 绘制迭代曲线图

subplot(1,2,1)
hold on
lter_num=1:1:size(lter_value1');
plot(lter_num,lter_value1,'linewidth',2)
lter_num=1:1:size(lter_value2');
plot(lter_num,lter_value2,'linewidth',2)
legend(["方程组1-牛顿法","方程组1-牛顿变步长法"]);

hold off

subplot(1,2,2)
hold on
lter_num=1:1:size(lter_value3');
plot(lter_num,lter_value3,'linewidth',2)
lter_num=1:1:size(lter_value4');
plot(lter_num,lter_value4,'linewidth',2,'LineStyle','-.')
hold off
legend(["方程组2-牛顿法","方程组2-牛顿变步长法"]);


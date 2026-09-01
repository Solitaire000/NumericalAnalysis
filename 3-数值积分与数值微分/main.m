clc
clear

a = 0;
b = 4;
e = 1e-6;
syms x;
f = exp(x^2-x+1);
lter_value = Romberg_Iteration(f,a,b,e);

%% 绘制迭代曲线图
lter_num=1:1:size(lter_value');
plot(lter_num,lter_value,'linewidth',2)


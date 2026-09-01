clc
clear
% 幂法计算主特征值与主特征向量和主函数，并记录迭代次数
A1=[7 3 -2;3 4 -1;-2 -1 3];
A2=[6 2 1;2 3 1;1 1 1];
x0=[1 1 1]';

n=200;%最大迭代次数
p=0;
tol=1e-8;

%% 求解
[tzz,x1,number,lter_value1]=mifa(A1,1e-8,x0,n)
[tzz,x1,number,lter_value2]=fanmifa(A1,tol,x0,n)
[tzz,x1,number,]=fanpingyi(A1,p,tol,x0,n)



subplot(1,2,1)
hold on
lter_num=1:1:size(lter_value1');
plot(lter_num,lter_value1,'linewidth',2)
legend(["幂法迭代"]);

subplot(1,2,2)
lter_num=1:1:size(lter_value2');
plot(lter_num,lter_value2,'linewidth',2)
legend(["反幂法迭代"]);
hold off
% fprintf('主特征值为')
% tzz
% disp('主要特征向量为')
% x1
% disp('迭代次数为')
% number
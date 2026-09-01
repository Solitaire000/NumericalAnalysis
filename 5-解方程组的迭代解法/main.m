clc
clear
A1=[10 -1 2 0;-1 11 -1 3;2 -1 10 -1;0 3 -1 8];
A2=[1 2 -2;1 1 1;2 2 1];
b1=[11 12 10 10]';
b2=[1 1 1]';
x01=[0 0 0 0]';
x02=[0 0 0]';
n=100;  % 迭代次数
o=1e-5; % 向量范数

%% 求解
[result,k]=jacobi(A1,b1,x01,n,o)
[result,k]=gauss_seidel(A1,b1,x01,n,o)

[result,k]=jacobi(A2,b2,x02,n,o)
[result,k]=gauss_seidel(A2,b2,x02,n,o)



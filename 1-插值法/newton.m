function [N,r1]=newton(X,Y,t)

%% 计算各阶差商
m=length(X);
c=cha(X,Y);

syms x % 定义一个自变量
for i=1:m-1
    D1=x-X(1:i); % 计算wn(x) 
    D(i)=prod(D1); % 数组元素的乘积
end
%% 最后一个置为空，不参与拟合计算，计算误差
p=c(end);
c(end)=[];
q=D(end);
D(end)=[];
% D(end-1)=[];

%% 计算拟合多项式和误差
Nd=expand(sum(D.*c)+Y(1)); % 计算求 N(x)
N=sym2poly(Nd);         % 提取多项式系数
% Ndd=matlabFunction(Nd);
% w1=Ndd(X(end));
qq=matlabFunction(q); % 将q转换为matlab可调用函数
w=qq(t);
r1=abs(p*w); % 计算误差
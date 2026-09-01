function [lameda,x1,number,lter_value]=fanmifa(A,tol,x0,n)
%tzz主特征值
%x1主特征向量
%time迭代次数
%A要计算的矩阵
%tol 误差容限 
lter_value = [];
if nargin==1
  tol=1e-7;%如果tol缺省 默认为10的-7次方
  temp=length(A);  %x0的向量长度
  x0=ones(temp,1);  %如果缺省迭代初值 向量取1
  n=100;
end

if nargin==2 
    temp=length(A);  %x0的向量长度
    x0=ones(temp,1);  %如果缺省迭代初值 向量取1
     n=100;
end
if nargin==3 
    n=100;
end
%初值
m1=0;
u=x0;
number=0;
%循环迭代
while number<n        % 设置最大迭代次数为500次
 v=inv(A)*u;          % 未规范化的迭代向量v
 [~,i]=max(abs(v));   % 找到v最大值所在行i
 m=v(i);              % 迭代的最小特征值m
 lter_value(end+1) = m;
 u=v/m;               % 规范化的迭代向量u
   if abs(m-m1)<tol %如果满足误差要求  则跳出循环迭代
    break;
   end
 m1=m;
number=number+1;
end
lameda=1/m;           % 反幂法，取倒数
x1=u;    
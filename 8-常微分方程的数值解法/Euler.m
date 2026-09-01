function[x,y]=Euler(fun,a,b,y0,n)
if nargin<5 % 若缺省变量，则令迭代次数为50
    n=50;
end

h=(b-a)/n;
x(1)=a;y(1)=y0;   % 设置初始值
for i=1:n
    x(i+1)=x(i)+h;                           % x 按照步长迭代
    y(i+1)=y(i)+h*feval(fun,x(i),y(i));      % y 按照欧拉公式迭代
end
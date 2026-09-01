function[x,y]=GJEuler(fun,x0,xfinal,y0,n)
if nargin<5 % 若缺省变量，则令迭代次数为50
    n=50;
end
h=(xfinal-x0)/n;
x(1)=x0;y(1)=y0;
for i=1:n
    x(i+1)=x(i)+h;
    y1=y(i)+h*feval(fun,x(i),y(i)); % 计算函数值
    y2=y(i)+h*feval(fun,x(i+1),y1); % 计算函数值
    y(i+1)=(y1+y2)/2;
end
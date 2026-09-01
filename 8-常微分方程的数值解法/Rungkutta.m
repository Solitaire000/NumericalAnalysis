function[x,y]=Rungkutta(fun,x0,xfinal,y0,n)
if nargin<5 % 若缺省变量，则令迭代次数为50
    n=50;
end
h=(xfinal-x0)/n;
x(1)=x0;y(1)=y0;
for i=1:n
    x(i+1)=x(i)+h;
    K1=feval(fun,x(i),y(i));
    K2=feval(fun,x(i)+h/2,y(i)+h*K1/2);
    K3=feval(fun,x(i)+h/2,y(i)+h*K2/2);
    K4=feval(fun,x(i)+h,y(i)+h*K3);
    y(i+1)=y(i)+h*(K1+2*K2+2*K3+K4)/6;
end
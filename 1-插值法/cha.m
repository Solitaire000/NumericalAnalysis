function C=cha(X,Y)
% C 存储各阶第一个差商值
% X 是横坐标

m=length(X);
d=diff(Y)./diff(X); % 计算1阶差商
C(1)=d(1);

for i=2:m-1
    X1=X(i+1:end);
    n=length(X1);
    X2=X(1:n);
    d=diff(d)./(X1-X2); % 计算后续阶差商
    C(i)=d(1);     % 存储各阶第一个差商值
end

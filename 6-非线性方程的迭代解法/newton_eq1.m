function [result,k,lter_value]=newton_eq1(h,x,n)
f=matlabFunction(h);
f1=matlabFunction(diff(h)); %  计算倒数
X(1)=x;
i=2;
lamda=1;

lter_value = [];
while 1
    X(i)=X(i-1)-lamda*f(X(i-1))/f1(X(i-1));  % 迭代公式
    lter_value(end+1) = X(i);
    %if abs(f(X(i)))<1e-6
    if abs(X(i)-X(i-1))<1e-6
        result=X(i);
        disp('满足精度要求')
        k=i-1;
        return;
    end

    % 根据计算结果修改步长
    if abs(f(X(i)))<abs(f(X(i-1)))
        lamda=1;
    else
        lamda=lamda/2;
        i=i-1;
    end
    if i>n
        result=X(i);
        disp('超过最大迭代次数')
        k=i-1;
        return;
    end
    i=i+1;
end
k=i-1;
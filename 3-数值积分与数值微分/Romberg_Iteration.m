function [lter_value] = Romberg_Iteration(f,a,b,e)
k=0; % 迭代次数
n=1; % 区间划分个数
h=b-a;
f = matlabFunction(f);
T=double(h/2*(f(a)+f(b)));      % 梯形公式求出T(1,1)
err=b-a;
lter_value = [];
%% 迭代求解，加密复化公式，外推公式
while err>=e
    k=k+1;
    h=h/2;
    tmp=0;
    for i=1:n
        tmp=tmp+f(a+(2*i-1)*h);
    end
    T(k+1,1)=double(T(k)/2+h*tmp); % 复化梯形公式 求出行首元
    lter_value(end+1) = T(k+1,1);
    for j=1:k
        T(k+1,j+1)=double(T(k+1,j))+double((T(k+1,j)-T(k,j))/(4^j-1));% 外推公式 迭代算法
        lter_value(end+1) = T(k+1,j+1);
    end
    n=n*2;
    err=abs(T(k+1,k+1)-T(k,k));% 误差为该次迭代的首元和上一次迭代首元的差
end

disp("T数表为："); % 输出T数表
disp(T); % 输出T数表
o=T(k+1,k+1)*1e12/206/1e9/10180/1e4/3;
disp("最大挠度为："+o); % 输出最大挠度

function [P,y,ys] = zjxl(X,F,n)
% 用正交多项式做曲线拟合
% X：自变量数组 F：函数值数组 n：拟合次数

syms  x  % 声明x为自变量
m=length(X); % 获取输入数据组数
P=cell(n+1,1); % 定义cell数组,用来存储拟合多项式的系数
P{1,1}=0;P{2,1}=1; % 初始化Pk（x）

a=zeros(1,n+1); % 初始化系数a*

%% 计算5次拟合函数
for i=1:n+1
    a_u=0;a_l=0;b_l=0;A_u=0;
    for j=1:m
        x=X(j,1);
        % subs 计算特定表达式的在参数下的值
        a_u=a_u+X(j,1)*subs(P{i+1,1})*subs(P{i+1,1}); % 计算Alpha的分子
        a_l=a_l+subs(P{i+1,1})*subs(P{i+1,1});        % 计算Alpha的分母
        b_l=b_l+subs(P{i,1})*subs(P{i,1});            % 计算Beta的分母

        A_u=A_u+F(j,1)*subs(P{i+1,1});                % 计算系数a*的分子
    end
    Alpha=a_u/a_l;         % 计算Alpha值
    a(1,i)=vpa(A_u/a_l);   % 计算a* 值；变精度，使得函数至少有d位有效数字
    if i==1
        Beta=0;
    else
        Beta=a_l/b_l;      % 计算Beta值
    end
    x='x';
    P{i+2,1}=(x-Alpha)*P{i+1,1}-Beta*P{i,1};        % 计算正交多项式Pk(x)
end

%% 计算各阶拟合多项式
ys = cell(n,1); % 初始化y多项式
y = a(1,1)*P{2,1};
for i=1:n
    y=y+a(1,i+1)*P{i+2,1}; % 计算5阶拟合多项式
    digits(6) % 控制6位精度
    y=vpa(expand(y)); % 展开多项式并以小数显示
    ys{i,1}=vpa(expand(y)); % 存储不同阶的多项式
    fprintf("%d次拟合：%s\n",i,y)
end
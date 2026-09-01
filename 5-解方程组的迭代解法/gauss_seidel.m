function [result,k]=gauss_seidel(A,b,x0,n,o)
%线性方程组迭代求解，高斯-赛德尔，可以利用当前解得前面的分量求解后面的分量
%A为系数矩阵
%b为常数向量
%x0为初始值

%% 改写系数矩阵A = D-L-U，构造迭代矩阵 J = (D-L)^(-1)*U
D=diag(diag(A));
L=-tril(A,-1);
U=-triu(A,1);
B=(D-L)^(-1)*U;
r=vrho(B);% 谱半径，特征值绝对值最大的那个，小于1收敛
result = [];
k = 0;
if r>=1
    disp('无法收敛！');
    return ;
end

%% 迭代计算
f=(D-L)^(-1)*b;
i=1;
while i<n
    x1=B*x0+f; % 迭代公式
    if norm(x1-x0)<o
        result=x1;
        k=i;
        return;
    end
%     if i>1000
%         return;
%     end
    i=i+1;
    x0=x1;
end
k=i-1;
% a=[2 2 -1;1 2 -3;1 -2 11]
% b=[2;6;10]
% -16.0000
%    20.0000
%     6.0000
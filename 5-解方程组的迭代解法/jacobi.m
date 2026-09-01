function [result,k]=jacobi(A,b,x0,n,o)
%线性方程组迭代求解，雅克比迭代
%A为系数矩阵
%b为常数向量
%x0为初始值

%% 改写系数矩阵A = D-L-U，构造迭代矩阵 J = D^(-1)*(L+U)
D=diag(diag(A));
L=-tril(A,-1);
U=-triu(A,1);
J=D^(-1)*(L+U);
r=vrho(J);% 谱半径，特征值绝对值最大的那个，小于1收敛
if r>=1     % 判断矩阵敛散性
    disp('无法收敛！');
    return;
end

%% 利用矩阵迭代公式迭代计算
f=D^(-1)*b;  % 主元的倒数 * b(i)
i=1;
while i<n
    x1=J*x0+f; % 迭代公式
    if norm(x1-x0)<o % norm()函数计算范数
        result=x1;
        k=i;
        return;
    end
    x0=x1;
    i=i+1;
end
if i==n
     disp('迭代次数不够！');
     result=[];
     k=0;
    return;
end
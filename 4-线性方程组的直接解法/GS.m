function X=GS(A,b)
%高斯消元法
if det(A) == 0 , error('行列式为0，求解终止！');end
m=size(A,1); % 返回数组一维度的大小
A=[A,b];

%% 消元
for i=1:m-1
    % 判断系数矩阵主元是否为0
    a=A(i,i);
    if a == 0
        fprintf('第%d个主元为0，求解终止！\n',i);
        return;
    end

    % 将系数矩阵转换为上三角矩阵
    for j=i+1:m
        k=A(j,i)/a;
        A(j,:)=A(j,:)-k*A(i,:);
    end
end

%% 回代，将系数矩阵转换为对角矩阵
for i=m:-1:2  % 一共有m-1列需要回代
    a=A(i,i);
    for j=i-1:-1:1
        k=A(j,i)/A(i,i);
        A(j,:)=A(j,:)-k*A(i,:);
    end
end

%% 对角线单位化，求X值
for i=1:m
    A(i,:)=A(i,:)/A(i,i);
    X(i)=A(i,end);
end



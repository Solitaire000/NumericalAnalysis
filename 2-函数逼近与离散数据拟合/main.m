clc
clear
X=xlsread('yacha.xlsx', 'A1:A68');
F=xlsread('yacha.xlsx', 'B1:B68');
n=5;
number=size(X);
figure

[P,y,ys]=zjxl(X,F,n);

%% 绘制拟合曲线
% 绘制5阶拟合曲线

x=0:0.1:6.7;
yy=matlabFunction(y);
y1=yy(x);
subplot(1,2,2);
hold on
scatter(X,F,'DisplayName','原始数据');
plot(x,y1,'g','DisplayName','5阶拟合曲线','LineWidth', 2);
legend show;
hold off

% 绘制不同阶的拟合曲线
% yys=zeros(1,n); % 初始化y多项式

subplot(1,2,1);
hold on
scatter(X,F,'DisplayName','原始数据');
for i = 1:n
    yys = matlabFunction(ys{i,1});
    yysF = yys(x);
    legend_str = num2str(i)+"阶拟合曲线";
    plot(x,yysF,'DisplayName',legend_str,'LineWidth', 2);
end
legend show;
hold off

%% 计算最小二乘法的误差值
ero=0;
for ii=1:number
    ero=ero+(y1(ii)-F(ii))^2;
end
ero

% ezplot(y,[0,8],'g')

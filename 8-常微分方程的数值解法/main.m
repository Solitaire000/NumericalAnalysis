clc
clear

%改进欧拉法计算常微分方程
[x1,y1]=Euler('Euler_fun',0,600,0,100);
[x2,y2]=GJEuler('Euler_fun',0,600,0,100);
[x3,y3]=Rungkutta('Euler_fun',0,600,0,1000);

figure
hold on
plot(x1,y1,'linewidth',2);
plot(x2,y2,'linewidth',2);
plot(x3,y3,'linewidth',2,'LineStyle','-.');
legend(["Euler迭代","改进Euler法迭代","Rungkutta法迭代"]);
hold off


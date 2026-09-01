function [lameda,u,i] = fanpingyi(A,p,tol,u0,n)

r=size(A,1);
I=eye(r,r);
v=inv(A-p*I)*u0; % inv 求逆
u = v /max(v);
i=0;
while norm(u - u0, inf) > tol
    u0 = u;
    v = inv(A - p * I) * u0;
    u = v / max(v);
    i=i+1;
    if i>n
        break;
    end
end
i;
u;
lameda=p + 1 / norm(v, inf);
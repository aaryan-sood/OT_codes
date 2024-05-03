clc
clear all
a=[15 14 16];
b=[10 7 15 13];
c=[9 13 4 10;23 13 16 4; 4 5 7 9];
if sum(a) == sum(b)
    fprintf('balanced');
else
    fprintf('unbalanced');
    if sum(a) > sum(b)
        c(:,end+1)=zeros(length(a),1);
        b(end+1)=sum(a)-sum(b);
    else
        c(end+1,:)=zeros(1,length(a));
        a(end+1)=sum(b)-sum(a);
    end
end
m=size(c,1);
n=size(c,2);
X=zeros(m,n);
intialC=c;
for i=1:m
    for j=1:n
        cpq=min(c(:));
    if cpq == inf
        break;
    end
    [p1,q1]=find(cpq == c);
    a(p1)
    b(q1)
    xpq=min(a(p1),b(q1))
    [x1,ind]=max(xpq);
    p=p1(ind)
    q=q1(ind)
    X(p,q)=min(a(p),b(q));
    if X(p,q) == a(p)
        b(q)=b(q)-a(p);
        a(p)=a(p)-X(p,q);
        c(p,q)=inf;
    else
        a(p)=a(p)-b(q);
        b(q)=b(q)-X(p,q);
        c(p,q)=inf;
    end
    end
end
z=0;
for i=1:m
    for j=1:n
        z=z+intialC(i,j)*X(i,j);
    end
end

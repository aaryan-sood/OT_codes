% Max z=3*x1+5*x2
%x1+2*x2<= 2000
%x1+x2<=1500
%x2<=600
%x1,x2>=0
clc
clear 
format short
% DEFINE A,B,C AND THE DEPENDENT VARIABLES AND PLOT THE LINES
A=[1 2;1 1;0 1];
C=[3 5];
B=[2000;1500;600];
x1=0:100:max(B);
x21=(B(1) - A(1,1)*x1)/A(1,2);
x22=(B(2) - A(2,1)*x1)/A(2,2);
x23=(B(3) - A(3,1) * x1)/A(3,2);
x21=max(0,x21);
x22=max(0,x22);
x23=max(0,x23);
plot(x1,x21,'r',x1,x22,'b',x1,x23,'g');
xlabel('x');
ylabel('y')
legend('x1+2x2=2000','x1+x2=1500','x2=600');

%FIND INTERCEPTS
CX1=find(x1==0);
C1=find(x21==0);
%disp(CX1);
%disp(C1);
%disp('x-intercept');
%disp(x1([C1 CX1]))
%disp('y-intercept');
%disp(x21([C1 CX1]))
line1=transpose([x1([C1 CX1]);x21([C1 CX1])]);
C2=find(x22==0);
line2=transpose([x1([C2 CX1]);x22([C2 CX1])]);
%disp('line2');
%disp(line2);
C3=find(x23==0);
line3=transpose([x1([C3 CX1]);x23([C3 CX1])]);
corpt=unique([line1;line2;line3],'rows');%corner points

%FIND OTHER SOLUTION POINTS BY TAKING LINES AS PAIRS OF TWO
pt=[0;0];
for i=1:size(A,1)
    for j=i+1:size(A,1)
        A1=A([i,j],:);
        B1=B([i,j],:);
        x1=inv(A1)* B1;
        pt=[pt,x1];
    end
end

%disp(pt);
pt=transpose(pt);
%disp(pt);
allpt=[pt;corpt];
%disp(allpt);
points=unique(allpt,'rows');

%REMOVE THE POINTS WHICH VIOLATE THE CONSTRIANTS
for i=1:size(points,1)
    const1(i)=A(1,1)*points(i,1)+A(1,2)*points(i,2)-B(1);
    const2(i)=A(2,1)*points(i,1)+A(2,2)*points(i,2)-B(2);
    const3(i)=A(3,1)*points(i,1)+A(3,2)*points(i,2)-B(3);
    s1=find(const1 > 0);
    s2=find(const2 > 0);
    s3=find(const3 > 0);
end

s=unique([s1,s2,s3]);
points(s,:)=[];

%FIND VALUE BY C'*X AND FIND THE MAXIMUM VALUE
value=points*transpose(C);
table=[points value];
[obj,index]=max(value);
X1=points(index,1);
X2=points(index,2);
fprintf('obj value is %f at (%f, %f)',obj,X1,X2);
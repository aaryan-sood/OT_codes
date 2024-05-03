%z=3*x1+5*x2;
%x1+2*x2 <= 2000
% x1+x2 <=1500
%x2 <= 600
%x1,x2 >= 0

%Defining the matrices and plotting the equations
clc 
clear 
format short
A=[1 2;1 1;0 1];
C=[3 5];
B=[2000;1500;600];
x1=0:100:max(B);
x21=(B(1,1) - A(1,1) * x1)/A(1,2);
x22=(B(2,1) - A(2,1) * x1)/A(2,2);
x23=(B(3,1) - A(3,1) * x1)/A(3,2);
x21=max(0,x21);
x22=max(0,x22);
x23=max(0,x23);
plot(x1,x21,'r',x1,x22,'g',x1,x23,'b');
legend('x1+2*x2<=2000','x1+x2 <=1500','x2 <= 600');
xlabel('x-axis');
ylabel('y-axis');

%find corner point
CX1=find(x1==0);
C1=find(x21==0);
line1=transpose([x1([C1 CX1]);x21([C1 CX1])]);
C2=find(x22 ==0);
line2=transpose([x1([C2 CX1]);x22([C2 CX1])]);
C3=find(x23 == 0);
line3=transpose([x1([C3 CX1]);x23([C3 CX1])]);
corpt=unique([line1;line2;line3],'rows');

%find intersection ponts of the lines by solving two at a time
pt=[0 0];
for i=1:size(A,1)
    for j=i+1:size(A,1)
        A1=A([i,j],:);
        B1=B([i,j],:);
        pt=[pt;transpose(inv(A1)*B1)];
    end
end

%find all points and eliminate the points that violate the constriants
allpts=[corpt;pt];
disp(allpts);
allpts=unique(allpts,'rows');
for i=1:size(allpts,1)
    const1(i)=allpts(i,1) + 2*allpts(i,2) -2000;
    const2(i)=allpts(i,1) + allpts(i,2) -1500;
    const3(i)=allpts(i,2) -600;
end
s1=find(const1 > 0);
s2=find(const2 > 0);
s3=find(const3 > 0);
s=unique([s1,s2,s3]);
allpts(s,:)=[];

%find the maximum value for the points that satisfy the constraints
value=allpts*transpose(C);
[obj,index]=max(value);
X1=allpts(index,1);
X2=allpts(index,2);
fprintf('So the maximum value of the function is %d at (%d,%d)',obj,X1,X2);
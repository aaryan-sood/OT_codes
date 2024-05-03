clc
clear
A=[-1 3;1 1;1 -1];
B=[10;6;2];
C=[2 3];
x1=0:1:max(B);
z1=(B(1) - A(1,1)*x1)/A(1,2);
z2=(B(2) - A(2,1)*x1)/A(2,2);
z3=(B(3) - A(3,1) * x1)/A(3,2);
% To plot multiple lines on a single graph use hold on or plot(x1,z1,'c1'...)
z1=max(0,z1);
z2=max(0,z2);
z3=max(0,z3);
plot(x1,z1,'r',x1,z2,'b',x1,z3,'g');
xlabel('x');
ylabel('y')
legend('-x1+3x2=10','x1+x2=6','x1-x2=2');
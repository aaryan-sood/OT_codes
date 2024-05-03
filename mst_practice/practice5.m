clc
a=[1 4; 3 1;1 1];
s=eye(size(a,1));
b=[24;21;9];
A=[a s b];
c=[2 5];
noofvariables=2;
BV=noofvariables+1:size(A,2)-1;
cost=zeros(1,size(A,2));
cost(1:noofvariables)=c;
zjcj=cost(BV)*A-cost;
zcj=[zjcj;A];
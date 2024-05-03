%z=2*x1+3*x2+3*x3=7*x4;
%s.t
%12*x1+3*x2-11*x3=4*x4=7;
%x1+2*x2+6*x3-7*x4=3;

clc
clear
format short
A=[12 3 -11 4;1 2 6 -7];
B=[7;3];
C=[2,3,3,7];
n=size(A,2);
m=size(A,1);
if n > m
    nCm=nchoosek(n,m); % number of ways of selecting zeroes
    p=nchoosek(1:n,m); % possible combinations
    sol=[];
    for i=1:nCm
        y=zeros(n,1);  %Column vector of zeroes
        A1=A(:,p(i,:));
        X=inv(A1)*B;
        if all(X >=0 & X~= inf & X~= -inf)
            y(p(i,:))=X;
            sol=[sol,y];
        end
    end
else
    error('no of constraints greater than no of variables');
end    
z=C*sol;
[obj,index]=max(z);
bfs=sol(:,index);
% Print the solution
optval=[bfs' obj];
array2table(optval,'VariableNames',{'x1','x2','x3','x4','z'})
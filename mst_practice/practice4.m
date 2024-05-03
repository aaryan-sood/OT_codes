%z=2*x1+3*x2+3*x3+7*x4;
%s.t
%12*x1+3*x2-11*x3+4*x4=7;
%x1+2*x2+6*x3-7*x4=3;
clc
clear
format short
A=[12 3 -11 4;1 2 6 -7];
B=[7;3];
C=[2 3 3 7];
n=size(A,2);
m=size(A,1);
sol=[];
if (n > m)
    nCm=nchoosek(n,m);
    p=nchoosek(1:n,m);
    for i=1:nCm
        y=zeros(n,1);
        A1=A(:,p(i,:));
        x=inv(A1)*B;
        if(x >= 0 & x~=inf & x~=-inf)
            y(p(i,:))=x;
            sol=[sol,y];
        end
    end
else 
    print('no of equations are greater than number of variables')
end
value=C*sol;
[obj,index]=max(value);
bfs=sol(:,index);
optval=[bfs' obj];
array2table(optval,'VariableNames',{'x1','x2','x3','x4','objVal'})
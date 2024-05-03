clc
clear all
a=[1 4;3 1;1 1];
s=eye(size(a,1));
b = [24; 21; 9];
A = [a s b];
c = [2 5];
cost = zeros(1,size(A,2));
noofvariables=2;
cost(1:noofvariables) = c;
BV = [noofvariables+1:size(A,2)-1];
zjcj=cost(BV)*A - cost;
zcj = [zjcj;A];
sim=array2table(zcj);
sim.Properties.VariableNames(1:size(zcj,2))={'x1','x2','s1','s2','s3','sol'};
RUN=true;
while RUN
    if any(zjcj(1:end-1) < 0)
        fprintf('current bfs is')
    zc=zjcj(1:end-1);
    [enter_val,pvt_col]=min(zc);
    if all (A(:,pvt_col)) <= 0
        error('LPP is unbound');
    else
        sol=A(:,end);
        column=A(:,pvt_col);
        for i=1:size(A,1) 
            if(column(i) > 0)
                ratio=sol(i)/column(i);
            else
                ratio=inf;
            end
        end
        [leavingval,pvt_row]=min(ratio);
    end
    BV(pvt_row)=pvt_col;
    pvt_key=A(pvt_row,pvt_col);
    A(pvt_row,:)=A(pvt_row,:)/pvt_key;
    for i=1:size(A,1)
        if i~=pvt_row
            A(i,:)=A(i,:)-A(i,pvt_col) * A(pvt_row,:);
        end
    end
    zjcj=cost(BV)*A-cost;
    next_table=[zjcj;A];
    array2table(next_table,'VariableNames',{'v1','v2','v3','v4','v5','v6'})
    else
        RUN=false;
        fprintf('the final optimal solution is %f \n',zjcj(end));
    end
end 
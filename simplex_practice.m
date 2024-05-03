clc
clear
a=[1 4;3 1;1 1];
s=eye(size(a,1));
b=[24;21;9];
A=[a s b];
c=[2 5];
noofvariables=2;
cost=zeros(1,size(A,2));
cost(1:noofvariables)=c;
BV=noofvariables+1:size(A,2)-1;
zjcj=cost(BV) * A - cost;
zcj=[zjcj;A];
array2table(zcj,'VariableNames',{'x1','x2','s1','s2','s3','sol'})
RUN=true;
while RUN
    if any(zjcj(1:end-1) < 0)
        fprintf('current BFS is : ');
        zc=zjcj(1:end-1);
        [entering_val,pvt_col]=min(zc);
        if all(A(:,pvt_col) <= 0)
            fprintf('LPP is unbounded');
        else
            sol=A(:,end);
            column=A(:,pvt_col);
            for i=1:size(A,1)
                if column(i) > 0
                    ratio(i)=sol(i)/column(i);
                else
                    ratio(i)=inf;
                end
            end
            [leaving_val,pvt_row]=min(ratio);
        end
        BV(pvt_row)=pvt_col;
        pvt_key=A(pvt_row,pvt_col);
        A(pvt_row,:)=A(pvt_row,:)/pvt_key;
        for i=1:size(A,1)
            if i ~= pvt_row
                A(i,:)=A(i,:) - A(i,pvt_col) * A(pvt_row,:);
            end
        end
        zjcj=cost(BV) * A -cost;
        next_table=[zjcj;A];
        array2table(next_table,'VariableNames',{'v1','v2','v3','v4','v5','v6'})
    else
        RUN=false;
        fprintf('optimal solution is %f',zjcj(end));
    end
end
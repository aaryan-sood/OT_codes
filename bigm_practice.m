%Big m code
clc
clear
format short
M=1000;
a=[5 9 -1 0 1;9 2 0 1 0];
b=[22;36];
cost=[2 3 0 0 -M 0];
BV=[4 5];
artifical_var=[5];
A=[a b];
Var={'x1','x2','s1','s2','A1','sol'};
zjcj=cost(BV) * A -cost;
zcj=[zjcj;A];
array2table(zcj,'VariableNames',Var)
RUN=true;
while RUN
    if any(zjcj(1:end-1) < 0)
        fprintf('cuurent Bfs is \n');
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
        A(pvt_row,:)=A(pvt_row,:)./pvt_key;
        for i=1:size(A,1)
            if i ~= pvt_row
                A(i,:)=A(i,:)-A(i,pvt_col) .* A(pvt_row,:);
            end
        end
        zjcj=cost(BV) * A- cost;
        next_table=[zjcj;A];
        array2table(next_table,'VariableNames',Var)
        
    else
        RUN=false;
        if any(BV == artifical_var(1))
            fprintf('Infeasable Solution');
        end
        
        fprintf('the optimal solution is %d',zjcj(end));
    end
end
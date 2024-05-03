clc
a=[1 2 3 ;4 5 6;7 8 9];
b=[10 11 12; 13 14 15; 16 17 18];
c=a+b;
disp(c);
d=b-a;
e=a*b;
% for element wise multiplication and division a.*b and a./b in matrices
b=[4 5; 6 7];
b(3,3)=8;% to add 8 to 3,3
sum(b) % column wise sum of b
sum(b,1)% column wise sum of b
sum(b,2)%row wise sum of b
b(:,2) % extract 2nd column
b(2,:)%extract 2nd row

% Assignment 1

clc 
clear 
%Ques1
%a=input('enter first number');
%b=input('enter increment');
%c=input('enter last');
%d=a:b:c;
%disp('The elements of the array are : ');
%disp(d);

%Ques2
% Given matrix
a = [4 1 3; 2 6 7; 3 1 8];
idx = find(a == min(a(:)));
[r, c] = ind2sub(size(a), idx);
disp('Location of the least element:');
disp(['Row: ', num2str(r).]);  % Corrected line
disp(['Column: ', num2str(c)]);
a(r, c) = 10;
disp('Updated matrix:');
disp(a);




%Ques3
% Create a sample matrix
a = [4 1 3; 2 6 7; 3 1 8];
disp('original matrix : ')
disp(a)
sorted_rows=sort(a,2);
disp('matrix sorted acc to rows');
disp(sorted_rows);
sorted_columns=sort(a,1);
disp('matrix sorted acc to columns');
disp(sorted_columns)

%Ques4
x=0:0.001:12;
y=(12-2*x)/4;
%disp(y);
plot(y);

a=[2 4;3 2];
b=[12;12];
X=inv(a)*b;
disp(X);
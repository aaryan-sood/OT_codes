%f(x,y) = x-y +2*x*x+2*x*y+y*y;
%grad = @(x,y)[1+4*x+2*y,-1+2*x+2*y];
%a=0;
%b=0;
%for k=1:4
%    d=-grad(a,b) / norm(grad(a,b));
%   fun = @(z) f(a+z*d(1)), b+z*d(2));
% lambda=fminbnd(fun,0,100);
%   a=a+lambda*d(1);
% b=b+lambda*d(2);

%end

f = @(x, y) x - y + 2*x^2 + 2*x*y + y^2;
grad = @(x, y) [1 + 4*x + 2*y, -1 + 2*x + 2*y];

a = 0;
b = 0;

for k = 1:4
    g = grad(a, b);
    d = -g / norm(g);
    fun = @(z) f(a + z*d(1), b + z*d(2));
    lambda = fminbnd(fun, 0, 100);
    a = a + lambda * d(1);
    b = b + lambda * d(2);
end

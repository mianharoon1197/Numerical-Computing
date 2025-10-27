f = @(x) log(x) + x^2 -3;
a=1; b=2;

tol = 1e-5; maxIter = 100;
for i = 1:maxIter
c = (a+b)/2;
if f(a) * f(c) < 0
b=c;
else
a=c;
end
if abs(f(c)) < tol
break
end
end
disp(['Root approx = ', num2str(c)])



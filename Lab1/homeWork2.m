f = @(x) x .* exp(-x) - 0.1;
a=0; b=1;

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



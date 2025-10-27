f = @(x) x^3 - 4*x - 9; % Function
a = 2; b = 3; % Interval

tol = 1e-5; maxIter = 100;
for i = 1:maxIter
c = (a+b)/2;
if f(a)*f(c) < 0
b = c;
else
a = c;
end
if abs(f(c)) < tol
break
end
end
disp(['Root approx = ', num2str(c)])

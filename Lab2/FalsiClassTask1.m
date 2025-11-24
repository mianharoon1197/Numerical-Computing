f = @(x) cos(x)-x;
a = 0;
b = 1;
tol = 1e-5;
maxIter = 100;

for i = 1:maxIter
    fa = f(a);
    fb = f(b);
    % False position formula
    c = (a*fb - b*fa) / (fb - fa);
    fc = f(c);
    fprintf('Iter %d: a=%.6f, b=%.6f, c=%.6f, f(c)=%.6e\n', i, a, b, c, fc);
    if abs(fc) < tol
        fprintf('Root found at x = %.6f after %d iterations\n', c, i);
        break;
    end
    % Update interval
    if fa * fc < 0
        b = c;
    else
        a = c;
    end
end

if i == maxIter
    fprintf('Stopped after maxIter = %d\n', maxIter);
end

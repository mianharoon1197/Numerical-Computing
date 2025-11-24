f = @(x) x^2 - 3;

a = 0;
b = a + 1;

while f(a) * f(b) > 0
    a = b;
    b = b + 1;
end

fprintf('Initial interval found: [%.2f, %.2f] where f(a)=%.4f, f(b)=%.4f\n\n', a, b, f(a), f(b));

tol = 1e-4;     
maxIter = 100;

fprintf('Iter\t    a\t\t     b\t\t      c\t\t     f(c)\n');

for i = 1:maxIter
    fa = f(a);
    fb = f(b);
    % Regula Falsi formula
    c = (a*fb - b*fa) / (fb - fa);
    fc = f(c);
    
    fprintf('%2d\t%10.6f\t%10.6f\t%10.6f\t%10.6f\n', i, a, b, c, fc);
    
    if abs(fc) < tol
        fprintf('\nRoot found at x = %.4f after %d iterations\n', c, i);
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
    fprintf('\nStopped after maxIter = %d (no convergence)\n', maxIter);
end

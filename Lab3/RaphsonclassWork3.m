f = @(x) cos(x)- x;
 df = @(x) -sin(x) - 1;
 x0 = 0.5;
 tol = 1e-6;
 maxIter = 50;
 % Display table header
 fprintf('Iter\t x_n\t\t f(x_n)\t\t x_{n+1}\n');
 fprintf('---------------------------------------------\n');
 % Iterative process
 for i = 1:maxIter
 x1 = x0- f(x0)/df(x0);
 % Newton-Raphson formula
 % Display current iteration
 fprintf('%d\t %.6f\t %.6f\t %.6f\n', i, x0, f(x0), x1);
 if abs(x1- x0) < tol
 %fprintf('Converged after %d iterations.\n', i);
 break;
 end
 x0 = x1; % Update for next iteration
 end
 % Display final result
 fprintf('Approximate root: %.6f\n', x1);
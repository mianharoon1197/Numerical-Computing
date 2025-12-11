clc; clear;

x = [1 2 4 7];      % x-values
y = [3 6 9 20];     % f(x) values

n = length(x);

% Create DD table
DD = zeros(n, n);%n by n matrix to store values

DD(:,1) = y'; %takes all rows col 1, then transpose, stores in first col of DD

% Build the divided difference table
for col = 2:n
    for row = 1:n-col+1
        DD(row,col) = (DD(row+1,col-1) - DD(row,col-1)) / (x(row+col-1) - x(row));
    end
end

fprintf("---------------------------------------------------------------\n");
fprintf("|   x   |    f(x)   |   D1      |   D2      |   D3      |\n");
fprintf("---------------------------------------------------------------\n");

for i = 1:n
    fprintf("| %5.2f | %8.2f |", x(i), DD(i,1));%print each row
    
    % Print remaining columns
    for j = 2:n
        if i <= n-j+1
            fprintf(" %8.4f |", DD(i,j));
        else
            fprintf("          |");  % empty cell
        end
    end
    
    fprintf("\n");
end

fprintf("---------------------------------------------------------------\n");

% Newton coefficients
coeff = DD(1,:);
fprintf("Newton Polynomial Coefficients:\n");
disp(coeff);



X = 3;
p = coeff(end);              % start from highest order coefficient
for k = length(coeff)-1:-1:1
    p = p*(X - x(k)) + coeff(k);
end
% p now holds P(5)
fprintf('P(%.2f) = %.6f\n', X, p);


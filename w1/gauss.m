A = input("Digite a matriz A na sintaxe do Matlab: ");
n = size(A, 1);

% Inicialização das matrizes L, U e P
L = eye(n);
U = A;
P = eye(n);

% Eliminação de Gauss com pivoteamento parcial
for k = 1:n-1
    % Pivoteamento parcial
    [p, q] = find(abs(U(k:n, k)) == max(abs(U(k:n, k))));
    p = p(1) + k - 1;
    q = q(1) + k - 1;
    if p ~= k
        U([k, p], :) = U([p, k], :);
        P([k, p], :) = P([p, k], :);
        if k > 1
            L([k, p], 1:k-1) = L([p, k], 1:k-1);
        end
    end
    
    % Eliminação de Gauss
    for i = k+1:n
        L(i, k) = U(i, k) / U(k, k);
        U(i, :) = U(i, :) - L(i, k) * U(k, :);
    end
end

% Matriz inversa
A_inv = zeros(n);
for i = 1:n
    b = zeros(n, 1);
    b(i) = 1;
    y = P * b;
    x = zeros(n, 1);
    % Resolução de Ly = b
    for j = 1:n
        x(j) = y(j) - L(j, 1:j-1) * x(1:j-1);
    end
    % Resolução de Ux = y
    for j = n:-1:1
        x(j) = (x(j) - U(j, j+1:n) * x(j+1:n)) / U(j, j);
    end
    A_inv(:, i) = x;
end

% Impressão das matrizes
fprintf('Matriz L:\n');
disp(L);
fprintf('Matriz U:\n');
disp(U);
fprintf('Matriz P:\n');
disp(P);
fprintf('Matriz P1:\n');
P1 = eye(n);
for k = 1:n-1
    [p, q] = find(abs(M{k}(k:n, k)) == max(abs(M{k}(k:n, k))));
    p = p(1) + k - 1;
    q = q(1) + k - 1;
    if p ~= k
        P1([k, p], :) = P1([p, k], :);
    end
end
disp(P1);
fprintf('Matriz P2:\n');
P2 = eye(n);
for k = 1:n-1
    [p, q] = find(abs(M{k}(k:n, k)) == max(abs(M{k}(k:n, k))));
    p = p(1) + k - 1;
    q = q(1) + k - 1;
    if p ~= k
        P2([k
end

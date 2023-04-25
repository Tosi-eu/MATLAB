A = input("");
n = size(A,1);
L = eye(n);
P = eye(n);
U = A;

Pk = cell(n-1,1); % para armazenar as matrizes de permutação
Mk = cell(n-1,1); % para armazenar as matrizes de eliminação

for k=1:n-1
    [~,p] = max(abs(U(k:n,k)));
    p = p+k-1;
    if p~=k
        % troca as linhas k e p em U e P
        U([k,p],k:n) = U([p,k],k:n);
        P([k,p],1:n) = P([p,k],1:n);
        if k > 1
            L([k,p],1:k-1) = L([p,k],1:k-1);
        end
    end
    for j=k+1:n
        L(j,k) = U(j,k)/U(k,k);
        U(j,k:n) = U(j,k:n) - L(j,k)*U(k,k:n);
    end
    
    % calcula P(k) e M(k)
    Pk{k} = eye(n);
    Pk{k}([k,p],:) = Pk{k}([p,k],:);
    Mk{k} = eye(n);
    Mk{k}(k+1:n,k) = L(k+1:n,k);
    
end

% calcula a matriz inversa
A_inv = zeros(n);
for i=1:n
    e = zeros(n,1);
    e(i) = 1;
    y = P*e;
    for j=1:n
        for k=1:j-1
            y(j) = y(j) - L(j,k)*y(k);
        end
    end
    for j=n:-1:1
        for k=j+1:n
            y(j) = y(j) - U(j,k)*A_inv(k,i);
        end
        A_inv(j,i) = y(j)/U(j,j);
    end
end

% imprime as matrizes
disp("A_inv =");
disp(num2str(A_inv, '%.6f\t'));
disp("L =");
disp(num2str(L, '%.6f\t'));
disp("U =");
disp(num2str(U, '%.6f\t'));
disp("P =");
disp(num2str(P, '%.6f\t'));

% imprime as matrizes de permutação e de eliminação
for k=1:n-1
    fprintf("P(%d) =\n", k);
    disp(num2str(Pk{k}, '%.0f\t'));
end

for k=1:n-1
    fprintf("M(%d) =\n", k);
    disp(num2str(Mk{k}, '%.6f\t'));
end


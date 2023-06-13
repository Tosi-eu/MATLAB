function interpolacao_lagrange()

    xi = input('');
    yi = input('');
    x_teste = input('');
    
    % pontos
    n = length(xi) - 1;
    
    % pesos
    w = zeros(1, n+1);
    for k = 0:n
        prod = 1;
        for i = 0:n
            if i ~= k
                prod = prod * (xi(k + 1) - xi(i + 1));
            end
        end
        w(k+1) = 1 / prod;
    end
    
    P = zeros(size(x_teste));
    for j = 1:length(x_teste)
        num = 0;
        den = 0;
        for k = 0:n
            if abs(x_teste(j) - xi(k + 1)) < 1e-6
                P(j) = yi(k + 1);
                break;
            end
            weight = w(k + 1) / (x_teste(j) - xi(k + 1));
            num = num + weight * yi(k + 1);
            den = den + weight;
        end
        P(j) = num / den;
    end

    fprintf('Exato:\n');
    fprintf(' %.4f', sin(x_teste));
    fprintf('\nInterpolado:\n');
    fprintf(' %.4f', P);
    fprintf('\nPesos:\n');
    fprintf(' %.4f', w);

end

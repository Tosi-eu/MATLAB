function h = bissec(V, L, r)
a = 0.0001; % limite inferior inicial para h
b = r; % limite superior inicial para h
tol = 1e-6; % tolerância
erro = Inf; % erro inicial

while erro > tol
    h = (a + b) / 2; % calcula o valor médio entre a e b
    volume = L * (0.5 * pi * r^2 - r^2 * asin(h/r) - h * sqrt(r^2 - h^2)); % calcula o volume para o valor atual de h

    if volume > V
        a = h; % atualiza o limite inferior
    else
        b = h; % atualiza o limite superior
    end
    
    if a == b
        break; % interrompe o loop se a e b forem iguais
    end
    
    erro = abs(b - a) / abs(a); % calcula o erro relativo corretamente
end

fprintf('%.4f', h); % exibe o valor de h com 4 casas decimais
end

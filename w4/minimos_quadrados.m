% valores de xi e yi
xi = input('');
yi = input('');
graus = [1, 2, 3];

% obtendo os graus
for k = 1:length(graus)
    grau = graus(k);
    
    % matriz A
    A = ones(length(xi), grau + 1);
    for i = 1:length(xi)
        for j = 1:grau
            A(i, j+1) = xi(i)^j;
        end
    end
    
    % Cálculo dos coeficientes
    coeficientes = (A' * A) \ (A' * yi');
    
    % cálculo das aproximações
    Pk = A * coeficientes;
    
    % cálculo do erro de truncamento
    erro = sum((yi - Pk').^2);

    disp(['Polinômio de grau ' num2str(grau)]);
    disp(['-> Coeficientes: ' num2str(flip(coeficientes', 2), '%0.4f ')]);
    disp(['-> Aproximações: ' num2str(Pk', '%0.4f ')]);
    disp(['-> Erro de truncamento: ' num2str(erro, '%0.4f')]);
    disp('');
end

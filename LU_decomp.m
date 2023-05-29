function [LU,P] = LUPivo(A)
  
%----------------------------------
%
%
%       Precisao para o teste de Singularidade
        epsilon = 1.0e-10;   
%
%       Ordem da Matriz A
        [n,n] = size(A);    
%
        LU = A;          
%
%       Matriz de Permutacao
        P = 1:n;
%
%
%       Decomposicao  LU
%---------------------------------
        for j = 1:(n-1)
%
%       Escolha do Pivo
%----------------------
        [maxvalor,i] = max(abs( LU(j:n,j) ));
        i = i + j - 1;
%
%
%       Verifica se a Matriz e' Singular
%---------------------------------------
        if ( maxvalor <= epsilon )
        disp('  '), disp('    ')
        error('      Matriz  Singular')
        end        
%
%
%       Permutacao das Linhas
%----------------------------
        LU([j i],:) = LU([i j],:);
%
        P([j i]) = P([i j]);               
%
%       Matriz  L
%------------------------------
        LU((j+1):n,j)  =  LU((j+1):n,j) / LU(j,j);
%
%      M atriz  U
%------------------------------
        soma = LU((j+1):n,(j+1):n) - LU((j+1):n,j)*LU(j,(j+1):n);
        LU((j+1):n,(j+1):n) = soma;
%
%
        end

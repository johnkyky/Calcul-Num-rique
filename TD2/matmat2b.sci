function [C] = matmat2b(A, B)
    [nA, mA] = size(A)
    [nB, mB] = size(B)
    
    C(nA, mB) = []
    for i = 1 : nA
        for j = 1 : mB
            C(i, j) = A(i, 1 : mA) * B(1 : mA, j)
        end
    end
endfunction

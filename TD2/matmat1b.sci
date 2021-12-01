function [C] = matmat1b(A, B)
    [nA, mA] = size(A)
    [nB, mB] = size(B)

    C(nA, mB) = []
    for i = 1 : nA
        C(i, 1 : mB) = A(i, 1 : mA) * B(1 : mA, 1 : mB)
    end
endfunction

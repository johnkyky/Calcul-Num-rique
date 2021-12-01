function [L, U] = mylu3b(A)
    [n, m] = size(A)
    for k = 1 : n - 1
        for i = k + 1 : n
            A(i, k) = A(i, k) / A(k, k)
        end
        for i = k + 1 : n
            for j = k + 1 : n
                A(i, j) = A(i, j) - A(i, k) * A(k, j)
            end
        end
    end
    
    U = triu(A)
    L = tril(A)
    
    for i = 1 : n
        L(i, i) = 1
    end
end


function [L, U] = mylu3b_opti(A)
    n = size(A, 1)
    for k = 1 : n - 1
        A(k + 1 : n, k) = A(k + 1 : n, k) / A(k, k)
        A(k + 1 : n,  k + 1 : n) = A(k + 1 : n,  k + 1 : n) - A(k + 1 : n, k) * A(k,  k + 1 : n)
    end
    
    U = triu(A)
    L = tril(A)
    
    for i = 1 : n
        L(i, i) = 1
    end
end


function [L, U, P] = mylu(A)
    n = size(A, 1)
    P = eye(n, n)
    for k = 1 : n - 1
        
        //swap rows
        index = k
        [maxi, index] = max((A(k : n, k)))
        index = k - 1 + index
        if index ~= k
            tmpA = A(index, :)
            tmpP = P(index, :)
            A(index, :) = A(k, :)
            A(k, :) = tmpA
            P(index, :) = P(k, :)
            P(k, :) = tmpP
        end

        for i = k + 1 : n
            A(i, k) = A(i, k) / A(k, k)
        end
        for i = k + 1 : n
            for j = k + 1 : n
                A(i, j) = A(i, j) - A(i, k) * A(k, j)
            end
        end
    end
    
    U = triu(A)
    L = tril(A)
    
    for i = 1 : n
        L(i, i) = 1
    end
end

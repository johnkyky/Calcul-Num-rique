getd('.')

SAMPLE = 10

xlu = []

yl = []
yu = []
yl_ = []
yu_ = []

errylForward = []
errylBackward = []

erryl_Forward = []
erryl_Backward = []

i = 1

while i < 300
    mat = rand(i, i)
    L = tril(mat)
    U = triu(mat)
    
    xex = rand(i, 1)
    b = L * xex
    
    xlu($ + 1) = i

    //
    tic()
    for j = 1 : SAMPLE
        x = lsolve(L, b)
    end
    yl($ + 1) = toc() / SAMPLE
    errylForward($ + 1) = norm(xex - x) / norm(xex)
    errylBackward($ + 1) = norm(b - L * x) / (norm(L) * norm(x))

    //
    tic()
    for j = 1 : SAMPLE
        x = usolve(U, b)
    end
    yu($ + 1) = toc() / SAMPLE
    
    //
    tic()
    for j = 1 : SAMPLE
        x = L \ b
    end
    yl_($ + 1) = toc() / SAMPLE
    erryl_Forward($ + 1) = norm(xex - x) / norm(xex)
    erryl_Backward($ + 1) = norm(b - L * x) / (norm(L) * norm(x))
    
    //
    tic()
    for j = 1 : SAMPLE
       x = U \ b
    end
    yu_($ + 1) = toc() / SAMPLE
    
    disp(i)
    i = i + 10
end

clf()
subplot(121)
xtitle("Triangular system : ", "size matrix / vector", "time(seconde)")
plot(xlu, [yl, yu, yl_, yu_])
legend(['lower solution', 'upper solution', 'scilab lower solution', 'scilab upper solution'])

subplot(122)
xtitle("Forward and backward error of triangular systeme", "size matrix","size of error")
plot('nl', xlu, errylForward, xlu, errylBackward, xlu, erryl_Forward, xlu, erryl_Backward)
legend(['forward error', 'backward error', 'scilab forward error', 'scilab backward error'])

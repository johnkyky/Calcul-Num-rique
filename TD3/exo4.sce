getd('.')

SAMPLES = 10

xLU = []
time_scilab = []
time_3b = []
time_opti = []
time_pivot = []

err_scilab = []
err = []

i = 1
while i < 75
    A = rand(i, i)
    
    xLU($ + 1) = i
    
    tic()
    for j = 1 : SAMPLES
        [L, U, P] = lu(A)
    end
    time_scilab($ + 1) = toc() / SAMPLES
    err_scilab($ + 1) = norm(A - L * U)
    
    tic()
    for j = 1 : SAMPLES
        [L1, U1] = mylu3b(A)
    end
    time_3b($ + 1) = toc() / SAMPLES
    
    tic()
    for j = 1 : SAMPLES
        [L2, U2] = mylu3b_opti(A)
    end
    time_opti($ + 1) = toc() / SAMPLES
    
    tic()
    for j = 1 : SAMPLES
        [L3, U3, P3] = mylu(A)
    end
    time_lu($ + 1) = toc() / SAMPLES
    err($ + 1) = norm(A - L3 * U3)
    
    i = i + 5
    disp(i)
end

clf()
xtitle("LU factorisation", "size matrix", "time(seconde)")
plot("nl", xLU, [time_scilab, time_3b, time_opti, time_lu])
legend(['time scilab version', 'time 3 loop', 'time opti', 'time pivot'])

/*xtitle("LU factorisation error", "size matrix", "error")
plot("nl", xLU, [err_scilab, err])
legend(['error scilab LU', 'error my LU'])*/

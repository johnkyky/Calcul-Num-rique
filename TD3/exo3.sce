getd('.')

SAMPLE = 10

x = []

y = []
y_ = []

errF = []
errB = []
err_F = []
err_B = []

i = 1

while i < 50
    A = rand(i, i)

    xex = rand(i, 1)
    b = A * xex
    
    //
    x($ + 1) = i

    tic()
    for j = 1 : SAMPLE
        c = gausskij3b(A, b)
    end
    y($ + 1) = toc() / SAMPLE
    errF($ + 1) = norm(xex - c) / norm(xex)
    errB($ + 1) = norm(b - A * c) / (norm(A) * norm(c))
    
    tic()
    for j = 1 : SAMPLE
        c_ = A \ b
    end
    y_($ + 1) = toc() / SAMPLE
    err_F($ + 1) = norm(xex - c_) / norm(xex)
    err_B($ + 1) = norm(b - A * c_) / (norm(A) * norm(c_))
    
    i = i + 5
    disp(i)
end

clf()
//xtitle("Gauss", "size matrix", "time (seconde)")
//plot("nl", x, [y, y_])
//legend(["gauss", "scilab gauss"])

xtitle("Gauss error", "size matrix", "error")
plot("nl", x, [errF, errB, err_F, err_B])
legend(["forward error", "backward error", "scilab forward error", "scilab backward error"])

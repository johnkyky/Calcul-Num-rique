getd('.')

SAMPLES = 10
STEP = 5
LIMIT = 75

x = []

y3b = []
y2b = []
y1b = []


i = STEP
while i <= LIMIT
    A = rand(i, i)
    B = rand(i, i)

    x($ + 1) = i
    
    tic()
    for j = 1 : SAMPLES
        matmat3b(A, B)
    end
    y3b($ + 1) = toc() / SAMPLES
     
    tic()
    for j = 1 : SAMPLES
        matmat2b(A, B)
    end    
    y2b($ + 1) = toc() / SAMPLES

    tic()
    for j = 1 : SAMPLES
        matmat1b(A, B)
    end
    y1b($ + 1) = toc() / SAMPLES
    
    i = i + STEP
    disp(i)
end

xtitle("Matrix product with different algo", "size matrix", "time(seconde)")
xgrid(1, 1, 1)
plot("nl", x, [y3b, y2b, y1b])
legend(['matmat 3 loops';'matmat 2 loops';'matmat 1 loop'])

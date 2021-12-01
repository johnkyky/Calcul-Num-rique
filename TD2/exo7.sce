A = rand(50, 50)
xex = rand(50, 1)

b = A * xex
x = A \ b

front_error = norm(xex - x) / norm(xex)
back_error = norm(b - A * x) / (norm(A) * norm(x))

disp("erreur avant", front_error, "erreur arriere", back_error)




using Polynomials

#Encontando raízes de x2
eq1 = Polynomial([-4,4,1])
x2 = roots(eq1)

#Encontrando raízes de x1
x1 = zeros(2);
for i in 1:length(x2)
    x1[i] = 6*x2[i]
end

#Encontrando raízes de x3 reais
x3 = zeros(4)
m = 0
# for i in 1:length(x1), j in 1:length(x2)
#     global m+=1
#     x3[m] = ((-8+0im + 6*(x1[i]+0im)*(x2[j]+0im))/4)^(1/4)
# end

x3[1] = ((8 + 6*x1[1]*x2[1])/4)^(1/4)
# x3[2] = Complex((-8 + 6*x1[2]*x2[1])/4)^(1/4)
x3[4] = ((8 + 6*x1[2]*x2[2])/4)^(1/4)


# x_select = [x1[2],x2[2],x3[4]]
x_select = [x1[2],x2[2],x3[4]]

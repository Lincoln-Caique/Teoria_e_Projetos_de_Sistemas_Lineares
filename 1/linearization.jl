using ControlSystems, ForwardDiff, Plots
include("roots.jl")

# Equações do sistema
function f(x, u)
    x1,x2,x3 = x
    u = u[1]

    eq1 = x2^2 + 4*x2 -2*u
    eq2 = -x1 + 3x2*u
    eq3 = 6*x1*x2 + 4*u - 4*x3^4

    [eq1;eq2;eq3]
end

function g(x, u)
    x1,x2 = x

    [x1^2 + 3*sin(x2 + π/4)]
end

# Ponto de operação
# x0 = x_select # vetor de estados no ponto de operação
x0 = 2*x_select # vetor de estados fora ponto de operação

u0 = [2]    # vetor de entrada no ponto de operação

# Linearização do sistema em torno do ponto de operação
A = ForwardDiff.jacobian(x -> f(x, u0), x0);
B = ForwardDiff.jacobian(u -> f(x0, u), u0);
C = ForwardDiff.jacobian(x -> g(x, u0), x0);
D = ForwardDiff.jacobian(u -> g(x0, u), u0);

# Sistema linearizado
linear_sys = ss(A, B, C, D);

# Simulando sistema linear
t = 0:0.01:10 # vetor de tempo
u = 2*ones(length(t))'
y, t, x, uout = lsim(linear_sys,u,t,x0=x0)

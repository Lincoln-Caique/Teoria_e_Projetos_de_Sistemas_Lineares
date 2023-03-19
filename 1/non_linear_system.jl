using DifferentialEquations
using Plots
include("roots.jl")

function sistema_nao_linear!(du, s, p, t)
    x1, x2, x3 = s
    u = p[1]
    du[1] = x2^2 + 4*x2 - 2*u
    du[2] = -x1 + 3*x2*u
    du[3] = 6*x1*x2 - 4x3^4 + 4*u
end

function output(x)
    x1, x2 = x
    return x1.^2 .+ 3*sin.(x2.+π/4)
end

# u0 = x_select
u0 = 2*x_select

tspan = (0.0, 10)

p = [2.1]

prob = ODEProblem(sistema_nao_linear!, u0, tspan, p)
sol = solve(prob, Tsit5())
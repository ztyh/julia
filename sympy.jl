# http://mth229.github.io/symbolic.html
Pkg.add("SymPy")

using SymPy

x=Sym("x")

x

x|>typeof

@vars a b c

h, y = symbols("h, y", real=true)

x^2 - 2x + 2 |> typeof

f(x) = exp(-x^2/2)
f(x)

subs(f(x), x, 1)

ex = exp(-x^2/2)
ex(1)
ex(x=>1)
N(ex(1))

(x+1) + (x+2) + (x+3)

sin(x)^2 + cos(x)^2

simplify(sin(x)^2 + cos(x)^2)

factor(x^2 + 2x + 1)

expand( (x+1)*(x+2)*(x+3) )
p = expand((x-1)*(x-2)*(x-3)*(x^2 + x + 1))
factor(p)
polyroots(p)
Sym[k for (k,v) in polyroots(p)]
q = x^2 - 8x + 8
factor(q)
polyroots(q)
q = x^4 - 8x^2 + 8
real_roots(q)
N(real_roots(q))
solve(q)
as = solve(q)
map(N, as)
solve(exp(x) - 2x^2, x)
nsolve(exp(x) - 2x^2, x, 3)
solve(sin(x)^2 - (1/2)^2) * 180 / pi
out = solve(x^2 + y^2 - 1, y)
out |> replace(x, 1/2) |> N
x, y = Sym("x", "y")
eq1 = x + y -1
eq2 = x - y - (-1)
solve([eq1, eq2], [x,y])

#=
Pkg.add("Plots")
using Plots
gadfly()
ex = x^2 - 2x + 4
plot(ex, -1, 3)

f(x) = x^2 - 2x + 4
plot(f, -1, 3)

f(x) = sqrt(x);
c = 2;
fp = diff(f(x));		# diff finds derivative, fp an expression (not function)
m = fp(x=>c)	        # at c=2
plot([f(x), f(c) + m * (x - c)], 1, 3)
=#

limit(sin(x)/x, x, 0)
limit((1-cos(x))/x^2, x, 0)
lambda = symbols("lambda")
limit((1 - lambda *x)^(1/x), x, 0)
exp(-lambda)
limit(sin(x)/x, x, oo)
h = Sym("h")
f(x) = x^10
limit( (f(x+h) - f(x))/h, h, 0)
central_difference(f, x, h) = ( f(x+h) - f(x-h) ) / (2h)
a = limit(central_difference(f, x, h), h, 0)
central_4th_difference(f, x, h) = (-f(x + 2h) + 8f(x+h) - 8f(x-h) + f(x-2h))/(12h)
limit(central_4th_difference(f, x, h), h, 0)
g(x) = sin(x)
limit( (f(g(x+h)) - f(g(x)))/h, h, 0) |> replace(x, 1)
f(x) = exp(exp(x))
diff(f(x))
diff(f(x), x)
diff(f(x), x, 2)
f(x) = x^x
# plot(diff(f(x)), 1/10, 2)
#=
f(x) = x^x; c = 1
m = diff(f(x)) |> replace(x, c);
fs = [f(x), f(c) + m*(x-c)]
plot(fs, .5, 1.5)
=#

L=Sym("L")
A=x*y
A=A(y=>L-2x)
out = solve(diff(A, x), x)[1]
subs(L - 2x, x, out)
solve(L/2 - (L - 2x), x)

x, a = Sym("x", "a")
f(x) = cos(x) - sin(x)
integrate(f(x), x)

integrate(1/cos(x + a), x)
integrate(x^3 * (1-x)^4, x)
integrate(x/(x^2+1), x)

integrate(x^2, (x, 0, 1))

f(x) = 4x^3
b = Sym("b")
eq = integrate(f(x), (x,  0, b)) - 1/2 * integrate(f(x), (x, 0, 1))
xs = real_roots(eq, b)
#
ispositive(x) = x > 0
filter(ispositive, xs)

f(x) = x^2
a,b = -3, 1
tl(c) = x -> f(c) + 2*c*(x-c)
# plot([f, tl(a), tl(b)], a, b)
x, c2, c1, c0, a, b = Sym("x", "c2", "c1", "c0", "a", "b")
p = c2*x^2 + c1*x + c0

fa, fb = [replace(p, x, c) for c in [a,b]]
ma, mb = [replace(diff(p, x), x, c) for c in [a,b]]
tla = fa + ma*(x-a)
tlb = fb + mb*(x-b)
solve(tla - tlb, x)

x, theta, v0, grav =  Sym("x", "theta", "v0", "grav")
y = tan(theta) * x - (1//2)*grav*(x / (v0*cos(theta)))^2
xs = solve(y, x)
xstar = xs[2]
solve(diff(xstar, theta), theta)

x, c2, c1, c0, a, b = Sym("x", "c2", "c1", "c0", "a", "b")
p = c2*x^2 + c1*x + c0
fa, fb = [replace(p, x, c) for c in [a,b]]
ma, mb = [replace(diff(p, x), x, c) for c in [a,b]]
tla = fa + ma*(x-a)
tlb = fb + mb*(x-b)
c = solve(tla - tlb, x)[1]

area_ac = integrate(p - tla, (x, a, c))
area_cb = integrate(p - tlb, (x, c, b))
area_ac, area_cb
area_ac - area_cb
simplify(area_ac - area_cb)
simplify(area_ac + area_cb)
simplify(area_ac + area_cb) |> factor

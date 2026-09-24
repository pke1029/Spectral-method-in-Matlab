% Chebyshev differentiation of a smooth function

[D, x] = cheb(20);
u = exp(x).*sin(5*x);
subplot(2, 1, 1)
myplot(x, u)

uexact = exp(x).*(sin(5*x)+5*cos(5*x));
error = D*u - uexact;
subplot(2, 1, 2)
plot(x, error, '-o')
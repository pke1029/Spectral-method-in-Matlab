% solve linear BVP u_xx = exp(4x), u(-1)=u(1)=0

N = 16;
[D,x] = cheb(N);
D2 = D^2;
D2 = D2(2:N,2:N);   % Dirichlet BC
f = exp(4*x(2:N));
u = D2 \ f;
u = [0; u; 0];
myplot(x, u)
exact = (exp(4*x) - sinh(4)*x - cosh(4)) / 16;
title(sprintf('max err = %e', max(abs(exact - u))))
% solve BVP u_xx + 4u_x + exp(x)u = sin(8x), u(-1)=u(1)=0

N = 16;
[D,x] = cheb(N);
xx = x(2:N);
I = eye(N-1);
D1 = D(2:N,2:N);
D2 = D^2;
D2 = D2(2:N,2:N);
L = D2 + 4*D1 + I.*exp(xx);
u = L \ sin(8*xx);
u = [0; u; 0];
myplot(x, u)
% solve nonlinear BVP u_xx = exp(u), u(-1)=u(1)=0

N = 16;
[D,x] = cheb(N);
D2 = D^2;
D2 = D2(2:N,2:N);

u = zeros(N-1, 1);
residual = 1; 
iter = 0;
while residual > 1e-15
    unew = D2 \ exp(u);
    residual = norm(unew - u, inf);
    u = unew;
    iter = iter + 1;
    % fprintf('Iteration %d, Residual = %e\n', iter, residual)
end
u = [0; u; 0];
% myplot(x, u)
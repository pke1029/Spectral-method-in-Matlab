% Alternative to p14.m but with Newton iteration

N = 16;
[D,x] = cheb(N);
I = eye(N-1);
D2 = D^2;
D2 = D2(2:N,2:N);

u = zeros(N-1, 1);
residual = 1; 
iter = 0;
while residual > 1e-15
    F = D2*u - exp(u);
    J = D2 - I.*exp(u);     % J = ∇F = D2 - f'(u).*I
    unew = u - J \ F;
    residual = norm(unew - u, inf);
    u = unew;
    iter = iter + 1;
    % fprintf('Iteration %d, Residual = %e\n', iter, residual)
end
u = [0; u; 0];
% myplot(x, u)
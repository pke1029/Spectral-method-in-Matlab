% Chebyshev differentiation via FFT

Nmax = 100;
err = zeros(2, Nmax);
time = zeros(2, Nmax);

for N = 1:Nmax
    [D, x] = cheb(N);
    [u, exact] = fun4(x);
    % matrix multiplication
    tic
    err(1,N) = norm(D*u - exact, inf);
    time(1,N) = toc;
    % via fft 
    tic
    err(2,N) = norm(chebfft(u) - exact, inf);
    time(2,N) = toc;
end

subplot(2,1,1)
semilogy(err', 'o-')
ylim([1e-15, 10])

subplot(2,1,2)
semilogy(time', 'o-')

% 3rd derivative of bounded variation
function [u, exact] = fun1(x)
u = abs(x.^3);
exact = 3*x.*abs(x);
end

% smooth but not analytic
function [u, exact] = fun2(x)
u = exp(-x.^(-2));
exact = 2.*u./x.^3;
end

% analytic in a neighborhood of [-1,1]
function [u, exact] = fun3(x)
u = 1./(1+x.^2);
exact = -2*x.*u.^2;
end

% polynomial of degree 10
function [u, exact] = fun4(x)
u = x.^10;
exact = 10*x.^9;
end
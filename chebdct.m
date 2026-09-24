
function w = chebdct(v)

if nargin == 0
    test()
    return
end

N = length(v)-1; 
if N == 0
    w = 0; 
    return
end

x = cos(pi*(0:N)/N)';   % Chebyshev points 
V = [v; flip(v(2:N))];  % periodic even function in theta-space
plotThetaSpace(V)
an = real(fft(V)) / N;
reconstructQ(an, 6, V)

Vhat = real(fft(V));

end


function test()

[D,x] = cheb(32);
u = exp(x).*sin(5*x);
chebdct(u)

end

function plotThetaSpace(V)

N = length(V);
theta = linspace(0, 2*pi, N+1);
theta = theta(1:end-1);
x = cos(theta);
y = sin(theta);
plot3(x, y, V, '-o', x, y, 0*x-3, '-k')
grid on

end

% reconstruct fourier series up to order n
function reconstructQ(an, n, V)

N = length(an)/2;
theta = linspace(0, 2*pi, 2*N+1)';
Q = an(1)/2;
for i = 2:n
    Q = Q + an(i)*cos((i-1)*theta);
end
x = cos(theta);
y = sin(theta);
hold on
plot3(x, y, Q, '-o', x, y, 0*x-3, '-k')
hold off
fprintf("Error = %e", norm(Q(1:end-1)-V))

end
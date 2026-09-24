% 1D wave equation u_tt = c(x) u_xx

N = 80;
[D,x] = cheb(N);
dt = 8/N^2;
tmax = 4;

% initial conditions
c = 1;
v = exp(-200*x.^2);
vold = exp(-200*(x-dt).^2);

% leap frog scheme
for i = 1:tmax/dt
    vxx = chebfft(chebfft(v));
    vxx([1,N+1]) = 0;
    vnew = 2*v - vold + dt^2*c*vxx;
    vold = v;
    v = vnew;

    if mod(i, 100) == 0
        myplot(x, vnew, 201)
        title(sprintf("Time = %.4f", dt * i))
        ylim([-1,1])
        drawnow
    end
end

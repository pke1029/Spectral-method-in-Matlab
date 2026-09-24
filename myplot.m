% plot interpolated function from chebyshev points
function myplot(x, u, N)

if nargin < 3
    N = 101;
end

xx = linspace(x(1), x(end), N);
uu = interp1(x, u, xx, 'spline');
hline = plot(xx, uu, '-');
hold on
plot(x, u, 'o', 'Color', hline.Color)
hold off

end
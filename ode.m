function [t, y] = ode(fun, tspan, h, x0)
    dim = length(x0);
    t = tspan(1) : h : tspan(2);
    y = zeros(dim, length(t));
    y(:, 1) = x0;
    for i = 2:length(t)
       y(:, i) = RK4(fun, y(:, i - 1), h, t(i)); 
    end
end
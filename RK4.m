function Yn = RK4(fun, Y, h, t)
    K1 = fun(t, Y);
    K2 = fun(t, Y + (h / 2) .* K1);
    K3 = fun(t, Y + (h / 2) .* K2);
    K4 = fun(t, Y + h .* K3);
    Yn = Y + (h/6) * (K1 + 2 * K2 + 2 * K3 + K4); 
end
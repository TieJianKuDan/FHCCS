function C = scramble(P, S, layer)
    [m, n] = size(P);
    if (length(S) ~= layer || m ~= n)
        error('÷√¬“ ß∞‹')
    end
    part = sqrt(layer);
    l = m/part;
    C = zeros(layer, l, l, 'uint8');
    for i = 1:layer
        row = ceil(S(i)/part);
        col = mod(S(i)-1, part) + 1;
        C(i, :, :) = P((row - 1)*l + 1:row*l, (col - 1)*l + 1:col*l);
    end
    for i = 1:log2(layer)
        if (mod(i, 2) ~= 0)
            C = merge(C, 'x');
        else
            C = merge(C, 'y');
        end
    end
    C = reshape(C, [m, n]);
end
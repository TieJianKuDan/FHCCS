function P = i_merge(C, dir, layer_m)
    [layer, m, n] = size(C);
    if (layer == layer_m)
        P = C;
    elseif (dir == 'x')
        if (mod(n, 2) ~= 0)
            error('Inverse fusion failure');
        end
        P = zeros(layer*2, m, n/2, 'uint8');
        for i = 1:layer
            temp = reshape(C(i, :, :), [m, n])';
            temp = reshape(temp, [1, m*n]);
            P(2*i - 1, :, :) = reshape(temp(1:2:end), [n/2, m])';
            P(2*i, :, :) = reshape(temp(2:2:end), [n/2, m])';
        end
    elseif (dir == 'y')
        if (mod(m, 2) ~= 0)
            error('Inverse fusion failure');
        end
        P = zeros(layer*2, m/2, n, 'uint8');
        for i = 1:layer
            temp = reshape(C(i, :, :), [m, n]);
            temp = reshape(temp, [1, m*n]);
            P(2*i - 1, :, :) = reshape(temp(1:2:end), [m/2, n]);
            P(2*i, :, :) = reshape(temp(2:2:end), [m/2, n]);
        end
    end
end
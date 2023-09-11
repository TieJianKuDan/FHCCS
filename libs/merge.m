function C = merge(P, dir)
    [layer, m, n] = size(P);
    if (layer == 1)
        C = P;
    elseif (mod(layer, 2) ~= 0)
        error('Fusion failure');
    elseif (dir == 'x')
        C = zeros(layer/2, m, n*2, 'uint8');
        temp = zeros(1, m*n*2, 'uint8');
        for i = 1:layer/2
            temp(1:2:end) = reshape(reshape(P(2*i-1, :, :), [m, n])', [1, m*n]);
            temp(2:2:end) = reshape(reshape(P(2*i, :, :), [m, n])', [1, m*n]);
            C(i, :, :) = reshape(temp, [n*2, m])';
        end
    elseif (dir == 'y')
        C = zeros(layer/2, m*2, n, 'uint8');
        temp = zeros(1, m*n*2);
        for i = 1:layer/2
            temp(1:2:end) = reshape(P(2*i-1, :, :), [1, m*n]);
            temp(2:2:end) = reshape(P(2*i, :, :), [1, m*n]);
            C(i, :, :) = reshape(temp, [m*2, n]);
        end
    end
end
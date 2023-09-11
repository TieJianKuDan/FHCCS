function P = i_scramble(C, S, layer)
    [m, n] = size(C);
    if (length(S) ~= layer)
        error('Reverse scrambling failed')
    end
    P = reshape(C, [1, m, n]);
    for i = log2(layer):-1:1
        if (mod(i, 2) ~= 0)
            P = i_merge(P, 'x', layer);
        else
            P = i_merge(P, 'y', layer);
        end
    end
    part = sqrt(layer);
    P_ = C;
    [~, m, n] = size(P);
    for i = 1:layer
        row = ceil(S(i)/part);
        col = mod(S(i)-1, part) + 1;
        P_((row - 1)*m + 1:row*m, (col - 1)*n + 1:col*n) = P(i, :, :);
    end
    P = P_;
end
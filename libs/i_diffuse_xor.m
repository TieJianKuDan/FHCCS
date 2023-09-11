function P = i_diffuse_xor(C, S)
    [m, n] = size(C);
    % Backward diffusion
    P = C; 
    for i = 1:n-1
        P(:, i) = bitxor(bitxor(C(:, i+1), S(i, 4)), C(:, i));
    end
    P(:, n) = bitxor(C(:, n), S(n, 4));
    C = P;
    for i = 1:m-1
        P(i, :) = bitxor(bitxor(C(i+1, :), S(i, 3)), C(i, :));
    end
    P(m, :) = bitxor(C(m, :), S(m, 3));
    % Forward diffusion
    C = P;
    for i = n:-1:2
        P(:, i) = bitxor(bitxor(C(:, i-1), S(i, 2)), C(:, i));
    end
    P(:, 1) = bitxor(C(:, 1), S(1, 2));
    C = P;
    for i = m:-1:2
        P(i, :) = bitxor(bitxor(C(i-1, :), S(i, 1)), C(i, :));
    end
    P(1, :) = bitxor(C(1, :), S(1, 1));
end
%% Multiplicative diffusion
function C = diffuse_mult(P, S, tbl)
    P = double(P);
    S = double(S);
    C = P;
    [m, n] = size(C);

    % Forward diffusion
    for i = 1:n
        C(1, i) = LookUpGF257(P(1, i), S(1, 1), 1, tbl);
    end
    for i = 2:m
        for j = 1:n
            C(i, j) = LookUpGF257(C(i-1, j), S(i, 1), P(i, j), tbl);
        end 
    end
    P = C;
    for i = 1:m
        C(i, 1) = LookUpGF257(P(i, 1), S(1, 2), 1, tbl);
    end
    for i = 2:n
        for j = 1:m
            C(j, i) = LookUpGF257(C(j, i-1), S(i, 2), P(j, i), tbl);
        end
    end
    
    % Backward diffusion
    P = C;
    for i = 1:n
        C(m, i) = LookUpGF257(P(m, i), S(m, 3), 1, tbl);
    end
    for i = m-1:-1:1
        for j = 1:n
            C(i, j) = LookUpGF257(C(i+1, j), S(i, 3), P(i, j), tbl);            
        end
    end
    P = C;
    for i = 1:m
        C(i, n) = LookUpGF257(P(i, n), S(n, 4), 1, tbl);
    end
    for i = n-1:-1:1
        for j = 1:m
            C(j, i) = LookUpGF257(C(j, i+1), S(i, 4), P(j, i), tbl);
        end
    end
    
    C = uint8(C);
end
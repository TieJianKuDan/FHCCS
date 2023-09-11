function P = i_diffuse_mult(C, S, tb1, tb2)
    [m, n] = size(C);
    C = double(C);
    S = double(S);
    
    % Backward diffusion
    P = C; 
    for i = 1:n-1
        for j = 1:m
            P(j, i) = LookUpGF257Ex2(C(j, i), C(j, i+1), S(i, 4), tb1, tb2);
        end
    end
    for i = 1:m
        P(i, n) = LookUpGF257Ex2(C(i, n), S(n, 4), 1, tb1, tb2);
    end
    C = P;
    for i = 1:m-1
        for j = 1:n
            P(i, j) = LookUpGF257Ex2(C(i, j), C(i+1, j), S(i, 3), tb1, tb2);
        end
    end
    for i = 1:n
        P(m, i) = LookUpGF257Ex2(C(m, i), S(m, 3), 1, tb1, tb2);
    end
    
    % Forward diffusion
    C = P;
    for i = n:-1:2
        for j = 1:m
            P(j, i) = LookUpGF257Ex2(C(j, i), C(j, i-1), S(i, 2), tb1, tb2);
        end
    end
    for i = 1:m
        P(i, 1) = LookUpGF257Ex2(C(i, 1), S(1, 2), 1, tb1, tb2);
    end 
    C = P;
    for i = m:-1:2
        for j = 1:n
            P(i, j) = LookUpGF257Ex2(C(i, j), C(i-1, j), S(i, 1), tb1, tb2);          
        end
    end
    for i = 1:n
        P(1, i) = LookUpGF257Ex2(C(1, i), S(1, 1), 1, tb1, tb2);
    end
    
    P = uint8(P);
end
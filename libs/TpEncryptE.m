function [C, K1, K2] = TpEncryptE(P, K_1, K_2)
    K_1 = uint64(K_1);
    K_2 = uint64(K_2);
    [m, n] = size(P);
    layer = 1024;
    part = sqrt(layer);
    l = ceil(max(m, n)/part);
    temp = zeros(l*part, l*part, 'uint8');
    temp(1:m, 1:n) = P;
    P = temp;
    
    K1 = key_gen(K_1, P);
    K2 = key_gen(K_2, P); 
    
    num_scram = 1;
    S = Random_Seq(K1, layer*num_scram*5, layer-1);
    S = reshape(S, [], num_scram);
    S = S + 1;
    for i = 1:num_scram
        [~, idx] = unique(S(:, i));
        temp = S(sort(idx), i);
        S = S(1:layer);
        S(1:length(temp), i) = temp;
        S(length(temp)+1:end, i) = setdiff(1:layer, temp);
    end

    num_diff = 2;
    D = Random_Seq(K2, l*part*4*num_diff, 255);
    D = reshape(D, [l*part, 4, num_diff]);
    
    tbl = GF257Table();

    C = diffuse_mult(P, reshape(D(:, :, 1), [l*part, 4]), tbl);
    C = scramble(C, S(:, 1), layer);
    C = diffuse_mult(C, reshape(D(:, :, 2), [l*part, 4]), tbl);
end
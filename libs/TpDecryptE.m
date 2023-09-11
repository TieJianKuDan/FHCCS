function P = TpDecryptE(C, K1, K2)
    [m, n] = size(C);
    layer = 1024;
    part = sqrt(layer);
    l = ceil(max(m, n)/part);
    
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

    [tb1, tb2] = GF257TableEx();
    
    P = i_diffuse_mult(C, reshape(D(:, :, 2), [l*part, 4]), tb1, tb2);
    P = i_scramble(P, S(:, 1), layer);
    P = i_diffuse_mult(P, reshape(D(:, :, 1), [l*part, 4]), tb1, tb2);
end
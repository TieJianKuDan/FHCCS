function K = key_gen(K_, P)
    if (length(K_) ~= 8)
        disp("Key generation failure");
    end
    digest_32 = DataHash(P, 'SHA-256', 'uint8');
    digest_32 = uint64(digest_32);
    digest_8 = zeros(1, 8, 'uint64');
    for i = 1:8
        for j = 1:4
            digest_8(i) = digest_8(i) + bitshift(digest_32(j + (i-1)*4), 8*(j-1));
        end
    end
    K = K_;
    for i = 1:8
       K(i) = K_(i) * digest_8(i);
       for j = 1:25 %500
           K(i) = dspacem(K(i));
       end
    end
    K = double(K);
    K(1) = 1 + K(1)/(2^64);
    K(2) = 1 + 5*K(2)/(2^64);
    K(3) = 1 + 5*K(3)/(2^64);
    K(4) = 1 + 5*K(4)/(2^64);
    K(5) = 1 + K(5)/(2^64);
    K(6) = 10 + 50*K(6)/(2^64);
    K(7) = 10 + 50*K(7)/(2^64);
    K(8) = 10 + 50*K(8)/(2^64);
end
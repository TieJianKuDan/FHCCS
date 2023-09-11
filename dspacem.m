function dx = dspacem(x)
    z = (bitshift(x, -32) + 1)*(mod(x, 2^32) + 1) + 1;
    dx = bitor(bitshift(z, (mod(z, 64))), bitshift(z, -(64 - int64(mod(z, 64)))));
end
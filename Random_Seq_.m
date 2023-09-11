function S = Random_Seq_(key, l, limit)
    len = ceil(l/5);
    interval = 1;
    [~, X] = ode(@FHCCS, [0 ceil(((len-1)*interval+1))*0.001], 0.001, key'); X = X';
    X = X(1:interval:end, :);
    X = reshape(X, 1, []);
    if (limit == 255)
        m = 257;
    else
        m = max(primes(limit + 8));
    end
    S = floor(mod(X.*655359983, m));
    id = S <= limit;
    S = S(id);
end
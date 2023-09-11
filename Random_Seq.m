function S = Random_Seq(key, l, limit)
    global a b c;
    a = key(6);
    b = key(7);
    c = key(8);
    key = key(1:5);
    s1 = Random_Seq_(key, l, limit);
    S = zeros(1,l);
    if (length(s1) >= l)
        S = s1(1:l);
    else
        S(1:length(s1)) = s1;
        s2 = Random_Seq_(key, (l - length(s1))*5, limit);
        S(length(s1) + 1:end) = s2(1:l - length(s1));
    end
end
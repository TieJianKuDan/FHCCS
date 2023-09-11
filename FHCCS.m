function dX = FHCCS(~, X)
    x = X(1); y = X(2); z = X(3); w = X(4); u = X(5);
    global a b c;
    
    J = [        0,    0,  0,   0, a*sin(pi*y)
                 0,    0,  0, b*x,           0
                 0,    0,  0,   c,           0
                 0, -b*x, -c,   0,           0
      -a*sin(pi*y),    0,  0,   0,           0];

    dX = J*[x;y;z;w;u];
end
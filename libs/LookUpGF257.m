function y = LookUpGF257(x0,x1,x2,TBL)
y = TBL(TBL(x0 + 2,x1 + 2) + 1,x2 + 2) - 1;
end

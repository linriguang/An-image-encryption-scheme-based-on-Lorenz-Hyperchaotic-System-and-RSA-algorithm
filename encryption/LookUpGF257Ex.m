% ����3-22 ����GF(257)��ĳ������㺯�� x0 / x1 / x2
function y = LookUpGF257Ex(x0,x1,x2,TBL)
t = TBL(x1 + 2,x2 + 2) + 1;
y = find(TBL(t,:) == (x0+1)) -2;
end
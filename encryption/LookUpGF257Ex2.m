% 基于GF(257)域的除法运算函数 x0 / x1 / x2 
% 需要构建除法表
function y = LookUpGF257Ex2(x0,x1,x2,TBL1,TBL2)
t = TBL1(x1 + 2,x2 + 2) + 1;
y = TBL2(x0 + 2,t) -1;
end
%GF（257）域的乘法和除法运算表  
function [T1,T2] = GF257TableEx()
T1 = mod(transpose(0:256)*(0:256),257);%乘法运算表
T2 = zeros(257,257);%除法运算表
T2(:,1) = transpose(0:256);
for j = 1:256
    for k = 1:256
        T2(mod(j * k,257) + 1,j + 1) = k;
    end
end
end

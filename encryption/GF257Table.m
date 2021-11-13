%GF（257）域的乘法运算表  程序 3-18
function T = GF257Table()
T = mod(transpose(0:256)*(0:256),257);
end


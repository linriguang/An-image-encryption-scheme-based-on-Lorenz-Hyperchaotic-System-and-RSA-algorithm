% 典型混沌数字图像密码系统解密函数TpDecrypt
% 置乱算法采用将二维图像展开成一维向量后的无重复置乱算法
% 扩散算法采用基于GF（257）域乘法运算的扩散算法
% 输入密文图像C和秘钥K（向量形式）,输出解密后的图像P
function P = TpDecrypt(C,K)
[M,N] = size(C);C = double(C);n = 3 * M * N;s = zeros(1,n);%混沌序列，伪随机数组，为浮点数
h = 0.002; %步长
t = 800; %过渡态的点数
a = 10;b = 8/3; c = 28; r = -1;%超混沌Lorenz系统的参数
x0 = K(1); y0 = K(2); z0 = K(3); w0 = K(4);%初始值
%超混沌Lorenz系统，生成伪随机数
for i = 1:n + t
    K11 = a * (y0 - x0) + w0;
    K12 = a * (y0 - (x0 + K11 * h/2)) + w0;
    K13 = a * (y0 - (x0 + K12 * h/2)) + w0;
    K14 = a * (y0 - (x0 + K13 * h)) + w0;
    x1 = x0 + (K11 + 2 * K12 + 2 * K13 +K14) * h/6;
    
    K21 = c * x1 - y0 - x1 * z0;
    K22 = c * x1 - (y0 + K21 * h/2) - x1 * z0;
    K23 = c * x1 - (y0 + K22 * h/2) - x1 * z0;
    K24 = c * x1 - (y0 +K23 * h) - x1 * z0;
    y1 = y0 + (K21 + 2 * K22 + 2 * K23 + K24) * h/6;
    
    K31 = x1 * y1 - b * z0;
    K32 = x1 * y1 - b * (z0 + K31 * h/2);
    K33 = x1 * y1 - b * (z0 + K32 * h/2);
    K34 = x1 * y1 - b * (z0 + K33 * h);
    z1 = z0 + (K31 + 2 * K32 + 2 * K33 +K34) * h/6;
    
    K41 = -y1 * z1 + r * w0;
    K42 = -y1 * z1 + r * (w0 + K41 * h/2);
    K43 = -y1 * z1 + r * (w0 + K42 * h/2);
    K44 = -y1 * z1 + r * (w0 + K43 * h);
    w1 = w0 + (K41 + 2 * K42 + 2 * K43 + K44) * h/6;
    
    x0 = x1;%迭代
    y0 = y1;
    z0 = z1;
    w0 = w1;
    
    if i > t
        s(i - t) = x1;
        if mod((i - t),3000) == 0%每3000次迭代后对混沌状态x0进行小的扰动
            x0 = x0 + h * sin(y0);
        end
    end
end
%Smod1和Smod2保存正向算法与逆向算法的伪随机数向量，此混沌序列用于加取模扩散算法中
Smod = mod(floor(s * pow2(16)),256);
Smod1 = Smod(1:M * N);Smod2 = Smod(M * N + 1:2 * M * N);Bmod = zeros(M,N);Cmod = zeros(M,N);

 % 行和列一起置乱
% 得到置乱用的伪随机序列 保存在X中
X = mod(floor((s(1:M * N) + 100) * 10 ^ 10),M * N) + 1;
[~, idx] = unique(X);L = length(idx);X1 =zeros(1,M * N);
X1(1:length(idx)) = X(sort(idx));
X1(length(idx) + 1:M * N) = setdiff(1:M*N,X1);X = X1;%不重复

%生成扩散用的伪随机序列，保存在S1和S2中
%构建乘法运算表TBL1和除法运算表TBL2
[TBL1,TBL2] = GF257TableEx();
S = mod(floor(s(M * N + 1:3 * M * N) * pow2(16)),256);
S1 = S(1:M * N);S2 = S(M * N + 1:2 * M * N);

%解密是逆过程
A = C(:);D = zeros(1,M * N);E = zeros(1,M * N);

% 扩散算法采用基于GF（257）域乘法和除法运算的扩散算法
A0 = 0;D(M * N) = LookUpGF257Ex2(A(M * N),A0,S2(M * N),TBL1,TBL2);
for i = M * N - 1:-1:1
    D(i) = LookUpGF257Ex2(A(i),A(i + 1),S2(i),TBL1,TBL2);
end

E0 = 0;E(1) = LookUpGF257Ex2(D(1),E0,S1(1),TBL1,TBL2);
for i = 2:M * N
    E(i) = LookUpGF257Ex2(D(i),D(i - 1),S1(i),TBL1,TBL2);
end

% 置乱算法采用将二维图像展开成一维向量后的无重复置乱算法
for i = 1:floor(M * N/2)
    t = E(X(i));
    E(X(i)) = E(X(M * N - i + 1));
    E(X(M * N - i + 1)) = t;
end

%循环第二次加取模逆向扩散算法
Cmod1 = E;Dmod1 = zeros(M,N);Emod1 = zeros(M,N);
Dmod01 = 0;Dmod1(M * N) = mod(256 * 2 + Cmod1(M * N) - Dmod01 - Smod2(M * N),256);
for i = M * N - 1:-1:1
    Dmod1(i) = mod(256 * 2 + Cmod1(i) - Cmod1(i + 1) - Smod2(i),256);
end

Emod01 = 0;Emod1(1) = mod(256 * 2 + Dmod1(1) - Emod01 -Smod1(1),256);
for i = 2:M * N
    Emod1(i) = mod(256 * 2 + Dmod1(i) - Dmod1(i -1) - Smod1(i),256);
end

%加取模扩散算法实现
Cmod = Emod1;Dmod = zeros(M,N);Emod = zeros(M,N);
Dmod0 = 0;Dmod(M * N) = mod(256 * 2 + Cmod(M * N) - Dmod0 - Smod2(M * N),256);
for i = M * N - 1:-1:1
    Dmod(i) = mod(256 * 2 + Cmod(i) - Cmod(i + 1) - Smod2(i),256);
end

Emod0 = 0;Emod(1) = mod(256 * 2 + Dmod(1) - Emod0 -Smod1(1),256);
for i = 2:M * N
    Emod(i) = mod(256 * 2 + Dmod(i) - Dmod(i -1) - Smod1(i),256);
end

%将扩散置乱后的一维数据图像矩阵转换为二维矩阵形式
P = reshape(Emod,M,N);P = uint8(P);
end






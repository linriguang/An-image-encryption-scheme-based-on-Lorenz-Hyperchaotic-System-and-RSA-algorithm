% ���ͻ�������ͼ������ϵͳ���ܺ���TpEncrypt
% �����㷨���ý���άͼ��չ����һά����������ظ������㷨
% ��ɢ�㷨���û���GF��257����˷��������ɢ�㷨
% ��������ͼ�� P����ԿK��������ʽ�����������ͼ��C
function C = TpEncrypt(P,K)
[M,N] = size(P);P = double(P);n = 3 * M * N;s = zeros(1,n);%�������У�α������飬Ϊ������
h = 0.002; %����
t = 800; %����̬�ĵ���
a = 10;b = 8/3; c = 28; r = -1;%������Lorenzϵͳ�Ĳ���
x0 = K(1); y0 = K(2); z0 = K(3); w0 = K(4);%��ʼֵ
%������Lorenzϵͳ������α�����
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
    
    x0 = x1;%����
    y0 = y1;
    z0 = z1;
    w0 = w1;
    
    if i > t
        s(i - t) = x1;
        if mod((i - t),3000) == 0%ÿ3000�ε�����Ի���״̬x0����С���Ŷ�
            x0 = x0 + h * sin(y0);
        end
    end
end
%Smod1��Smod2���������㷨�������㷨��α������������˻����������ڼ�ȡģ��ɢ�㷨��
Smod = mod(floor(s * pow2(16)),256);
Smod1 = Smod(1:M * N);Smod2 = Smod(M * N + 1:2 * M * N);Bmod = zeros(M,N);Cmod = zeros(M,N);

% �к���һ������
% �õ������õ�α������� ������X��
X = mod(floor((s(1:M * N) + 100) * 10 ^ 10),M * N) + 1;
[~, idx] = unique(X);L = length(idx);X1 =zeros(1,M * N);
X1(1:length(idx)) = X(sort(idx));
X1(length(idx) + 1:M * N) = setdiff(1:M*N,X1);X = X1;%���ظ�

%������ɢ�õ�α������У�������S1��S2��
%�����˷������
TBL = GF257Table();
S = mod(floor(s(M * N + 1:3 * M * N) * pow2(16)),256);
S1 = S(1:M * N);S2 = S(M * N + 1:2 * M * N);B = zeros(M,N);C = zeros(M,N);

%��ȡģ��ɢ�㷨ʵ��
Amod = P(:);Bmod0 = 0;Bmod(1) = mod(Bmod0 + Smod1(1) + Amod(1),256);
for i = 2:M * N
    Bmod(i) = mod(Bmod(i - 1) + Smod1(i) + Amod(i),256);
end

Cmod0 = 0;Cmod(M * N) = mod(Cmod0 + Smod2(M * N) + Bmod(M * N),256);
for i = M * N - 1:-1:1
    Cmod(i) = mod(Cmod(i + 1) + Smod2(i) + Bmod(i),256);
end

%ѭ���ڶ��μ�ȡģ��ɢ�㷨
Amod1 = Cmod;Bmod1 = zeros(M,N);Cmod1 = zeros(M,N);
Bmod01 = 0;Bmod1(1) = mod(Bmod01 + Smod1(1) + Amod1(1),256);
for i = 2:M * N
    Bmod1(i) = mod(Bmod1(i - 1) + Smod1(i) + Amod1(i),256);
end

Cmod01 = 0;Cmod1(M * N) = mod(Cmod01 + Smod2(M * N) + Bmod1(M * N),256);
for i = M * N - 1:-1:1
    Cmod1(i) = mod(Cmod1(i + 1) + Smod2(i) + Bmod1(i),256);
end

% �����㷨���ý���άͼ��չ����һά����������ظ������㷨
A = Cmod1;
for i = 1:floor(M * N/2)
    t = A(X(i));
    A(X(i)) = A(X(M * N - i + 1));
    A(X(M * N - i + 1)) = t;
end

% ��ɢ�㷨���û���GF��257����˷��ͳ����������ɢ�㷨
B0 = 0;B(1) = LookUpGF257(B0,S1(1),A(1),TBL);%LookUpGF17Ϊ�˷�����
for i = 2:M * N
    B(i) = LookUpGF257(B(i -1),S1(i),A(i),TBL);
end

C0 = 0;C(M * N) = LookUpGF257(C0,S2(M * N),B(M * N),TBL);
for i = M * N - 1:-1:1
    C(i) = LookUpGF257(C(i + 1),S2(i),B(i),TBL);
end
C = reshape(C,M,N);C = uint8(C);
end






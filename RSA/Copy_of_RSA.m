% RSA加密和解密算法
clear;clc%清除运行空间
disp('RSA algorithm');
p = 3259;%大素数 最大的数是10000
fprintf('\np=%d',p);
q = 3821;%大素数
fprintf('\nq=%d',q);
n=p*q; %模数n
fprintf('\nn=%d',n);
phi=(p-1)*(q-1);%欧拉函数
fprintf('\nphi(%d) is %d',n,phi);
e = 1288367;
d = 3385223;

% %为了找到公钥e
% while(cd~=1||val==0)
%     n1=randi(n,1,1);%生成随机数
%     e=randi([2 n1],1,1);
%     val=isprime(e);%确定哪些数组元素为质数
%     cd=gcd(e,phi);%G = gcd(A,B) 返回 A 和 B 的元素的最大公约数
% end
% 
% %vall 是否为1 d*e=1mod(phi(n)) d 为私钥
% val1=0;
% d=0;
% while(val1~=1)
% d=d+1;
% val1=mod(d*e,phi);
% end
fprintf('\nd=%d',d);
fprintf('\nPublic key is (%d,%d)',e,n);
fprintf('\nPrivate key is (%d,%d)',d,n);
m = [178333,38628,92873897,829809];
%m = [59806503,2349576,60074184,7488026];
m1=m;
fprintf('\n');
disp('输入的明文大数M为： ');
disp(m1);
over=length(m1);%长度
o=1;
while(o<=over)
    m=m1(o);%文本字符串的数值
    diff=0;
    if(m>n)
        diff=m-n+1;
    end
    m=m-diff;
      
qm=dec2bin(e);
len=length(qm);
c=1;
xz=1;

while(xz<=len)  
    if(qm(xz)=='1')
      c=mod(mod((c^2),n)*m,n);
    elseif(qm(xz)=='0')
        c=(mod(c^2,n));
    end
    xz=xz+1;
end
c1(o)=c;

qm1=dec2bin(d);
len1=length(qm1);
nm=1;
xy=1;

while(xy<=len1)    
    if(qm1(xy)=='1')
       nm=mod(mod((nm^2),n)*c,n);
    elseif(qm1(xy)=='0')
        nm=(mod(nm^2,n));
    end
     xy=xy+1;    
end

nm=nm+diff;
nm1(o)=char(nm);
o=o+1;
end

 
 
o=1;
fprintf('\n密文C为：\n');
while(o<=over)
   fprintf('\t%d',c1(o)); 
   o=o+1;
end
% o=1;
% fprintf('\n明文M为： \n');
% while(o<=over)
% fprintf('\t%d',nm1(o));
% o=o+1;
% end

%fprintf('\nThe decrypted message is: ');
%disp(nm1);

fprintf('\n');

Initial_value = sqrt(log(m1+c1))
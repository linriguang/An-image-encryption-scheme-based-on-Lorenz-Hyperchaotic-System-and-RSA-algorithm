clear;clc%������пռ�
disp('RSA algorithm');
p=input('Enter the prime no. for p: ');%������
q=input('Enter the prime no. for q: ');%������
n=p*q; %ģ��n
fprintf('\nn=%d',n);
phi=(p-1)*(q-1);%ŷ������
fprintf('\nphi(%d) is %d',n,phi);
val=0;%�߼�����
cd=0;%���Լ������ֵΪ0

%Ϊ���ҵ���Կe
while(cd~=1||val==0)
    n1=randi(n,1,1);%���������
    e=randi([2 n1],1,1);
    val=isprime(e);%ȷ����Щ����Ԫ��Ϊ����
    cd=gcd(e,phi);%G = gcd(A,B) ���� A �� B ��Ԫ�ص����Լ��
end

%vall �Ƿ�Ϊ1 d*e=1mod(phi(n))
%d Ϊ˽Կ
val1=0;
d=0;
while(val1~=1)
d=d+1;
val1=mod(d*e,phi);
end
fprintf('\nd=%d',d);
fprintf('\nPublic key is (%d,%d)',e,n);
fprintf('\nPrivate key is (%d,%d)',d,n);
m=input('\nEnter the message: ','s');
m1=m-0;
disp('ASCII equivalent of message ');
disp(m1);
over=length(m1);%����
o=1;
while(o<=over)
    m=m1(o);%�ı��ַ�������ֵ
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
fprintf('\nThe encrypted message is \n');
while(o<=over)
   fprintf('\t%d',c1(o)); 
   o=o+1;
end
o=1;
fprintf('\nThe decrypted mes in ASCII is \n');
while(o<=over)
fprintf('\t%d',nm1(o));
o=o+1;
end

fprintf('\nThe decrypted message is: ');
disp(nm1);

fprintf('\n');
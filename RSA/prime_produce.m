% 随机产生两个大素数
function num = prime_produce(n)

num = 0;
val = 0;
while(val == 0)
    prime1 = randi([1000 n],1,1);
    val=isprime(prime1);%确定哪些数组元素为质数
end
num = prime1;
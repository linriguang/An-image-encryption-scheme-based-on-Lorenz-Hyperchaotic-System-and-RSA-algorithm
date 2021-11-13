% 计算任一给定图像与随机图像间的BACI值
function e_baci = BACIExpect(A)
A = double(A);[M,N] = size(A);
m = 0;
for i = 1:M - 1
    for j = 1:N - 1
        d = A(i:i+1,j:j+1);
        b = zeros(1,6);
        for s1 = 0:255
            for s2 = 0:255
                b(1) = b(1) + abs(abs(d(1,1) - s1) - abs(d(1,2) - s2));
                b(2) = b(2) + abs(abs(d(1,1) - s1) - abs(d(2,1) - s2));
                b(3) = b(3) + abs(abs(d(1,1) - s1) - abs(d(2,2) - s2));
                b(4) = b(4) + abs(abs(d(1,2) - s1) - abs(d(2,1) - s2));
                b(5) = b(5) + abs(abs(d(1,2) - s1) - abs(d(2,2) - s2));
                b(6) = b(6) + abs(abs(d(2,1) - s1) - abs(d(2,2) - s2));
            end
        end
        b = b/(256 ^ 2);
        m = m + sum(b)/6
    end
end
m = m/((M - 1) * (N -1))/255;
fprintf('BACI = %10.4f% %\n',m * 100);e_baci = m;
end

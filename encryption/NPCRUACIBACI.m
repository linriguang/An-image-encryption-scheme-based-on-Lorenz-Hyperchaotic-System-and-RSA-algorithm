% ����4-20 �Զ��庯��NPCPUACIBACI
function nu = NPCRUACIBACI(P1,P2)
nu = zeros(1,3);
P1 = double(P1);P2 = double(P2);[M,N] = size(P1);
D = (P1 ~= P2);nu(1) = sum(sum(D))/(M * N) * 100; % fprintf('NPCR = %8.4f% %.  \n',nu(1));
nu(2) = sum(sum(abs(P1 - P2)))/(255 * M * N) * 100;% fprintf('UACI = %8.4f% % . \n',nu(2));

D = abs(P1 - P2);m = 0;
for i = 1:M - 1
    for j = 1:N - 1
        d = D(i:i+1,j:j+1);
        m = m + (abs(d(1,1)-d(1,2))+abs(d(1,1)-d(2,1))+abs(d(1,1)-d(2,2))+abs(d(1,2)-d(2,1))+abs(d(1,2)-d(2,2))+abs(d(2,1)-d(2,2)))/6/255;
    end
end
nu(3) = m/((M - 1) * (N - 1)) * 100;% fprintf('BACI = %8.4f% % . \n',nu(3));
end

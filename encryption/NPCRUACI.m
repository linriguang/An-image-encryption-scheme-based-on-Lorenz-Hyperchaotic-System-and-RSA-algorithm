function nu = NPCRUACI(P1,P2)
nu = zeros(1,2);
P1 = double(P1);P2 = double(P2);[M,N] = size(P1);
D = (P1~=P2);nu(1) = sum(sum(D))/(M * N) * 100;
fprintf('NPCR = %8.4f% %.   ',nu(1));
nu(2) = sum(sum(abs(P1 - P2)))/(255 * M *N) * 100;
fprintf('UACI = %8.4f% % . \n',nu(2));
end

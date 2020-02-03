%Y=[1,3,4,5,5,6,6,3,2,6];    %观测结果



% PI=[1,0]; %初始状态概率
% A=[0.8,0.2;
%     0.3,0.7];%转移状态矩阵
% B=[1/6,1/6,1/6,1/6,1/6,1/6;
%     0.1, 0.1, 0.1, 0.1, 0.3, 0.3];%发射概率矩阵


%[X1, gamma] = Decode_pointOptimal(Y,PI,A,B);
t0 = 50000;

er = zeros(t0,1);
for tseq = 1:500:t0
    T=tseq;
    ex
    [X2, pstar] = Decode_pathOptimal(Y,PI,A,B);
    er(tseq) = sum(abs(X2-X)) / T;
end
plot(er,'*');


function [res,beta] = Identify_Backward(Y,PI,A,B)
%识别，后向算法
%input: 观测序列，初始马氏链，转移概率矩阵，发射概率矩阵
%output: Pr(Y|lamda), 后传概率矩阵


%参数
N = size(B,1);
T = length(Y);
beta=zeros(T, N);

for i=1:N
    beta(T,i) = 1;    %初始化
end

for t=T-1:-1:1
    for i=1:N
        temp=0;
        for j = 1:N
            temp =temp + beta(t+1,j)*A(i,j)*B(j,Y(t+1));
        end
        beta(t, i)=temp;
    end
end

res=0;
for i=1:N
    res=res+beta(1,i)*PI(i)*B(i,Y(1));
end

end


function [res,alpha] = Identify_Forward(Y,PI,A,B)
%识别，前向算法
%input: 观测序列，初始马氏链，转移概率矩阵，发射概率矩阵
%output: Pr(Y|lamda), 前传概率矩阵

%参数
N = size(B,1);
T = length(Y);
alpha=zeros(T, N);

for i=1:N
    alpha(1,i) = PI(i) * B(i, Y(1));    %初始化
end

for t=1:T-1
    for i=1:N
        temp=0;
        for j = 1:N
            temp =temp + alpha(t,j)*A(j,i)*B(i,Y(t+1));
        end
        alpha(t+1, i)=temp;
    end
end

res = sum(alpha(T, : ));
end





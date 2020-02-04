function [rePI,reA,reB] = Learning_BW(Y,PI0,A0,B0)
%学习问题，Baum-Welch公式
%input: 观测序列Y，初概率估计，转移概率估计，发射概率估计
%output：初概率重估计，转移概率重估计，发射概率重估计
T = length(Y);
N = size(B0,1);
M= size(B0,2);

[~,beta] = Identify_Backward(Y,PI0,A0,B0);
[res, alpha] = Identify_Forward(Y,PI0,A0,B0);

gamma = zeros(T, N);
for t = 1:T
    lower = sum( alpha(t, : ) .* beta(t, : ) );
    for i = 1:N
        upper = alpha(t,i) * beta(t,i);
        gamma(t,i) = upper/lower;
    end
end

xi = zeros(T-1, N, N);
for t=1:T-1
    lower = 0;
    for s=1:N
        for r=1:N
            lower = lower+alpha(t,r)*A0(r,s)*B0(s,Y(t+1))*beta(t+1,s);
        end
    end     %计算分母               %TODO不收敛，这步公式可能不太对

%     lower = sum( alpha(t, : ) .* beta(t, :) );
    
%     lower=res;
    
    for i=1:N
        for j=1:N
            upper=alpha(t,i)*A0(i,j)*B0(j,Y(t+1))*beta(t+1,j);
            xi(t,i,j)=upper/lower;
        end
    end 
end

%重估计
rePI = gamma(1, :);

reA = zeros(size(A0));
for i=1:N
    lower = sum(gamma(1:T-1, i));
    for j = 1:N
        upper = sum(xi(1:T-1, i, j));
        reA(i,j) = upper/lower;
    end
end

reB = zeros(size(B0));
for i=1:N
    lower=sum( gamma(:, i) );
    for j = 1:M
        upper=0;
        for t=1:T
            if Y(t)==j
                upper=upper + gamma(t,i);
            end
        end
        reB(i,j) = upper/lower;
    end
end

end


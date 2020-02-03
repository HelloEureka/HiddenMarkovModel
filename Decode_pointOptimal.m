function [X, gamma] = Decode_pointOptimal(Y,PI,A,B)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
[~,alpha] = Identify_Forward(Y,PI,A,B);
[~,beta] = Identify_Backward(Y,PI,A,B);

T = length(Y);
N = size(B,1);
gamma = zeros(T, N);

for t = 1:T
    for i = 1:N
        upper = alpha(t,i) * beta(t,i);
        lower = sum( alpha(t, : ) .* beta(t, : ) );
        gamma(t,i) = upper/lower;
    end
end

opt = max(gamma,[],2);
path = (gamma >= opt);
path=  path.';
ind = find(path);
[X,t] = ind2sub(size(path), ind);
        
end


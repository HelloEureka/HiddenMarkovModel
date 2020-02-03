function [X,pstar] = Decode_pathOptimal(Y,PI,A,B)
%UNTITLED7 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

T = length(Y);
N = size(B,1);
delta = zeros(T, N);
psi = zeros(T, N);
X = zeros(T, 1);

for i=1:N
    delta(1,i) = PI(i)*B(i,Y(1));%��ʼ��
end

for t=2:T
    for j=1:N
        temp = (delta(t-1, : ).') .* A( : ,j);
        maxTemp = max(temp);
        delta(t,j) = maxTemp * B(j,Y(t));        %
        psi(t,j) = find(temp>=maxTemp, 1);   %Argmax
    end  
end

pstar = max(delta(T, : ));
X(T) = find(delta(T, : ) >= pstar, 1);     %��ֹ

for t = T-1:-1:1
    X(t) = psi(t+1, X(t+1));    %����·��
end

end


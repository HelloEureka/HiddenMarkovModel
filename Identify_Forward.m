function [res,alpha] = Identify_Forward(Y,PI,A,B)
%ʶ��ǰ���㷨
%input: �۲����У���ʼ��������ת�Ƹ��ʾ��󣬷�����ʾ���
%output: Pr(Y|lamda), ǰ�����ʾ���

%����
N = size(B,1);
T = length(Y);
alpha=zeros(T, N);

for i=1:N
    alpha(1,i) = PI(i) * B(i, Y(1));    %��ʼ��
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





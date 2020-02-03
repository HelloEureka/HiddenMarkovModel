function [res,beta] = Identify_Backward(Y,PI,A,B)
%ʶ�𣬺����㷨
%input: �۲����У���ʼ��������ת�Ƹ��ʾ��󣬷�����ʾ���
%output: Pr(Y|lamda), �󴫸��ʾ���


%����
N = size(B,1);
T = length(Y);
beta=zeros(T, N);

for i=1:N
    beta(T,i) = 1;    %��ʼ��
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


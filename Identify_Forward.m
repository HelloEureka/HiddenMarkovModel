N=2;    %״̬������������
M=6;    %�۲�����������
Y=[1,2,3,3,1,4,4,3,2,6];    %�۲���
T=length(Y);

%����
PI=[1,0]; %��ʼ״̬����
A=[0.8,0.2
    0.3,0.7];%ת��״̬����
B=[1/6,1/6,1/6,1/6,1/6,1/6;
    0.1, 0.1, 0.1, 0.1, 0.3, 0.3];%������ʾ���

%ǰ���㷨
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

disp(res);


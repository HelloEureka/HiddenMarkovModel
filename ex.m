PI=[1,0]; %��ʼ״̬����
A=[0.5,0.5;
    0.3,0.7];%ת��״̬����
B=[1/6,1/6,1/6,1/6,1/6,1/6;
    0.1, 0.1, 0.1, 0.1, 0.3, 0.3];%������ʾ���

%T=10000;
X = zeros(T,1);
Y = zeros(T,1);

%״̬��
X(1) = 1;
for t=2:T
    transf = A(X(t-1), : ); %��ȡת�Ƹ���
    transf = cumsum(transf);    %�ۼ����������0-1
    rd = rand(1);
    X(t) = find(transf>=rd, 1);
end

%�۲���
for t=1:T
    send = B(X(t), :);
    send = cumsum(send);    %�������
    rd = rand(1);
    Y(t) = find(send>=rd, 1);
end
    
    
    
    
    
    



N=2;    %状态数，两个骰子
M=6;    %观测数，六个面
Y=[1,2,3,3,1,4,4,3,2,6];    %观测结果
T=length(Y);

%参数
PI=[1,0]; %初始状态概率
A=[0.8,0.2
    0.3,0.7];%转移状态矩阵
B=[1/6,1/6,1/6,1/6,1/6,1/6;
    0.1, 0.1, 0.1, 0.1, 0.3, 0.3];%发射概率矩阵

%前项算法
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

disp(res);


Y=[1,2,3,3,1,4,4,3,2,6];    %观测结果

PI=[1,0]; %初始状态概率
A=[0.8,0.2
    0.3,0.7];%转移状态矩阵
B=[1/6,1/6,1/6,1/6,1/6,1/6;
    0.1, 0.1, 0.1, 0.1, 0.3, 0.3];%发射概率矩阵

[res1,alpha] = Identify_Forward(Y,PI,A,B);
disp(res1);
[res2,beta] = Identify_Backward(Y,PI,A,B);
disp(res2);
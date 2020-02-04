PI0=[0.3,0.7]; %³õÊ¼×´Ì¬¸ÅÂÊ
A0=[0.5,0.5;
    0.5,0.5];%×ªÒÆ×´Ì¬¾ØÕó
B0=[1/6,1/6,1/6,1/6,1/6,1/6;
    0.1, 0.1, 0.1, 0.4,0.2,0.3];%·¢Éä¸ÅÂÊ¾ØÕó
[rePI,reA,reB] = Learning_BW(Y,PI0,A0,B0);

iter = 22;
err=zeros(iter,3);
for i =1:iter
%     [rePI,reA,reB] = Learning_BW(Y,rePI,reA,reB);
%     err(i) = norm(reB-B);

    PI0 = rePI;
    A0 = reA;
    B0 = reB;
    [rePI,reA,reB] = Learning_BW(Y,PI0,A0,B0);
    err(i,1) = norm(rePI-PI);
    err(i,2) = norm(reA-A);
    err(i,3) = norm(reB-B);
end
plot(err,'-');
legend('rePI', 'reA' , 'reB');



PI=[1,0]; %³õÊ¼×´Ì¬¸ÅÂÊ
A=[0.5,0.5;
    0.3,0.7];%×ªÒÆ×´Ì¬¾ØÕó
B=[1/6,1/6,1/6,1/6,1/6,1/6;
    0.1, 0.1, 0.1, 0.1, 0.3, 0.3];%·¢Éä¸ÅÂÊ¾ØÕó

%T=10000;
X = zeros(T,1);
Y = zeros(T,1);

%×´Ì¬Á´
X(1) = 1;
for t=2:T
    transf = A(X(t-1), : ); %ÌáÈ¡×ªÒÆ¸ÅÂÊ
    transf = cumsum(transf);    %ÀÛ¼ÓÓÃÓÚËæ»ú£¬0-1
    rd = rand(1);
    X(t) = find(transf>=rd, 1);
end

%¹Û²âÁ´
for t=1:T
    send = B(X(t), :);
    send = cumsum(send);    %·¢Éä¸ÅÂÊ
    rd = rand(1);
    Y(t) = find(send>=rd, 1);
end
    
    
    
    
    
    



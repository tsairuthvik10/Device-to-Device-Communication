function capacity2=algorithm2(PCmax,PDmax,K,M,Nu,Nd);
%K=8;
%M=18;
%Nu=2;
%Nd=2;
%x2 of size k,x3 of size kxm
x3=zeros(K,M);
x2=zeros(1,K);
noise=(3.981*10^(-18)*3*10^(6))/20;%noise spectral density*BW/total no. of channels
load finalh.mat;
for k=1:K
    for m=1:M
        [Px(k,m),Py(k,m)]=power_matrix(PCmax,PDmax,k,m);
        eta=Py(k,m)*hd_kk(k)/(Px(k,m)*h_kc(k,m) + noise);
        lambda=Px(k,m)*hd_cb(m)/(Py(k,m)*hd_kb(k) + noise);
        teta=(PDmax*hd_kk(k))/(noise);
        tau=(PCmax*hd_cb(m))/(noise);
        theta(k,m)=log2(1 + eta) + log2(1 + lambda) - log2(1 + teta) - log2(1 + tau);
    end
end
temptheta=theta;
[w,cost]=munkres(1./theta);  % if it is finding maximum use 1/theta
for i=1:K
    T(i)=theta(i,w(i));
end
for k=1:K-Nu-Nd
    k=find(T==max(T));
    if length(k)>1
        k=k(1);
    end
    x3(k,w(k))=1;
    T(k)=0;%update T
end
for k=K-Nu-Nd+1:K
    k=find(T==max(T));
    if length(k)>1
        k=k(1);
    end
    x2(k)=1;
    T(k)=0;
end
cap=x3.*theta;
capacity2=sum(sum(cap));
end
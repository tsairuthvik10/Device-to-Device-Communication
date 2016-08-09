%T1(k),T2(k) are capacities of d2d to eNB and d2d pair respectively
%hd_kb is channel gain of d2d to eNB in which Idon't knw what the hell is G
%hd_kk is channel gain of d2d pair
function capacity=algorithm1(PDmax,PCmax,K,M,Nu,Nd)
%PDmax=250; %will have an array of elements
noise=(3.981*10^(-18)*3*10^(6))/20;%noise spectral density*BW/total no. of channels
% K=8;%no. of d2d channels
% Nu=2;%no. of unused uplink channels
% Nd=2;%no. of unused downlink channels
x1=zeros(1,K);
x2=zeros(1,K);
load finalh.mat;
for k=1:K
T1(k)=log2(1 + (PDmax*hd_kb(k))/(noise));
T2(k)=log2(1 + (PDmax*hd_kk(k))/(noise));
temp1=T1;
temp2=T2;
end
for k=1:K
T=max(T1(k),2*T2(k));
end
n1=0;
n2=0;
k=0;
while ((n1<Nu) && (n2<Nd))
    k=find(T==max(T));
    if length(k)>1 
        k=k(1); %taking one occurence at a time
    end
    if T(k)==T1(k);
        n1=n1+1;
        n2=n2+1;
        x1(k)=1;
    else
        if (Nu-n1)>(Nd-n2)
            n1=n1+1;
            x2(k)=1;
        else
            n2=n2+1;
            x2(k)=1;
        end
    end
    T1(k)=0;
    T2(k)=0;
    T(k)=0;
end
for i=1:max(Nu-n1,Nd-n2)
    k=find(T2==max(T2));
    if length(k)>1 
        k=k(1); %taking one occurence at a time
    end
    x2(k)=1;
end
cap1=x1.*temp1;
cap2=x2.*temp2;
capacity=sum(cap1+cap2);
end
    
    


%hd_kb is channel gain of d2d to eNB in which Idon't knw what the hell is G
%hd_cb is channel gain of cellular to eNB
function capacity3=algorithm3(PCmax,PDmax,K,M,Nu,Nd)
%PDmax=250; %will have an array of elements
%PCmax=250; %will have an array of elements
noise=(3.981*10^(-18)*3*10^(6)*10^(-3))/20;%noise spectral density*BW/total no. of channels
% K=8;%no. of d2d channels
% M=18;%no. of cellular channels
% Nu=2;%no. of unused uplink channels
% Nd=2;%no. of unused downlink channels
Karray=1:K;
load finalh.mat;
for k=1:K
epsilon(k)=(PDmax*hd_kb(k))/(noise);%snr
end
for k=1:K
    for m=1:(K-1)
        if(epsilon(m)<epsilon(m+1))
            temp=epsilon(m);
            epsilon(m)=epsilon(m+1);
            epsilon(m+1)=temp;
            temp=Karray(m);
            Karray(m)=Karray(m+1);
            Karray(m+1)=temp;
        end
    end
end
capacity3=0;
for k=1:min(K,min(Nu,Nd))
    capacity3=capacity3 + log2(1 + epsilon(k));
end
% for m=1:M
%     capacity3=capacity3 + log2(1 + (PCmax*hd_cb(m))/(noise));
% end
end

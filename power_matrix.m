%for eta and lambda, we are creating a power matrix of size kXm
%hd_kb is channel gain of d2d to eNB in which Idon't knw what the hell is G
%hd_cb is channel gain of cellular to eNB
%hd_kk is channel gain of d2d pair
function [Pmi,Pmj]=power_matrix(Pd,Pc,k,m)
Emin=10000;%in milliwatts
noise=(3.981*10^(-18)*3*10^(6))/20;%noise spectral density*BW/total no. of channels
load finalh.mat;
Powerm=zeros(Pd,Pc);
flag=0;
for i=1:10:Pc
    for j=1:10:Pd
        Pi=10^(i/10);
        Pj=10^(j/10);
        E3=Pj*hd_kk(k)/(Pi*h_kc(k,m) + noise);
        Ec=Pi*hd_cb(m)/(Pj*hd_kb(k) + noise);
        if((E3>=Emin)&&(Ec>=Emin))
        Powerm(j,i)=log2(1+E3)+log2(1+Ec);
        flag=1;
        end
    end
end
if(flag==1)
    [positionPi,positionPj]=find(Powerm==max(Powerm(:)));
    Pmi=10.^(positionPi(1)/10);
    Pmj=10.^(positionPj(1)/10);
else
    Pmi=0;
    Pmj=0;
end
end

%all powers in milliwatts
Emin=10000;%condition to be satisfied by P3 & powerc
Pd=500;
Pc=500;
noise=(3.981*10^(-18)*3*10^(6))/20;%noise spectral density*BW/total no. of channels
K=8;
Nu=2;
Nd=2;
M=18;
load finalh.mat;
for k=1:K
    for m=1:M
        [Px(k,m),Py(k,m)]=power_matrix(Pd,Pc,k,m);
        eta=Py(k,m)*hd_kk(k)/(Px(k,m)*h_kc(k,m) + noise);
        lambda=Px(k,m)*hd_cb(m)/(Py(k,m)*hd_kb(k) + noise);
        teta=(Pd*hd_kk(k))/(noise);
        tau=(Pc*hd_cb(m))/(noise);
        theta(k,m)=log2(1 + eta) + log2(1 + lambda) - log2(1 + teta) - log2(1 + tau);
    end
end
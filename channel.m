%h=beta*d
load b1520.mat;
load d.mat;
alpha=2;
hd_cb=b_cb.*(d_cb.^(-alpha));
hd_kb=b_kb.*(d_kb.^(-alpha));
h_kc=b_kc.*(d_kc.^(-alpha));
hd_kk=b_kk.*(d_kk.^(-alpha));

save('finalh.mat','hd_cb','hd_kb','h_kc','hd_kk');
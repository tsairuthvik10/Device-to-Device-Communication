K=1:15;

for i=1:15
    capacity(i)=algorithm1(250,250,i,15,5,5);
end

for i=1:15
    capacity2(i)=-1*algorithm2(250,250,i,15,5,5);
end

capacity2new=capacity + capacity2;

for i=1:15
    capacity3(i)=algorithm3(250,250,i,15,5,5);
end

reuse=capacity2new-capacity;
proximity_hop=capacity3-capacity;
d2d=reuse+proximity_hop;
plot(K,reuse/20,'-ob');
hold on
plot(K,proximity_hop/20,'-^g');
hold on
plot(K,d2d/20,'-sr');
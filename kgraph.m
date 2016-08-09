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

plot(K,capacity/20,'-ob')
hold on 
plot(K,capacity2new/20,'-^g')
hold on
plot(K,capacity3/20,'-sr')
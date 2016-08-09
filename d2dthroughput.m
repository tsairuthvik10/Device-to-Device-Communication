M=[10 11 12 13 14 15 16 17 18 19 20];
for i=1:11
    capacity(i)=algorithm1(250,250,10,M(i),5,5);
end
for i=1:11
    capacity2(i)=-1*algorithm2(250,250,10,M(i),5,5);
end
capacity2new=capacity + capacity2;
for i=1:11
    capacity3(i)=algorithm3(250,250,10,M(i),5,5);
end
plot(M,capacity/20,'-ob')
hold on 
plot(M,capacity2/20,'-^g')
hold on
plot(M,capacity3/20,'-sr')
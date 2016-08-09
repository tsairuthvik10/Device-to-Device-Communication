PDmax=[63,79,100,126,158,200,250,316,398,500];
PCmax=[63,79,100,126,158,200,250,316,398,500];
x=[18,19,20,21,22,23,24,25,26,27];

for i=1:10
capacity(i)=algorithm1(PDmax(i),250,8,18,2,2);
end

for i=1:10
    capacity2(i)=-1*algorithm2(250,PDmax(i),8,18,2,2);
end

for i=1:10
    capacity3(i)=algorithm3(250,PDmax(i),8,18,2,2);
end
plot(x,capacity/20,'-ob');
hold on
plot(x,capacity2/20,'-^g');
hold on
plot(x,capacity3/20,'-sr');

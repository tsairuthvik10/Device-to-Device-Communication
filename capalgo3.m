PCmax=[63,79,100,126,158,200,250,316,398,500];
PDmax=[63,79,100,126,158,200,250,316,398,500];
x=[18,19,20,21,22,23,24,25,26,27];
for i=1:10
    capacity3(i)=algorithm3(250,PDmax(i),8,18,2,2);
end
function [ segment ] =  autoSegment(data)

l = length(data);
data=data+abs(min(data))+1;
sample = 10000;
tw = 0.5;
ws = tw*sample;
sum1 = mean(data(1:ws));
sum2 = 0;
seg = [];
for i = 2e4 : 0.1*sample : l - 2*ws
    sum = 0;
    for j = i : i+ws
        sum = sum + data(i);
    end
    sum2 = sum / ws;
    diff1 = abs(sum2-sum1) / sum1;
    sum1 = sum2;
    if diff1 > 0.003
        seg = [seg;i];
    end
end

l = length(seg);
l
window = 1*sample;
remove = [];
for i = 1 : l
    if length(find((seg>=seg(i)-window)&(seg<=seg(i)+window))) < 2
        remove = [remove,i];
    end
end
length(seg)
seg(remove) = [];
length(seg)

Max = max(data);
figure;
subplot(211);
plot((0:length(data)-1)/sample,data);
hold on;
for i = 1 : length(seg)
    plot([seg(i)/sample seg(i)/sample],[0 Max]);
end

diff2 = diff(seg);
seg1 = [];
Max1 = max(diff2);
threhold = 0.35;
for i = 2 : length(diff2)-1
    if diff2(i) > threhold*Max1 && diff2(i) > diff2(i+1)
        seg1 = [seg1;i];
    end
end

seg2 = [];
for i = 1 : length(seg1)
    seg2 = [seg2;seg(seg1(i))+0e4;seg(seg1(i)+1)-0e4];
end

seg2 = [seg(1);seg2;seg(end)];
subplot(212);
plot((0:length(data)-1)/sample,data);
hold on;
for i = 1 : length(seg2)
    plot([seg2(i)/sample seg2(i)/sample],[0 Max]);
end

segment = {};

if mod(length(seg2),2)==0
    for i = 1 : length(seg2)/2
        segment{i} = data(seg2(2*i-1):seg2(2*i));
    end
end

end
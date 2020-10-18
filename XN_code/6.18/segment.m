%wifi文章中的分割
% max=max(E(100:6450));
S=zeros();
l=0;
maxd=zeros();
threshold=zeros();
for i= 500:2000
    if E(i+1) >= E(i) && E(i) >= E(i-1)
        l=l+1;
        maxd(l)=E(i);
        threshold(l)=maxd(l)*0.1;
    end
end
count=1;
for i = 500:2000
    if E(i)<=threshold(count) && E(i+1)>threshold(count)
        l=l+1;
        S(l)=i-499;
    elseif E(i)>threshold(count) && E(i+1)<=threshold(count)
        l=l+1;
        S(l)=i+1-499;
        count=count+1;
    end  
end

Static=zeros();
maxs=max(E(500:2000));
thresholds=maxs*0.1;
l=0;
for i = 500:2000
    if E(i)<=thresholds && E(i+1)>thresholds
        l=l+1;
        Static(l)=i-499;
    elseif E(i)>thresholds && E(i+1)<=thresholds
        l=l+1;
        Static(l)=i+1-499;
        count=count+1;
    end  
end


subplot(2,1,1)
plot(E(500:2000));
hold on
% line([100 6450],[threshold threshold],'linestyle','--', 'Color','r', 'LineWidth', 0.5);

for x = 1:length(S)
    xz=S(x);
    line([xz xz],[0 4*10^-10],'linestyle','--', 'Color','r', 'LineWidth', 0.5);
end

subplot(2,1,2)
plot(z(500:2000))
hold on
for x = 1:length(Static)
    xz=Static(x);
    line([xz xz],[0.07 0.09],'linestyle','--', 'Color','g', 'LineWidth', 0.5);
end
for x = 1:length(S)
    xzz=S(x);
    line([xzz xzz],[0.07 0.09],'linestyle','--', 'Color','r', 'LineWidth', 0.5);
end

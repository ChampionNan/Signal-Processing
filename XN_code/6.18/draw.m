%短时能量
framelength = 9;   %设置窗口长度
for i = 1:length(mvar)     %分帧处理
    if length(z)-i<floor(framelength/2)
        framesignal = mvar(i-floor(framelength/2):end);
    elseif i <= floor(framelength/2)
        framesignal = mvar(1:i+floor(framelength/2));    
    else
        framesignal = mvar(i-floor(framelength/2):i+floor(framelength/2));   %获取每帧的数据
    end
    E(i) = 0;%每帧能量置零
    for j = 1:length(framesignal) %计算每一帧的能量
        E(i) = E(i)+framesignal(j)^2;
    end
end

subplot(2,1,1)
yyaxis left
plot(mvar(400:1000))
ylabel('移动方差');
yyaxis right
plot(E(400:1000));
ylabel('短时能量');
%set(gca,'XTick',[150:0:100]); 
%xlim([100 250])
%ylim([0 0.25])
subplot(2,1,2);
plot(z(400:1000))
ylabel('幅值');

% subplot(3,1,2)
% plot(E(400:1000));
% ylabel('短时能量');

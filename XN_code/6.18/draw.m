%��ʱ����
framelength = 9;   %���ô��ڳ���
for i = 1:length(mvar)     %��֡����
    if length(z)-i<floor(framelength/2)
        framesignal = mvar(i-floor(framelength/2):end);
    elseif i <= floor(framelength/2)
        framesignal = mvar(1:i+floor(framelength/2));    
    else
        framesignal = mvar(i-floor(framelength/2):i+floor(framelength/2));   %��ȡÿ֡������
    end
    E(i) = 0;%ÿ֡��������
    for j = 1:length(framesignal) %����ÿһ֡������
        E(i) = E(i)+framesignal(j)^2;
    end
end

subplot(2,1,1)
yyaxis left
plot(mvar(400:1000))
ylabel('�ƶ�����');
yyaxis right
plot(E(400:1000));
ylabel('��ʱ����');
%set(gca,'XTick',[150:0:100]); 
%xlim([100 250])
%ylim([0 0.25])
subplot(2,1,2);
plot(z(400:1000))
ylabel('��ֵ');

% subplot(3,1,2)
% plot(E(400:1000));
% ylabel('��ʱ����');

%将wifi分割部分截取合并，再BG
% result=zeros(1,0);    %1行n列
% for i=1:length(S)-1
%     result=[result,z(S(i):S(i+1))'];
% end
% result=result';

% subplot(2,1,1)
% plot(z(100:6450));
% hold on
% for x = 1:length(S)
%     xz=S(x);
%     line([xz xz],[0.07 0.09],'linestyle','--', 'Color','r', 'LineWidth', 0.5);
% end
% 
% 
% subplot(2,1,2)
% plot(result)

result=[z(S(1):S(2))',z(S(3):S(4))'];
result=result';
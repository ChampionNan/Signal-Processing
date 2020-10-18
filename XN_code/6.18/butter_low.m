%混合信号 Mix_Signal_1  巴特沃斯低通滤波
Wc=2*50/Fs;                                          %截止频率 50Hz，Fs采样率
[b,a]=butter(4,Wc);
Signal_Filter=filter(b,a,Mix_Signal_1);

subplot(4,1,1);                                        %Mix_Signal_1 原始信号                 
plot(Mix_Signal_1);
axis([0,1000,-4,4]);
title('原始信号 ');

subplot(4,1,2);                                        %Mix_Signal_1 低通滤波滤波后信号  
plot(Signal_Filter);
axis([0,1000,-4,4]);
title('巴特沃斯低通滤波后信号');
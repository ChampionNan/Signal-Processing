%����ź� Mix_Signal_1  ������˹��ͨ�˲�
Wc=2*50/Fs;                                          %��ֹƵ�� 50Hz��Fs������
[b,a]=butter(4,Wc);
Signal_Filter=filter(b,a,Mix_Signal_1);

subplot(4,1,1);                                        %Mix_Signal_1 ԭʼ�ź�                 
plot(Mix_Signal_1);
axis([0,1000,-4,4]);
title('ԭʼ�ź� ');

subplot(4,1,2);                                        %Mix_Signal_1 ��ͨ�˲��˲����ź�  
plot(Signal_Filter);
axis([0,1000,-4,4]);
title('������˹��ͨ�˲����ź�');
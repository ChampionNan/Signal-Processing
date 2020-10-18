
file_root = 'd:\Infocom2019data\rd071705\rd0717';
save_root = 'd:\Infocom2019data\matdata\071705\rd0717'
letter=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
for k =1:26
filename =[file_root '_' letter(k) '5_50'];   
fs = 10000;
I_file = [filename '_I.txt'];
Q_file = [filename '_Q.txt'];
I = load(I_file);
Q = load(Q_file);
if length(I) ~= length(Q)
    min_len = min(length(I), length(Q));
    I = I(1:min_len);
    Q = Q(1:min_len);
end
z = complex(I,Q);
energy = abs(z);
smoothed = smooth(energy, 4000);
close all;
%save_I = [save_root letter(k) '_I.mat'];
%save_Q = [save_root letter(k) '_Q.mat'];
save_energy = [save_root letter(k) '5_50.mat'];
%save(save_I, 'I_sample');
%save(save_Q, 'Q_sample');
save(save_energy, 'smoothed');
end
%plot(smoothed);
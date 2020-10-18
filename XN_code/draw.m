load('smoothresult.mat');
z = d;
mvar = movvar(z,1500)*1000000000;%sitstand3000 turn2200  350 35000 
scale=1;

%
framelength = 101;   %
for i = 1:length(mvar)     %
    if length(z)-i<floor(framelength/2)
        framesignal = mvar(i-floor(framelength/2):end);
    elseif i <= floor(framelength/2)
        framesignal = mvar(1:i+floor(framelength/2));    
    else
        framesignal = mvar(i-floor(framelength/2):i+floor(framelength/2));   %
    end
    E(i) = 0;%
    for j = 1:length(framesignal) %
        E(i) = E(i)+framesignal(j)^2;
    end
end

subplot(2,1,1)
yyaxis left
plot(mvar(1:round(length(mvar)*scale)))
ylabel('“ylabel1');
yyaxis right
plot(E(1:round(length(E)*scale)));
ylabel('ylabel2');
%set(gca,'XTick',[150:0:100]); 
%xlim([100 250])
%ylim([0 0.25])
subplot(2,1,2);
plot(z(1:round(length(z)*scale)))
ylabel('ylabel3');
save('mvarSTE');
% subplot(3,1,2)
% plot(E(400:1000));
% 

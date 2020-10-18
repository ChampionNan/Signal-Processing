abstemp=abs(Sitstand);
n=length(Sitstand);
[ham,j]=hampel(abstemp);
% [ham1,j]=hampel(abstemp,10000);
% [ham2,j]=hampel(abstemp,15000);
% [ham3,j]=hampel(abstemp,50000);

savi=smooth(abstemp,4000,'sgolay');
sgf = sgolayfilt(abstemp,1,201);

subplot(4,1,1)
plot(ham(round(n*0.001):n));
ylabel('hampelÂË²¨');

subplot(4,1,2)
plot(sgf(round(n*0.001):n));
ylabel('saviÂË²¨');

subplot(4,1,3)
plot(z1(round(n*0.001):n));
ylabel('movingÂË²¨');


subplot(4,1,4);
plot(abs(Sitstand(round(n*0.001):n)))
ylabel('·ùÖµ');

for m=30:1
    h
end

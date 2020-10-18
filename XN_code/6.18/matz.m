filename='/Users/yin/Desktop/data/ljd_dunqi';

the_file = fopen([filename, '_I.txt']);
C = textscan(the_file,'%f ');  
I = C{1};
fclose(the_file);
the_file = fopen([filename, '_Q.txt']);
C = textscan(the_file,'%f ');
Q = C{1};
fclose(the_file);
if length(I) ~= length(Q)
    min_len = min(length(I), length(Q));
    I = I(1:min_len);
    Q = Q(1:min_len);
end
Sitstand = complex(I,Q);
% n=length(Sitstand);
% 
% z1=smooth(abs(Sitstand),200);
% z2=downsample(z1,10);
z=smooth(abs(Sitstand),400);
z=downsample(z,10000);
%moving variance 
mvar = movvar(z,40);
plot(z)

% subplot(3,1,1)
% plot(abs(Sitstand(round(n*0.001):n)));
% ylabel('raw');
% subplot(3,1,2);
% plot(z2(round(length(z2)*0.01):length(z2)))
% ylabel('smoothdown');
% subplot(3,1,3);
% plot(z1(round(n*0.001):n))
% ylabel('smooth');

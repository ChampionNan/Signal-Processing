%
load('smoothresult.mat');
load('mvarSTE.mat')
%
%
scale=1;
%
%E=d;
E=E-0.4*power(10,-3);
[maxv,maxl]=findpeaks(E,'minpeakdistance',30000);

%
Static=zeros();
thresholds=maxv*0.005;
l=0;
count=1;
flag=0;
for i = 1:round(length(mvar)*scale)-1
    if E(i)<=thresholds(count) && E(i+1)>thresholds(count) && flag==0
        l=l+1;
        Static(l)=i;
        flag=1;
    elseif E(i)>thresholds(count) && E(i+1)<=thresholds(count) && flag==1
        l=l+1;
        Static(l)=i+1;
        count=count+1;
        flag=0;
        if count==length(thresholds)
            break
        end
    end  
end

%
% left=zeros();
% right=zeros();
% lc=0;
% lr=0;
% for s=1:length(Static)
%     remainder = mod(s,2);
%     if(remainder == 1)
%         lc=lc+1;
%         left(lc)=Static(s);
%     else
%         lr=lr+1;
%         right(lr)=Static(s);
%     end
% end


subplot(2,1,1)
plot(E(1:round(length(mvar)*scale)));
hold on
plot(maxl,maxv,'*','color','R');  
% hold on
% % line([100 6450],[threshold threshold],'linestyle','--', 'Color','r', 'LineWidth', 0.5);
% 
% for x = 1:length(S)
%     xz=S(x);
%     line([xz xz],[0 4*10^-10],'linestyle','--', 'Color','r', 'LineWidth', 0.5);
% end

subplot(2,1,2)
plot(z(1:round(length(mvar)*scale)))
hold on
for x = 1:length(Static)
    xz=Static(x);
    line([xz xz],[0 0.0001],'linestyle','--', 'Color','g', 'LineWidth', 0.5);
end

% ste=zeros();
% flag=0;
% c=1;
% n=1;
% for x=1:round(length(mvar)*scale)
%     if c>= length(Static)
%         break
%     end
%     if x>=Static(c) && x<=Static(c+1)
%         ste(n)=z(x);
%         n=n+1;
%         if x==Static(c+1)
%             c=c+2;
%         end
%     end
% end
% 
% subplot(3,1,3)
% plot(ste);

function [SS,D] = UpdateSegmentation(sample,template)

%max < 2*min can achieve a better result 20-34
min = 30;
max = 50;
% min=10;
% max=30;
%determine the accuracy
granularity = -1;



L=length(sample);
maxSeg=ceil(L/min);
S=zeros(L,maxSeg);
D=zeros(L,1);
m=length(template);
x=1:length(template);
cs=spline(x,template);
for i=1:L
    %************
    if i<min
        continue;
    end 
    %************
    if  i < 2*min
        if mod(i,1000)==0
            display('yes');
        end
        %S(i,1)=i;
        xx=linspace(1,m,i);
        ss=ppval(cs,xx);
        ss=ss';      
%         D(i)=norm(sample(1:i)-ss); 
        D(i)=dtw(sample(1:i),template);
        continue;
    end
    %************
    low=i-max;
    high=i-min;
    minCost=1e8;
    %minIndex=high;
    S(i,:)=S(i-1,:);
    if mod(i,1000)==0
            display(i);
    end
    for j=high:granularity:low
        if (j < min && j > 0) || (j > max && j < 2*min)
           continue;
        end
        
        if j <= 0
            l=i;
        else
            l=i-j;
        end
        xx=linspace(1,m,l);
        ss=ppval(cs,xx);
        ss=ss';   
        
        if j <= 0
%             cost=norm(sample(1:i)-ss);
            cost=dtw(sample(1:i),template');
        else
%             cost=D(j)+norm(sample(j+1:i)-ss);
            cost=D(j)+dtw(sample(j+1:i),template);
        end
       
        if cost < minCost
            minCost=cost;
            %minIndex=j;
            D(i)=cost;  
            if j <= 0
                S(i,:) = zeros(1,maxSeg);
            else
                S(i,:)=S(j,:);
                index=find(S(i,:)==0);
                S(i,index(1))=j;
            end
        end
    end
end

index=find(S(L,:)==0);
%display(index);
SS=S(L,1:index(1)-1);
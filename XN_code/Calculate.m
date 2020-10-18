function [L] = Caculate(data)

t=downsample(data,10000);
%threshold
threshold=5e-4;
m=ceil(length(t)/100);
%Initialization of template
template_now=zeros(m,1);
template_last=zeros(m,1);

l=0;
diff=1e6;
while diff>threshold && l<10
    [S,D]=UpdateSegmentation(t,template_now);
    template_last=template_now;
    template_now=UpdateTemplate(t,S,m);
    diff=norm(template_now-template_last);
    l=l+1;
    l
end
L=length(S)+1;
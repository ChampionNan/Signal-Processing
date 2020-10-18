function [template] = UpdateTemplate(sample,segment,m)

l=length(segment);
s=[];
template=zeros(m,1);
for i=1:l+1
    if i==1
        s=sample(1:segment(i));
    elseif i==l+1
        s=sample(segment(i-1)+1:end);
    else        
        s=sample(segment(i-1)+1:segment(i));
    end
    x=1:length(s);
    cs=spline(x,s);
    xx=linspace(1,length(s),m);
    ss=ppval(cs,xx);
    ss=ss';
    template=template+length(s)*ss;
end
template=template/length(sample);
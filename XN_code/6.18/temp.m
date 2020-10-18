plot(z(100:6450));
hold on
for x = 1:length(S)
    xz=S(x);
    line([xz xz],[0 0.09],'linestyle','--', 'Color','r', 'LineWidth', 0.5);
end
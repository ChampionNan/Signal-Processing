%BG分割后结果
plot(z(500:2000))
hold on
for x = 1:length(aa1501)
    xz=aa1501(x);
    line([xz xz],[0.07 0.09],'linestyle','--', 'Color','r', 'LineWidth', 0.5);
end
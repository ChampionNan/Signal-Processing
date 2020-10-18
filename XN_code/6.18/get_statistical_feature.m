function [ feature ] = get_statistical_feature( series )
%GET_STATISTICAL_FEATURE 此处显示有关此函数的摘要
%   此处显示详细说明
fs = 200000;
% Max=max(series);
% Min=min(series);
% series=series/(Max-Min);
a = mean(series);   %时域
b = std(series);
c = max(series);
d = min(series);
e = quantile(series,3);
f = skewness(series);
g = kurtosis(series);
% h = zero_crossing_rate(series);
i = sqrt(sumsqr(series(:,1)));

input = series;
fft_abs = abs(fft(input));   %频域
fft_abs = fft_abs(1:floor(end/2) + 1);
fft_abs(2:end-1) = 2*fft_abs(2:end-1);
sum_fft_abs = sum(fft_abs);
f_i = (0:length(fft_abs)-1)/length(series)*fs;
f_i = f_i';
spectral_centroid = sum(f_i .* fft_abs) / sum_fft_abs;
normalized_spectrum = fft_abs ./ sum_fft_abs;
spectral_entropy = sum(normalized_spectrum .* log2(normalized_spectrum));
spectral_spread = sqrt(sum((f_i - ones(size(f_i))*spectral_centroid).^2 .* normalized_spectrum));
spectral_skewness = sum((f_i - ones(size(f_i))*spectral_centroid).^3 .* normalized_spectrum)/(spectral_spread.^3);
spectral_kurtosis = sum((f_i - ones(size(f_i))*spectral_centroid).^4 .* normalized_spectrum)/(spectral_spread.^4);
spectral_flatness = ((prod(fft_abs))^(1/101))/(sum_fft_abs / 101);

feature = [a,b,c,d,e,f,g,i,spectral_centroid,spectral_entropy,spectral_spread,spectral_skewness,spectral_kurtosis,spectral_flatness]';

record=series;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Mean=mean(series);
Std=std(series);
series=(series-Mean)/Std;   %归一化操作
a = mean(series);
b = std(series);
c = max(series);
d = min(series);
e = quantile(series,3);
f = skewness(series);
g = kurtosis(series);
% h = zero_crossing_rate(series);
i = sqrt(sumsqr(series(:,1)));

input = series;
fft_abs = abs(fft(input));
fft_abs = fft_abs(1:floor(end/2) + 1);
fft_abs(2:end-1) = 2*fft_abs(2:end-1);
sum_fft_abs = sum(fft_abs);
f_i = (0:length(fft_abs)-1)/length(series)*fs;
f_i = f_i';
spectral_centroid = sum(f_i .* fft_abs) / sum_fft_abs;
normalized_spectrum = fft_abs ./ sum_fft_abs;
spectral_entropy = sum(normalized_spectrum .* log2(normalized_spectrum));
spectral_spread = sqrt(sum((f_i - ones(size(f_i))*spectral_centroid).^2 .* normalized_spectrum));
spectral_skewness = sum((f_i - ones(size(f_i))*spectral_centroid).^3 .* normalized_spectrum)/(spectral_spread.^3);
spectral_kurtosis = sum((f_i - ones(size(f_i))*spectral_centroid).^4 .* normalized_spectrum)/(spectral_spread.^4);
spectral_flatness = ((prod(fft_abs))^(1/101))/(sum_fft_abs / 101);

feature1 = [a,b,c,d,e,f,g,i,spectral_centroid,spectral_entropy,spectral_spread,spectral_skewness,spectral_kurtosis,spectral_flatness]';
feature = [feature;feature1];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Max=max(record);
Min=min(record);
series=record/(Max-Min);
a = mean(series);
b = std(series);
c = max(series);
d = min(series);
e = quantile(series,3);
f = skewness(series);
g = kurtosis(series);
% h = zero_crossing_rate(series);
i = sqrt(sumsqr(series(:,1)));

input = series;
fft_abs = abs(fft(input));
fft_abs = fft_abs(1:floor(end/2) + 1);
fft_abs(2:end-1) = 2*fft_abs(2:end-1);
sum_fft_abs = sum(fft_abs);
f_i = (0:length(fft_abs)-1)/length(series)*fs;
f_i = f_i';
spectral_centroid = sum(f_i .* fft_abs) / sum_fft_abs;
normalized_spectrum = fft_abs ./ sum_fft_abs;
spectral_entropy = sum(normalized_spectrum .* log2(normalized_spectrum));
spectral_spread = sqrt(sum((f_i - ones(size(f_i))*spectral_centroid).^2 .* normalized_spectrum));
spectral_skewness = sum((f_i - ones(size(f_i))*spectral_centroid).^3 .* normalized_spectrum)/(spectral_spread.^3);
spectral_kurtosis = sum((f_i - ones(size(f_i))*spectral_centroid).^4 .* normalized_spectrum)/(spectral_spread.^4);
spectral_flatness = ((prod(fft_abs))^(1/101))/(sum_fft_abs / 101);

feature2 = [a,b,c,d,e,f,g,i,spectral_centroid,spectral_entropy,spectral_spread,spectral_skewness,spectral_kurtosis,spectral_flatness]';
feature = [feature;feature2];
end
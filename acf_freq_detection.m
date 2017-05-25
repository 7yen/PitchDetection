%Wing Sang Wong
%DST II HW5
%acf freq detection by fft convolution
function [ freq ] = acf_freq_detection( input, fs )

%zero padding
zp_input = [input, zeros(1,length(input)-1)];

%calculate acf via fft convolution
acf = ifft(fft(zp_input).*fft(zp_input));

%discard the first half so it starts at lag 0
acf = acf(length(input):end);

%find all peaks
[~,locs] = findpeaks(acf);

%calculate frequency
freq = fs/mean(diff(locs));
end


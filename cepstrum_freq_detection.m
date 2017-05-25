%Wing Sang Wong
%DST II HW 5
%cepstrum fundamental frequency detection
function [ freq ] = cepstrum_freq_detection( input,fs )

%dft of the input
input_spec = fft(input);

%compute the ceptstrum
cepstrum = real(ifft(log(abs(input_spec))));

%limit the searching range
minL = round((fs/1500));
maxL = round((fs/100))+1;

%find the max
[~,locs] = max(cepstrum(minL:maxL));
freq = fs/(locs-1+minL);

end


%Wing Sang Wong
%DSTII HW5
%harmonic product spectrum
function [ freq ] = hps_freq_detection( input, fs )

%dft of the input
input_spec = abs(fft(input));

%init for the while loop
hps = input_spec;
hps_idx = 1;
%do first 13th harmonics
max_harmonics = 13;
downsample = 2;

while  downsample >= max_harmonics
   for idx = 1:length(input_spec)
       % add the downsampled spectrums
      if mod(((idx+1)/downsample),1) == 0
          hps(hps_idx) = hps(hps_idx) + input_spec(idx);
          hps_idx = hps_idx + 1;
      end
   end
    hps_idx = 1;
    downsample =downsample + 1;
end

% find the freq
[~,bin] = max(hps);
freq = bin * (fs/length(input_spec));

end


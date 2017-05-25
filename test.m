%test example of pitch detection example

%read a audio file
[input,fs] = audioread('saw.wav');
input = input';

%fund freq detection by acf
freq = acf_freq_detection(input,fs);
disp(['Autocorrelation: ', num2str(freq)]);

%fund freq detection by zero crossing
freq = zcross(input,fs);
disp(['Zero Crossing: ', num2str(freq)]);

%fund freq detection by inverse comb filter
freq = icomb_freq_detection(input,fs);
disp(['Inverse Comb filter: ', num2str(freq)]);

%fund freq detection by harmonic product spectrum
freq = hps_freq_detection(input,fs);
disp(['Harmonic Product Detection: ', num2str(freq)]);

%fund freq detection by cepstrum
freq = cepstrum_freq_detection(input,fs);
disp(['Cepstrum: ',num2str(freq)]);

%fund freq detection by chroma
freq = chroma_detect(input,fs);
disp(['Chroma: ',num2str(freq)]);

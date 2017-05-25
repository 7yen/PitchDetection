%Wing Sang Wong
%DST II HW5
%inverse comb filter frequency detection
function [ freq ] = icomb_freq_detection(input, fs )
%downsample to in crease resolution

%high pass
input = filter([1,0.5],1,input);

%init the while loop
idx = 1;

% the range of the sweep
delay = 4;
max_delay = 128;

%an array to store the energy
sum_of_input = zeros(1,max_delay-delay);

while delay <= max_delay
    %the energy of the filtered input
  sum_of_input(idx) = sum(abs(filter([1,zeros(1,delay-1),-0.5],1,input)));
  idx = idx + 1;
  delay = delay + 1;
end

%calculate frequency
[~,loc] = min(sum_of_input);

% add 4 because delay start at 4
freq = fs/(loc+4-1);
end


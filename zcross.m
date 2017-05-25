%Wing Sang Wong
%DST II HW5
%zero_crossing freq detection
function [ freq ] = zcross( input, fs )

%smooth the input signal
input = filter(ones(1,16)./16,1,input);

%init the while loop
idx = 2;
num_of_zc = 0;

while idx <= length(input)
    %if pass through zeros
    if (input(idx-1)>0 && input(idx)<=0) || (input(idx-1)<0 && input(idx)>=0)
        num_of_zc = num_of_zc + 1;
        end
        idx = idx + 1;
end
    
%calculate frequency
freq = (num_of_zc*0.5)/(length(input)/fs);
end


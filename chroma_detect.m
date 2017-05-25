%Wing Sang Wong
%DSTII HW5
%chroma fundamental freq detection

function [freq] = chroma_detect( input, fs )

input = input';

%do 6 octaves of chroma
num_of_note = 6*12;

%customize dft for chroma
note_matrix = zeros(num_of_note,length(input));

%create a chroma matrix
for idx = 1:num_of_note 
   notefreq = 65.4064*2^((idx-1)/12);
   note_matrix(idx,:) = exp(1i*2*pi*notefreq*((1:length(input))./fs));  
end

%compute chroma by matrix multiplication
chroma = abs(note_matrix*input);

%find the max
[~,locs] = max(chroma);
freq = 65.4064*2^((locs-1)/12);
end


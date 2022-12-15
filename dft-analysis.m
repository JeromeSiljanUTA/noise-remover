% importing file
filename = 'noisyconversation.wav';

% getting y (sampled data) and Fs (sampling frequency)
[y,Fs] = audioread(filename);

% performing fft and getting absolute value of data
fft_y = fft(y);
abs_fft_y = abs(fft_y);

% fft analysis plot
% plot(abs_fft_y); % commented out for clarity

% set cutoff frequency as 700 (below is noise)
Fc = 700;

% set order for filter
n_order = 2; 

% get Butterworth coefficients
[b, a] = butter(n_order, Fc/(Fs/2), 'low');

% given order, normalized cutoff frequency
cleaned_y = filtfilt(b, a, y);

cleaned_y = fft(cleaned_y);
abs_cleaned_y = abs(cleaned_y);

% show fft after filtering
% plot(abs_cleaned_y);

% frequency response of filter
[h, f] = freqz(b, a, 256, Fs); % commented out for clarity
plot(f,h);

% write to file
% audiowrite('cleanedconversation.wav', cleaned_y, Fs); % commented out so 
% code takes less time to execute (using onlin editor)

## Identifying noise
In order to filter the noise in the audio file provided (`noisyconversation.wav`), it was important to first identify the frequencies in the file. The MATLAB function `fft` worked perfecty for this since I wanted to use a Fourier transform. After running the audio through the Fourier transform, I got an output that looked like this: 

![DFT before Butterworth filter](plots/before_butter.png)

## Removing noise
Since I wanted to remove the noise, I did some research and found that most human voice frequencies are in the 800-1000 Hz range. This lined up with the results of my Fourier transform, so I set the Butterworth filter to be a low pass filter with a cutoff frequency of 700Hz. I used the `butter` function in MATLAB and saved the output as a file (`cleanedconversation.wav`).

## After filter
After applying the Butterworth filter, I performed a Fourier transform in order to check if I correctly removed the noise. This is shown in the following plot:

### DFT
![DFT after Butterworth filter](plots/after_butter.png)

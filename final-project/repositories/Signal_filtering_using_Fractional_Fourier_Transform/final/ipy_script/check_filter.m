% read the filtered data from the dumped matlab script and show its spectrogram

filtered;

N = 256;

d = seconds(1/N);
win = hamming(100,'periodic');

stft(x,d,'Window',win,'OverlapLength',98,'FFTLength',N);
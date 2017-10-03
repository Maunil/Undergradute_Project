clc;
clear;

load 'D4_Re_FFT_Frequency.mat';
[B,fs] = audioread('D4_Re.wav');

% B = diff(B);
B = B(:,1);

I = frequencies(:,2)>0.000302; % 0.0004259
k = find(I);

freq1 = frequencies(k,1);
amp1 = frequencies(k,2);

nfft = 128;
window = nfft;
overlap = window/2;  % 50 percent overlap
[b1, f1, t1] = specgram(B, freq1, fs, rectwin(window), overlap);

save('D4_Re_STFT.mat','b1','f1','t1','fs','amp1');
clc;
clear;

% Define Analysis and Synthesis Parameters

window_size = 256;
overlap = window_size/2; % Default Value = 50% overlap

% Define Hamming Window
window = rectwin(window_size);
nfft = window_size;

filename = 'C4_Generated';
extension = '.wav';
% Audio Input
[y,fs] = audioread(strcat(filename,extension));
y = y(:, 1);   

% Normalize Y  
% ymax = max(abs(y));              
% y = y/ymax; 

column = round(2*size(y,1)/nfft) - 2;   % Change to round(2*size(y,1)/nfft) - 1, round(2*size(y,1)/nfft) - 2, 
                                        % round(2*size(y,1)/nfft) - 3 etc.., according to size

% STFT Coefficients
s = zeros(nfft,column);

% STFT

counter = 0;

for i = 1:column
   
    temp = y(counter+1:counter+window_size).*window;
    
    s(:,i) = fft(temp,nfft);
    
    counter = counter + overlap;
    
end

% Inverse STFT

counter = 1;

% Initializing Output with Zeros

x = zeros(size(y,1),1);

for i=1:1:size(s,2)
    
    it = ifft(s(:,i),nfft);
    
    x(counter:counter+size(it,1)-1,1) = x(counter:counter+size(it,1)-1,1) + it.*window;
    
    counter = counter + overlap;
end

% Plot Spectrogram
% figure(5);
% spectrogram(y,window,256,nfft,fs,'yaxis'); 

% Calibration for Frequency in Graph

L=(length(y));  
NFFT = 2^nextpow2(L);
f = fs/2*linspace(0,1,NFFT/2+1);  

Lx=(length(x));  
NFFTx = 2^nextpow2(Lx);
fx = fs/2*linspace(0,1,NFFTx/2+1);

k = real(fft(x,NFFTx)/Lx);
l = real(fft(y,NFFT)/L);

% Play Reconstructed Signal

% sound(real(x),fs);

% Plot Graph

h = figure(1);
plot(y);
title('Input');
xlabel('Time');
ylabel('Amplitude');
savefig(h,strcat(filename,'_Time.fig'),'compact');

h = figure(2);
plot(f,2*l(1:NFFT/2+1));
title('FFT of Input');
xlabel('Frequency');
ylabel('Amplitude');
savefig(h,strcat(filename,'_FFT.fig'),'compact');

frequencies = [f',2*l(1:NFFT/2+1)];
save(strcat(filename,'_FFT_Frequency.mat'),'frequencies');


figure(3);
plot(x);
title('Output');
xlabel('Time');
ylabel('Amplitude');

figure(4);
plot(fx,2*k(1:NFFTx/2+1));
title('FFT of Output');
xlabel('Frequency');
ylabel('Amplitude');

% Write Audio File
%audiowrite('Re_Har.wav',x,fs)
clc;
clear;

load 'Coefficients.mat';

len_t = length(t);

sum = zeros(1,len_t);
row_f1 = size(frequency,1);

for i  = 1:row_f1
    cnt = 1;
    y = coefficients(i,:).*cos(2*pi*frequency(i,1)*t);
%     for j = 1:64:len_t-1
%         
%         y(j:j+63) = b1(i,cnt)*y(j:j+63);
%         
%         cnt = cnt + 1;
%     end
    
    sum = sum + y;
    
end

sum = real(sum)/60;

% Generating Linespace for Envelope
T = len_t;

T1 = round(0.10*T);
T2 = round(0.30*T);
T3 = round(0.40*T);
T4 = round(0.20*T);

L1 = linspace(0,1,T1);
L2 = linspace(1,0.7,T2);
L3 = linspace(0.7,0.7,T3);
L4 = linspace(0.7,0,T4);

a = [L1 L2 L3 L4];

sum = a.*sum;

plot(sum);

audiowrite('C4_Generated.wav',sum,fs);
clc;
clear;

load 'Coefficients.mat';

t1 = 0:1/fs:7.4566;
t1 = t1(1:length(t));

figure;
subplot(4,3,1);
plot(t1,real(coefficients(1,:)));

subplot(4,3,2);
plot(t1,real(coefficients(21,:)));

title('Envelope of the Frequency Components');

subplot(4,3,3);
plot(t1,real(coefficients(45,:)));

subplot(4,3,4);
plot(t1,real(coefficients(75,:)));

subplot(4,3,5);
plot(t1,real(coefficients(107,:)));

subplot(4,3,6);
plot(t1,real(coefficients(147,:)));

subplot(4,3,7);
plot(t1,real(coefficients(183,:)));

subplot(4,3,8);
plot(t1,real(coefficients(244,:)));

subplot(4,3,9);
plot(t1,real(coefficients(262,:)));

subplot(4,3,10);
plot(t1,real(coefficients(305,:)));

subplot(4,3,11);
plot(t1,real(coefficients(325,:)));

subplot(4,3,12);
plot(t1,real(coefficients(352,:)));
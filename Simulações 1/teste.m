clc
clear
close all

periodo_amostragem=1/2400;

eixo_y=sind(0:0.01:1000);
eixo_y2=cosd(0:0.01:1000);

%Define number of samples to take
f_amostragem = 2400; %Hz
fs = length(eixo_y);
fs2 = length(eixo_y2);


% Take fourier transform
fftSignal = fft(eixo_y);
fftSignal2 = fft(eixo_y2);

%Apply fftshift to put it in the form we are used to (see documentation)
fftSignal = fftshift(fftSignal);
fftSignal2 = fftshift(fftSignal2);

%Next, calculate the frequency axis, which is defined by the sampling rate
f = fs/2*linspace(1,1,fs);
f2= fs2/2*linspace(-1,1,fs2);
%Since the signal is complex, we need to plot the magnitude to get it to
%look right, so we use abs (absolute value)
figure;
plot(f,  mag2db(abs(fftSignal)),f2, mag2db(abs(fftSignal2)));
title('FFT 120 Hz');
xlabel('Frequencia (Hz)');
ylabel('Magnitude (dB)');
xlim([0 1000]);
legend("Puro","Faseado")
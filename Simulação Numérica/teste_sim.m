%Define number of samples to take
t_teste=10;
t_teste2=10;
fs = length(simout.data(:,1));
fs2 = length(simout.data(:,1));


% Take fourier transform
fftSignal = fft(simout.data(:,1));
fftSignal2 = fft(simout.data(:,2));

%Apply fftshift to put it in the form we are used to (see documentation)
fftSignal = fftshift(fftSignal);
fftSignal2 = fftshift(fftSignal2);

%Next, calculate the frequency axis, which is defined by the sampling rate
f = fs/(2*t_teste)*linspace(-1,1,fs);
f2= fs2/(2*t_teste2)*linspace(-1,1,fs2);
%Since the signal is complex, we need to plot the magnitude to get it to
%look right, so we use abs (absolute value)
figure;
plot(f,  mag2db(abs(fftSignal)),f2, mag2db(abs(fftSignal2)));
title('FFT Simulação');
xlabel('Frequencia (Hz)');
ylabel('Magnitude (dB)');
xlim([0 1000]);
legend("Ruído sem Controle","Ruído Conttrolado")
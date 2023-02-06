clc
clear

%Carregando Dados
load('RB50_460Hz_puro');
load('RB50_460Hz');

for i=1:length(RB50_460Hz_puro.Y(2).Data)
    eixo_x(i)=RB50_460Hz_puro.X(1).Data(i);
    eixo_y(i)=RB50_460Hz_puro.Y(2).Data(i);
end
    t_teste=eixo_x(length(RB50_460Hz_puro.Y(2).Data));

for i=1:length(RB50_460Hz.Y(2).Data)
    eixo_x2(i)=RB50_460Hz.X(1).Data(i);
    eixo_y2(i)=RB50_460Hz.Y(2).Data(i);
end
    t_teste2=eixo_x2(length(RB50_460Hz.Y(2).Data));


plot(eixo_x,eixo_y,eixo_x2,eixo_y2)
title('Resposta no Tempo 350 Hz')
legend("Puro","Controlado")
xlim([0 .02])

%Define number of samples to take
f_amostragem = 2350; %Hz
fs = length(eixo_y);
fs2 = length(eixo_y2);


% Take fourier transform
fftSignal = fft(eixo_y);
fftSignal2 = fft(eixo_y2);

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
title('FFT 460 Hz Ruido Branco 50%');
xlabel('Frequencia (Hz)');
ylabel('Magnitude (dB)');
xlim([460-100 460+100]);
legend("Puro","Controlado")
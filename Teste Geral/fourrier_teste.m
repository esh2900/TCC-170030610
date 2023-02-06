clc
clear

%Carregando Dados
load('rec_p360');
load('rec_c360');

for i=1:length(rec_p360.Y(2).Data)
    eixo_x(i)=rec_p360.X(1).Data(i);
    eixo_y(i)=rec_p360.Y(2).Data(i);
end
    t_teste=eixo_x(length(rec_p360.Y(2).Data));

for i=1:length(rec_c360.Y(2).Data)
    eixo_x2(i)=rec_c360.X(1).Data(i);
    eixo_y2(i)=rec_c360.Y(2).Data(i);
end
    t_teste2=eixo_x2(length(rec_c360.Y(2).Data));


plot(eixo_x,eixo_y,'r',eixo_x2,eixo_y2,'b')
title('Resposta no Tempo 360 Hz')
legend("Puro","Controlado")
xlim([0 .05])
xlabel('tempo (s)')
ylabel('Amplitude (V)')

%Define number of samples to take
f_amostragem = 2360; %Hz
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
plot(f,  mag2db(abs(fftSignal)),'r',f2, mag2db(abs(fftSignal2)),'b');
title('FFT 360 Hz');
xlabel('Frequencia (Hz)');
ylabel('Magnitude (dB)');
ajuste= 1e2;
xlim([360-ajuste 360 + ajuste]);
legend("Puro","Controlado")
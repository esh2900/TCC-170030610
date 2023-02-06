clc
clear
close all

periodo_amostragem=1/2400;
data=load('rec4_700Hz_Mu04_a999');

for i=1:length(data.rec4_700Hz_Mu04_a999.Y(1).Data)
    eixo_x(i)=data.rec4_700Hz_Mu04_a999.X(1).Data(i);
    eixo_y(i)=data.rec4_700Hz_Mu04_a999.Y(1).Data(i);
end
    t_teste=eixo_x(length(data.rec4_700Hz_Mu04_a999.Y(1).Data));
data=load('rec4_700Hz_sem_controle');

for i=1:length(data.rec4_700Hz_sem_controle.Y(1).Data)
    eixo_x2(i)=data.rec4_700Hz_sem_controle.X(1).Data(i);
    eixo_y2(i)=data.rec4_700Hz_sem_controle.Y(1).Data(i);
end
    t_teste2=eixo_x2(length(data.rec4_700Hz_sem_controle.Y(1).Data));

plot(eixo_x,eixo_y,eixo_x2,eixo_y2)
title('Resposta no Tempo')
legend("Controlado","Sem Controle")
xlim([0 .05])

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
f = fs/(2*t_teste)*linspace(-1,1,fs);
f2= fs2/(2*t_teste2)*linspace(-1,1,fs2);
%Since the signal is complex, we need to plot the magnitude to get it to
%look right, so we use abs (absolute value)
figure;
plot(f,  mag2db(abs(fftSignal)),f2, mag2db(abs(fftSignal2)));
title('FFT 700 Hz');
xlabel('Frequencia (Hz)');
ylabel('Magnitude (dB)');
xlim([0 900]);
legend("Controlado","Sem Controle")
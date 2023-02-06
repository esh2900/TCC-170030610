clc
clear

%Carregando Dados
load('RB_puro');
load('RB_ctrl');

for i=1:length(RB_puro.Y(2).Data)
    eixo_x(i)=RB_puro.X(1).Data(i);
    eixo_y(i)=RB_puro.Y(2).Data(i);
end
    t_teste=eixo_x(length(RB_puro.Y(2).Data));

for i=1:length(RB_ctrl.Y(2).Data)
    eixo_x2(i)=RB_ctrl.X(1).Data(i);
    eixo_y2(i)=RB_ctrl.Y(2).Data(i);
end
    t_teste2=eixo_x2(length(RB_ctrl.Y(2).Data));


plot(eixo_x,eixo_y,'r',eixo_x2,eixo_y2,'b')
title('Ruido Branco')
legend("Puro","Controlado")
xlim([0 .05])
xlabel('tempo(s)')
ylabel('Amplitude (V)')

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
plot(f,  mag2db(abs(fftSignal)),'r',f2, mag2db(abs(fftSignal2)),'b');
title('Ruido Branco');
xlabel('Frequencia (Hz)');
ylabel('Magnitude (dB)');
xlim([100 600]);
legend("Puro","Controlado")
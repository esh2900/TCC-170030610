clc
clear
close all

%Carregando Dados
load('RB06_160_puro');
load('RB06_160');

for i=1:length(RB06_160_puro.Y(2).Data)
    eixo_x(i)=RB06_160_puro.X(1).Data(i);
    eixo_y(i)=RB06_160_puro.Y(2).Data(i);
end
    t_teste=eixo_x(length(RB06_160_puro.Y(2).Data));

for i=1:length(RB06_160.Y(2).Data)
    eixo_x2(i)=RB06_160.X(1).Data(i);
    eixo_y2(i)=RB06_160.Y(2).Data(i);
end
    t_teste2=eixo_x2(length(RB06_160.Y(2).Data));


plot(eixo_x,eixo_y,eixo_x2,eixo_y2)
title('Resposta no Tempo 160 Hz')
legend("Puro","Controlado")
xlim([0 5])
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
plot(f,  mag2db(abs(fftSignal)),f2, mag2db(abs(fftSignal2)));
title('FFT 160 Hz Ruido Branco');
xlabel('Frequencia (Hz)');
ylabel('Magnitude (dB)');
xlim([160-100 160+100]);
legend("Puro","Controlado")


%% Sinal-Ruído
% Teste Puro
for i=1:length(RB06_160_puro.Y(6).Data)
    eixo_xRB(i)=RB06_160_puro.X(1).Data(i);
    sinal_y(i)=RB06_160_puro.Y(6).Data(i);
    ruido_y(i)=RB06_160_puro.Y(5).Data(i);
end

    figure;
    plot(eixo_xRB,sinal_y,eixo_xRB,ruido_y)
    title('Sinal Ruído - Teste Puro')
    legend("Sinal","Ruído")
    xlim([0 .02])
    
% Teste Controlado
    for i=1:length(RB06_160.Y(6).Data)
        eixo_x2RB(i)=RB06_160.X(1).Data(i);
        sinal_y2(i)=RB06_160.Y(6).Data(i);
        ruido_y2(i)=RB06_160.Y(5).Data(i);
    end
    
    figure;
    plot(eixo_x2RB,sinal_y2,eixo_x2RB,ruido_y2)
    title('Sinal Ruído - Teste Controlado')
    legend("Sinal","Ruído")
    xlim([0 .02])
    
%% Ruido Matlab
    for i=1:length(RB06_160.Y(6).Data)
        eixo_xML(i)=RB06_160.X(1).Data(i);
        sinal_yML(i)=RB06_160.Y(4).Data(i);
    end
    
    teste=-sinal_y2+ruido_y2;
    
    figure;
    plot(eixo_xML,sinal_yML,eixo_x2RB,teste)
    title('Sinal Resultante MatLab - Controlado')
    legend("Matlab", "Soma dos Sinais")
    xlim([0 .02])

 disp(rms(eixo_y)-rms(eixo_y2));
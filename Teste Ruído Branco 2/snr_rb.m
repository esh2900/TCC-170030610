clc
clear

%Carregando Dados
load('RB06_270_puro');
load('RB06_270');

%% SNR

for i=1:length(RB06_270_puro.Y(6).Data)
    sinal(i)=RB06_270_puro.Y(6).Data(i);
    ruido(i)=RB06_270_puro.Y(5).Data(i);
end
    k=06e-1;%Ajuste do Ganho
    snr(sinal,k*ruido)
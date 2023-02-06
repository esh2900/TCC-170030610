clc
clear

%Definição de Variáveis
periodo_amostragem=4.1667e-04;
Freq=80:10:600; %Frequências Analisadas

d=dir('*.mat');  % all .txt files in working directory
N=length(d);

%Sinais Controlados
for i=1:(N/2)
    %Acessando os valores dos arquivos e convertendo em formato acessível
    data=load(d(i).name);
    VarNames=fieldnames(data);
    MyVarName=VarNames{1};
   
    
    for j=1:length(data.(MyVarName).Y(2).Data)
        eixo_y(j)=data.(MyVarName).Y(2).Data(j);
    end
    
    Controlado_rms(i)=rms(eixo_y);
    clear('eixo_y');
    clear(d(i).name);
end

%Sinais Puros
for i=(N/2+1):N
    %Acessando os valores dos arquivos e convertendo em formato acessível
    data=load(d(i).name);
    VarNames=fieldnames(data);
    MyVarName=VarNames{1};
   
    
    for j=1:length(data.(MyVarName).Y(2).Data)
        eixo_y(j)=data.(MyVarName).Y(2).Data(j);
    end
    index=int32(i-N/2);
    Puro_rms(index)=rms(eixo_y);
    clear('eixo_y');
    clear(d(i).name);
end


plot(Freq,Puro_rms,'-or',Freq,Controlado_rms,'-ob')
title('RMS dos Sinais')
xlabel('Frequência de Teste(Hz)')
ylabel('RMS')
legend('Sinal Puro','Sinal Controlado')
xlim([70 610]);
grid on

    
clc
clear

%Carregando Dados
load('rec_p450');
load('rec_c450');

for i=1:length(rec_c450.Y(2).Data)
    eixo_x(i)=rec_c450.X(1).Data(i);
    eixo_y(i)=rec_c450.Y(2).Data(i);
end
   
for i=1:length(rec_c450.Y(3).Data)
    eixo_x2(i)=rec_c450.X(1).Data(i);
    eixo_y2(i)=rec_c450.Y(3).Data(i);
end


plot(eixo_x2,eixo_y2,eixo_x,eixo_y)
title('Resposta Controlada no Tempo 450 Hz')
legend("Referencia","Erro")
xlim([0 .02])
t=1;
amplitude = [1 1 1 2 2];
frequency = [200 250 350 500 600];

wave=zeros(length(frequency));

wave=amplitude.*sin(frequency*t);

NAmp = sum(wave);
[x,Fe] = audioread('Cplus4.wav'); 
B = 8000;
%Represenation par points 
figure(1);
plot(x); 
title('representation par points'); 
xlabel('Echantillon'); 
ylabel('Amplitude');

%Representation temporelle 
Te = 1/Fe; 
N = length(x);
t = ( 0 : Te : (N-1)*Te); 
figure(2); 
plot(t,x); 
title('Representation temporelle'); 
xlabel('t'); 
ylabel('x(t)'); 

%Representation du spectre 
f= 0 : Fe/N : (N-1)*Fe/N; 
ffx = fft(x); 
Gain1 = 20*log10(abs(ffx)); 
figure (3);
plot(f,Gain1); 
title('Representation de la TFD de x(t)'); 
xlabel('Frequence [Hz]');
ylabel('Gain [dB]'); 

% Representation du signal modulé 
xm = x.*cos(2*pi*B*t)';
ffxm = fft(xm); 
Gain2 = 20*log10(abs(ffxm)); 
figure(4); 
plot(f,Gain2); 
title('Representation de la TFD de xm(t) après modulation de frèquence B');
xlabel('Frequence [Hz]'); 
ylabel('Gain [dB]'); 

%filtre et demodulation 
[n,wp]= ellipord(2*(B/Fe),2*(B/Fe)+0.01,1,80);
[b,a]=ellip(n,1,80,wp);
y = filter(b,a,xm); 
Gain3 = 20*log10(abs(y)); 
figure(5) 
plot(f,Gain3);
sound(y,Fe); 
title('Spectre TFD de y(t) après filtrage'); 
xlabel('Frequence [dB]'); 
ylabel('Gain [dB]');




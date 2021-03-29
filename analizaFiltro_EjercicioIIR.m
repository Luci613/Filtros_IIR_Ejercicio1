function analizaFiltro_EjercicioIIR(b,a,fs)

%% Respuesta  en  frecuencia
N = 2^13; % Numero  de  puntos
f=linspace(0,fs/2,N);
H=freqz(b,a,f,fs); %La salida de freqz es H y fa
%% Atenuacion
alpha=-20*log10(abs(H)/max(abs(H)));
%% Retardo  de fase
o=2*pi*f/fs; %Omega
rf=phasedelay(b,a,o); 
%% Retardo  de grupo
rg=grpdelay(b,a,o);

%% Respuesta impulsional

Nh=100; % nº de muestras
d=zeros(1,Nh);% Creamos array de ceros
d(1)=1; % Generamos la delta
h=filter(b,a,d);
n=(0:length(h)-1);

%% Modulo |H(f)|
subplot(321);plot(f,abs(H)); xlabel('frecuencia(Hz)');grid on; title('|H(f)|');

%% Atenuacion
subplot(322);plot(f,alpha);xlabel('frecuencia (Hz)');grid on;title('\alpha (dB)');

%% Retardo  de fase
subplot(323);plot(f,rf);xlabel('frecuencia (Hz)');grid on;title('Retardo de fase: \tau_f (f)');

%% Retardo  de grupo
subplot(324);plot(f,rg);xlabel('frecuencia (Hz)');grid on;title('Retardo de grupo: \tau_g (f)');

%% Diagrama polo-cero
subplot(325); zplane(b,a);xlabel('Parte Real'); ylabel('Parte Imaginaria');grid on; title('Diagrama Polo-Cero');

%% h[n] (respuesta impulsional)
subplot(326);plot(n,h);stem(n,h,'.');xlabel('Muestras (n)');grid on;title('h[n]');
end
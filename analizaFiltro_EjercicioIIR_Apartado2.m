function analizaFiltro_EjercicioIIR_Apartado2(b,a,fs)

%% Respuesta  en  frecuencia
N = 2^13; % Numero  de  puntos
f=linspace(0,fs/2,N);
H=freqz(b,a,f,fs); %La salida de freqz es H y fa
%% Atenuacion
alpha=-20*log10(abs(H)/max(abs(H)));

%% Respuesta impulsional

Nh=100; % nº de muestras
d=zeros(1,Nh);% Creamos array de ceros
d(1)=1; % Generamos la delta
h=filter(b,a,d);
n=(0:length(h)-1);

%% Modulo |H(f)|
subplot(311);plot(f,abs(H)); xlabel('frecuencia(Hz)');grid on;title('|H(f)|');

%% Atenuacion
subplot(312);plot(f,alpha);xlabel('frecuencia (Hz)');grid on;title('\alpha (dB)');

%% h[n] (respuesta impulsional)
subplot(313);plot(n,h);stem(n,h,'.');xlabel('Muestras (n)');grid on;title('h[n]');

end
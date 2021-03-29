function mostrarFiltro_EjercicioIIR

%% Este script está relacionado con analizaFiltro_EjercicioIIR.m

%% Ejercicios para casa
%% Ejercicio 1: Filtros IIR

fs = 8000 ; % Frecuencia de muestreo de los filtros; Frecuencia de audio

%% 1. Filtro eliptico pasobajo de mínimo orden. 

fcp=2000; % Ffrecuencia banda de paso
alphaP=1; % Atenuacion máxima banda paso bajo
fcs=2500; % Frecuencia banda eliminada
alphaS=30; % Atenuadación mínima banda eliminada

[n,wp] = ellipord(2*fcp/fs, 2*fcs/fs, alphaP,alphaS);         
[b,a] = ellip(n,alphaP,alphaS,wp,'low');                      

figure('Name', '1. Filtro paso bajo elíptico de mínimo orden');
analizaFiltro_EjercicioIIR(b,a,fs);

%% 2. Filtro Chebyschev pasobanda de orden 10.

n=6; % Orden 6
fcp1=300; % Frecuencia banda de paso 1
fcp2=3400; % Frecuencia banda de paso 2
alphaP=1; % Atenuación de la banda de paso

wp=[2*fcp1/fs,2*fcp2/fs];
[b,a]=cheby1(n,alphaP,wp,'bandpass');

figure('Name', '2. Filtro pasobanda Chebyschev de orden 10');
analizaFiltro_EjercicioIIR_Apartado2(b,a,fs);

%% 3. Filtro inverso-chebyschev pasoalto de mínimo orden.

fcs=1500; % Frecuencia de la banda eliminada
alphaS=30; % Atenuación mínima banda eliminada
fcp=2000; % Frecuencia de la banda de paso
alphaP=1; % Atenuacion máxima banda paso bajo

[n,ws] = cheb2ord(2*fcs/fs, 2*fcp/fs, alphaP, alphaS)
[b,a] = cheby2(n,alphaS,ws,'high'); 

figure('Name', '3. Filtro pasoalto inverso-Chebyschev de mínimo orden');
analizaFiltro_EjercicioIIR(b,a,fs);


%% 4. Filtro butterworth banda eliminada de orden 6

n=6; %orden 6
f1=1500; %frecuencia 1
f2=2500; %frecuencia 2

ws=[2*f1/fs,2*f2/fs];
[b,a] = butter(n, ws, 'stop');

figure('Name', '4. Filtro banda eliminada Butterworth de orden 6');
analizaFiltro_EjercicioIIR(b,a,fs);


end
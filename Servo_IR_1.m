%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Sensor Sharp GP2Y0A21 IR   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Este codigo permite obtener la lectura del sensor IR para obtener una
% distancia y una representacion grafica de las distancias obtenidas.
% Además de emplear este sensor, emplearemos un servo que nos dara una
% visión de 180 grados

% El espacio de trabajo ha de ser en cartesiano

clear all
close all
clc

%% Configuración del arduino
a = arduino ('COM3','Mega2560','Libraries','Servo'); 
    % Pins que se emplearan en esta adquisicion
    PinServo = 'D8';
    PinIr = 'A0';
s = servo(a,PinServo, 'MinPulseDuration', 1e-3, 'MaxPulseDuration', 2e-3);

% Variables necesarias en el proceso
vector = zeros(1,20);
j = 1;
distance = 0;
w = 5; % Valor incremental de movimiento del servo
r = 180/(100/w); % Valor incemental para las coordendas polares
   
%%  Lectura del sensor 
for i = 0:w:100 % rotar desde el valor 0% hasta el 100%
    writePosition(s,i/100); % Pasar de % a valor normal form 100% to 1
    pause (0.1) % Pequeña pausa para asegurar el posicionamiento del sensor
    vector(1,j)= IR (a,PinIr); % Almacena el valor en un vector 
    j = j + 1; % Contador para almacenar valores en el vector
    %pause (0.1)
end

j = 1;
%% Representacion grafica del espacio capturado en unidades polares
figure
polar(deg2rad(0:r:180),vector)
hold on
polar (0,0,'ob')
title ('Visión del espacio del robot')
xlabel('Radio (cm)')
ylabel('Ángulo (º)')
legend ('Espacio','Robot')




  
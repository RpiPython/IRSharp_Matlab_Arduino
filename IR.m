function [distance] = IR (a,Puerto)
% Esta funcion controla el sensor IR. Su cometido es leer los datos del
% puerto anal�gico y devolver la solucci�n en modo de distancia

% Variables necesarias
  Volts = 0;
  distancia = 0;
%% Datos del sensor, curva de funcionamiento
table_data = [0 3.2 2.25 1.75 1.25 1 0.9 0.85 0.75 0.65 0.6 0.55 0.5];
breakpoints = [0 5 10 15 20 25 30 35 40 45 50 55 60] ;
  
%% lecutra del puerto anal�gico
   Volts = readVoltage(a, Puerto);
   distancia = interp1(table_data,breakpoints,Volts);
   if isnan(distancia) == 1
       distancia = 0;
   end
    % Saturador de distancia. Se ha dictado que el m�ximo alcance del
    % sensor se de 30 cm, dadas sus caracter�sticas
    if distancia > 30
        distance = 30;
    elseif distancia < 10 % Saturador de disancia m�nima 
        distance = 10;
    else 
        distance = distancia;
    end
   

  



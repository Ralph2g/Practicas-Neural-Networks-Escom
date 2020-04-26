clc
epochMax = 5;
Eepoch = 0.01;
alpha = 0.2;
flag = 1;
while flag == 1
    disp("Hola, Bienvenido a la red Adaline\n");
    opt = input('Seleccione 0 Modo REGRESOR 1 modo CLASIFICADOR otro SALIR\n');
    if opt == 0
        disp('Selecciono la red en modo REGRESOR');
        load('codificador8bits.txt');
        %Iniamos los pesos entre -1 y 1
        W = -1 + 0.1.*rand(size(load,1),1);
        disp(W);
        load('')
        
    elseif opt == 1
        disp('Selecciono la red en modo CLASIFICADOR');
    else
        break;
    end 
end


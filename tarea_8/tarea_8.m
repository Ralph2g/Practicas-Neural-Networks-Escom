disp("Este programa realiza una propagaci�n hacia delante por medio de un arquitectura de una red Neuronal dise�ada por 2 vectores de entrada\n")
disp("Ingrese el vector de entrada v1:");
disp("Este vector tiene como entrada el n�mero de neuronas en cada capa");
disp("Ejemplo: [2,3,1]");
v1 = input("\n");
disp("Ingrese el vector de entrada v2:");
disp("Este vector tiene como entrada la funci�n de transferencia en cada capa");
fprintf("N�mero que representa a cada funci�n: \n 1. Purelin \n 2. Logsig \n 3. Tansig \n");
disp("ejemplo: [2,3,1]");
v2 = input("\n");
disp("Creando Vectores v1 y v2 ...");

p = 2:-.1:-2;

disp("Este programa realiza una propagación hacia delante por medio de un arquitectura de una red Neuronal diseñada por 2 vectores de entrada\n")
disp("Ingrese el vector de entrada v1:");
disp("Este vector tiene como entrada el número de neuronas en cada capa");
disp("Ejemplo: [2,3,1]");
v1 = input("\n");
disp("Ingrese el vector de entrada v2:");
disp("Este vector tiene como entrada la función de transferencia en cada capa");
fprintf("Número que representa a cada función: \n 1. Purelin \n 2. Logsig \n 3. Tansig \n");
disp("ejemplo: [2,3,1]");
v2 = input("\n");
disp("Creando Vectores v1 y v2 ...");

p = 2:-.1:-2;

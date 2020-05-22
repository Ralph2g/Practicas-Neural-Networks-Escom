function [v1,v2,M,Mm] = introducir_vec(R)
    disp("Indique la arquitectura del MLP");
    disp("Ingrese el numero de S (neuronas max 10) del vector v1: [1 s1 1] o [1 s1 s2 1] ");
    disp("Ejemplo: [2,3] ó [1]");
    v1 = input("\n");
    disp("Ingrese num (valor de funcion de transferencia) de cada capa oculta de v2: [num 1] o [num num 1]");
    fprintf("Número que representa a cada función: \n 1. Purelin \n 2. Logsig \n 3. Tansig \n");
    disp("ejemplo: [2,3] ó [1]");
    v2 = input("\n");
    while ( size(v1,2) ~= size(v2,2) ) || ( ( sum(v1(:)==0 ) + sum(v2(:)==0 )) > 0  ) || ( ( sum(v1(:)>10 ) + sum(v2(:)>3 )) > 0 )
        fprintf("\n¡¡¡¡¡¡Algún valor/valores de los vectores v1 o v2 son incorrectos!!!!!!!!!\n\n")
        disp("Ingrese el numero de S (neuronas max 10) del vector v1: [1 s1 1] o [1 s1 s2 1] ");
        disp("Ejemplo: [2,3] ó [1]");
        v1 = input("\n");
        disp("Ingrese num (valor de funcion de transferencia) de cada capa oculta de v2: [num 1] o [num num 1]");
        fprintf("Número que representa a cada función: \n 1. Purelin \n 2. Logsig \n 3. Tansig \n");
        disp("ejemplo: [2,3] ó [1]");
        v2 = input("\n");
    end
    disp("Creando Vectores v1 y v2 ...");
    M = size(v1,2)+1;
    Mm = 0:M-1;
    v1 = [R v1 1];
    v2 = [v2 1];
    disp("v1 quedó de la siguiente manera:")
    disp(v1);
    disp("v2 quedó de la siguiente manera:")
    disp(v2);
    disp("Valor de M");
    disp(M);
    disp("valor de m");
    disp(Mm);
end
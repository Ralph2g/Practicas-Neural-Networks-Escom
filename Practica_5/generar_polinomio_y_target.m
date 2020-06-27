function [] = generar_polinomio_y_target()
    %% Introducción de valores para generar los vectores polinomios de entrada y de salida
    disp("Introduzca el rango");
    disp("Ejemplos:");
    disp("  [2.7, 7.5]");
    rango = input("\n");
    p = linspace(rango(1),rango(2),100)';
    disp("Introduzca la ecuación de G(p):");
    disp("Ejemplos:");
    disp("  sin(p)+sin((10/3).*p)");
    disp("  sin(p)+sin((10/3).*p)+log(p)-(0.84.*p)+3");
    t = input("\n");
    %% Guardamos en los archivos correspondientes para que sean usados en el MLP
    fileID = fopen('Polinomio_Entrada.txt','w');
    fprintf(fileID,'%f\n',p);
    fclose(fileID);
    fileID = fopen('Polinomio_Target.txt','w');
    fprintf(fileID,'%f\n',t);
    fclose(fileID);
    %% Desplegamos nuestros vectores generados y tambien su tamaño para corroborar
    disp("Numero de puntos generados en p");
    disp(size(p,1));
    disp("Numero de puntos generados en t");
    disp(size(t,1));
    disp("Desplegando p");
    disp(p)
    disp("Desplegando t");
    disp(t)
end 
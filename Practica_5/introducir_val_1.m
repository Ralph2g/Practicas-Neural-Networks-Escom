function [X,y,r] = introducir_val_1()
    aux = input("Introduzca el nombre del archivo del vector p \n01_Polinomio_Entrada.txt\n",'s');
    X = load(aux);
    aux = input("Introduzca el nombre del archivo del vector t \n01_Polinomio_Target.txt\n",'s');
    y = load(aux);
    %Indicaci�n del rango de la se�al [-2 2]
    r = input("Introduzca el rango de valores del polinomio \n[-2,2]\n");
end
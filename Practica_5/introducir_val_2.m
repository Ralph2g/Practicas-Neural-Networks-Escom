function [alpha,epochMax,eepoch,epochval,numVal] = introducir_val_2()
    alpha = 0;
    eepoch = 0;
    while(~((0.1 > alpha)&&(alpha > 0.00099)) )
        alpha = input("Introduzca alpha \n  Valor menor  1x10 -2 y mayor o igual a  1x10 -4 \n"); 
    end
    epochMax = input ("Introduzca n�mero de epocas \n");
    %introduce eepoch 0.0001 a 0.00001
    while(~((0.001 > eepoch)&&(eepoch > 0.0000099)) )
        eepoch = input("Introduzca alpha \n  Valor menor a 1x10 -3 y mayor o igual a 1x10 -5 \n"); 
    end
    epochval = round(epochMax*.1);
    disp("El valor de EpochVal qued� en:")
    disp(epochval);
    numVal = input("ingrese numval\n");
    disp(numVal);
end
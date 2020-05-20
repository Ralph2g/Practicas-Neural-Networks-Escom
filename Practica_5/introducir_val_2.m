function [alpha,epochMax,eepoch] = introducir_val_2()
    alpha = 0;
    eepoch = 0;
    while(~((0.1 > alpha)&&(alpha > 0.00099)) )
        alpha = input("Introduzca alpha \n  Valor entre 1x10 -2 a 1x10 -4 \n"); 
    end
    epochMax = input ("Introduzca número de epocas \n");
    %introduce eepoch 0.0001 a 0.00001
    while(~((0.001 > eepoch)&&(eepoch > 0.0000099)) )
        eepoch = input("Introduzca alpha \n  Valor entre 1x10 -2 a 1x10 -4 \n"); 
    end

end
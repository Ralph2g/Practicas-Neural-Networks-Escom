clear ; close all; clc
W_2 = 0;
b_2 = 0;
disp("Hola,  bienvenido al MLP  de Rafael Garcia Garcia");
disp("Antes de iniciar me gustaria saber si quieres introducir una ecuaci�n?");
fprintf("\n 1. Introducir ecuacion \n 2. Valores predeterminados");
ecuacion = input("\n");
if ecuacion == 1
    generar_polinomio_y_target();
end
disp("Dinos que deseas realizar:");
modo = 0;
while ~( (modo == 1 ) || (modo == 2))
    fprintf("\n 1. Continuar aprendizaje\n 2. Nuevo entrenamiento")
    modo = input("\n");
end

%Ejecuci�n escalonada (max 300 epoc)
if modo == 2
    disp("Antes de iniciar nuestra red neuronal necesitamos algunos datos...");
    d_pred = input("(Presione 1 para usar los predeterminados)\n",'s');
    if d_pred ~= "1"
        %Datos de entrada p t rango
        [X_all,t,rang] = introducir_val_1();
        R = size(X_all,2);
        %Separar el dataset en 3 subconjuntos (3 p y 3 t)
        [p,pval,ptest,t,tval,t_test] = div_dataset(X_all,t);
        %Entrada de vectores de la arquitectura
        % max 2 capas ocultas y 10 neuronas
        [v1,v2,M,Mm] = introducir_vec(size(p,1));
        %Introduce alpha entre 1x10 -2 a 1x10 .4
        [alpha,epochMax,eepoch,epochval,numVal] = introducir_val_2();
    else
        load('config.mat');
    end
    activate = size(v2,2)>2;
    disp("Perfecto, ya acabamos de cargar la informaci�n necesaria para trabajar");
        %%Nuevo aprendizaje
        %Iniciar valores MLP aleatoriamente 
        %1 capa oculta
        limpiar_archivos();
        W_1 = rang(1) + (rang(2)-rang(1))*rand(v1(2),v1(1));
        b_1 = rang(1) + (rang(2)-rang(1))*rand(v1(2),1);
        a_0 = p;
        a_1 = zeros(m,v1(2));
        %2 capas ocultas
        if activate
            %Capa de salida
            W_2 = rang(1) + (rang(2)-rang(1))*rand(v1(end-1),v1(end-2));
            b_2 = rang(1) + (rang(2)-rang(1))*rand(v1(end-1),1);
            a_2 = zeros(m,v1(end-1));
        end
        a_s = zeros(m,v1(end));
        W_s = rang(1) + (rang(2)-rang(1))*rand(v1(end),v1(end-1)); 
        b_s = rang(1) + (rang(2)-rang(1))*rand(v1(end),1); 
        epocaActual = 2;
        %Se inicializan todos los valores de pesos y bias de la RNA con valores aleatorios entre -1 y +1
else
        load('datos.mat');
        epocaActual = epochMax + 1;
        disp("El anterior aprendizaje lleg� hasta la epoca:");
        aux = epocaActual-1;
        disp(epochMax);
        epochMax = input('Ingrese el n�mero de epocas adicionales que desea realizar \n');
        epochval = floor(linspace(round(epochMax*.1),epochMax,10)) + (aux);
        %Archivo de Valores Finales Diferente al archivo que almacena
        epochMax = epochMax + aux;
        %evoluci�n de pesos y bias 3000 epc x 100 datos = graf 300,000
end
%%=======================ENTRENAMIENTO=====================%%
a = zeros(m,1);
error = zeros(m,1);
bandera = 0;
val_error_anterior = 1000;
m_val = size(pval,1);
error_val = zeros(m_val,1);
a_val = zeros(m,1);
val_error = 0;
%Se verifica si es una epoca de validacion
for  e = epocaActual : epochMax
    
    if ~ismember(e,epochval)
    %Si es epoca de entrenamiento
        for i = 1 : m
            %Propagaci�n hacia adelante
            a_1 = feedforward(W_1,p(i,:),b_1,v2(1));
            if activate
                a_2 = feedforward(W_2,a_1,b_2,v2(end-2));
                a_s = feedforward(W_s,a_2,b_s,v2(end));
            else
                a_s = feedforward(W_s,a_1,b_s,v2(end));
            end
            a(i) = a_s;
            %Error
            error(i) = sum( (a_s - t(i)).^2 )/v1(end);
            %verificaci�n del error
            %Se verifican criterios de finalizaci�n (epochmac o error)
            %Se aplican reglas de aprendizaje
            f_n_s = derivate(v2(end),v1(end),a_s);
            f_n_1 = derivate(v2(1),v1(2),a_1);
            s_s = -2.*(f_n_s).*( t(i)-a_s);
            if activate
                f_n_2 = derivate(v2(end-1),v1(end-1),a_2);
                s_2 = (f_n_2*W_s')*s_s;% 2x2 - 1x2 - 1x1
                s_1 = (f_n_1*W_2')*s_2;% 2x2 - 1x2 - 1x1
                W_s = W_s - alpha.*(s_s*a_2);
                b_s = b_s - alpha.*(s_s);
                W_2 = W_2 - alpha.*(s_2*a_1);
                b_2 = b_2 - alpha.*(s_2);
            else
                s_1 = (f_n_1*W_s')*s_s;% 2x2 - 1x2 - 1x1
                W_s = W_s - alpha.*(s_s*a_1);
                b_s = b_s - alpha.*(s_s);
            end
            W_1 = W_1 - alpha.*(s_1*a_0(i));
            b_1 = b_1 - alpha.*s_1; 
        end
        t_error = sum(error)/m;
        fprintf("Error: %f de la epoca %d \n",t_error,e);
        if (t_error<=eepoch) || (isnan(t_error))
            bandera =1;
        end
        %Se guardan valores de pesos y bias
    else %============= Si es epoca de validaci�n =============
        %Se propaga hacia adelante el conjunto de pruebas
        for i = 1 : m_val
                    %Se propaga hacia adelante con el conjunto de valiaci�n
                    a_1 = feedforward(W_1,pval(i,:),b_1,v2(1));
                    if activate
                        a_2 = feedforward(W_2,a_1,b_2,v2(end-2));
                        a_s = feedforward(W_s,a_2,b_s,v2(end));
                    else
                        a_s = feedforward(W_s,a_1,b_s,v2(end));
                    end
                    a_val(i) = a_s;
                    %Error de validaci�n
                    error_val(i) = sum( (a_s - tval(i)).^2 )/v1(end);
        end
        %Se calcula el error de prueba errorTest [0.001 0.0001]
        val_error = sum(error_val)/m_val;
        %Verificar si se cumple Numval
        if val_error > val_error_anterior%Si no se pasa la prueba de validaci�n 
            contador = contador + 1;
        else
            contador = 0;
        end     
        %Si es asi se termina el aprendizaje
        if contador == 3
            bandera=2;
        end
        val_error_anterior = val_error;
        %Si no se continua con otra epoca se recomienda iniciar nuevo
        %experimento
        guardar_W_b(W_1,W_2,W_s,b_1,b_2,b_s);
        %Se guarda error de entrenamiento y el error de aprendizaje 
        guardar_error(t_error,val_error,e);
    end
    
    if bandera == 1
        disp("La red convergi�");
        guardar_error(t_error,val_error,e);
        guardar_W_b(W_1,W_2,W_s,b_1,b_2,b_s);
        break;
    elseif bandera == 2
        disp("El algoritmo Early stopping detuvo el programa, la red no convergi�")
        guardar_error(t_error,val_error,e);
        guardar_W_b(W_1,W_2,W_s,b_1,b_2,b_s);
        break;
    end
    
end
save('datos.mat')
%%=======================PRUEBA DE GENERALIZACI�N================
m_test = size(ptest,1);
error_test = zeros(m_test,1);
a_test = zeros(m_test,1);
%Se propaga hacia adelante el conjunto de pruebas
for i = 1 : m_test
            %Propagaci�n hacia adelante
            a_1 = feedforward(W_1,ptest(i,:),b_1,v2(1));
            if activate
                a_2 = feedforward(W_2,a_1,b_2,v2(end-2));
                a_s = feedforward(W_s,a_2,b_s,v2(end));
            else
                a_s = feedforward(W_s,a_1,b_s,v2(end));
            end
            a_test(i) = a_s;
            %Error
            error_test(i) = sum((a_s - t_test(i)).^2)/v1(end);
end
%Se calcula el error de prueba errorTest [0.001 0.0001]
test_error = sum(error_test)/m_test;
if test_error <= 0.001
    disp("Prueba de generalizaci�n superada con un error de:");
    disp(test_error);
else
    disp("Prueba de generalizaci�n NO superada con un error de:")
    disp(test_error);
end

%Grafica de evoluci�in de aprendizaje y error de validaci�n 
graficar_error();
%Grafica de la evoluci�n de los pesos y de los bias  graficando cada
%del MLP (Si hay dos capas ser�n 2 gr�ficas)
graficar_evolucion(activate);
save('datos_finales.mat')
%Graficar Ytest(Circulos sin relleno) vs salida MLP (USar Cruz)
graficar_fun();
%pesos_y_bias_finales.txt con el mejor resultado con diversas arquitecturas
fileID = fopen('Valores_finales_pesos_y_bias.txt','w');
fprintf(fileID,"Error final\n");
fprintf(fileID,'%f\n',t_error);
fprintf(fileID,"Valores de pesos finales:\n");
fprintf(fileID,"W1:\n");
fprintf(fileID,'%f ',W_1);
fprintf(fileID,"\n b_1:\n");
fprintf(fileID,'%f ',b_1);
if activate
    fprintf(fileID,"\n W2:\n");
    fprintf(fileID,'%f ',W_2);
    fprintf(fileID,"\n b_2:\n");
    fprintf(fileID,'%f ',b_2);
    
    fprintf(fileID,"\n W3:\n");
    fprintf(fileID,'%f ',W_s);
    fprintf(fileID,"\n b_3:\n");
    fprintf(fileID,'%f ',b_s);
else
    fprintf(fileID,"\n W2:\n");
    fprintf(fileID,'%f ',W_s);
    fprintf(fileID,"\n b_2:\n");
    fprintf(fileID,'%f ',b_s); 
end
fprintf(fileID,"\n Vector de salida a:\n");
fprintf(fileID,'%f ',a);

disp("Error final")
disp(t_error);
disp("Valores de pesos finales:");
disp("W1");
disp(W_1);
disp("b_1");
disp(b_1);
disp("W_2")
disp(W_2);
disp("b_2");
disp(b_2);
disp("Vector de salida a:")
disp(a);
fclose(fileID);

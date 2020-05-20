clear ; close all; clc

disp("Hola,  bienvenido al MLP  de Rafael Garcia Garcia");
disp("Antes de iniciar nuestra red neuronal necesitamos algunos datos...");
d_pred = input("(Presione 1 para usar los predeterminados)\n",'s');
if d_pred ~= "1"
    %Datos de entrada p t rango
    [X_all,t,rang] = introducir_val_1();
    %Separar el dataset en 3 subconjuntos (3 p y 3 t)
    [p,pval,ptest,t,tval,ttest] = div_dataset(X_all,t);
    %Entrada de vectores de la arquitectura
    % max 2 capas ocultas y 10 neuronas
    [v1,v2] = introducir_vec();
    %Introduce alpha entre 1x10 -2 a 1x10 .4
    [alpha,epochMax,eepoch] introducir_val_2();
    alpha = input("Introduzca alpha \n()\n");
    %introduce epochMax 

    %introduce eepoch 0.0001 a 0.00001

    % epochval -> 10% de epochmax.

    % Nunval (Numero de veces que se pueda equivocar)

else
    
end
%Ejecución escalonada (max 300 epoc)

    % Preg si desea continuar  o un nuevo aprendizaje
    
    %%Nuevo aprendizaje
        
        %Iniciar valores MLP aleatoriamente 
        %Se inicializan todos los valores de pesos y bias de la RNA con valores aleatorios entre -1 y +1
    
    %%Retomar aprendizaje
        
        %Pide archivos con parametros
        
        
        %Archivo de Valores Finales Diferente al archivo que almacena
        %evolución de pesos y bias 3000 epc x 100 datos = graf 300,000
        


%%=======================ENTRENAMIENTO=====================%%

%Se verifica si es una epoca de validacion

%Si es epoca de entrenamiento
    
    %Propagacion hacia adelante
    
    %calculo del error del entrenamiento
    
    %Se aplican reglas de aprendizaje
    
    %Se verifican criterios de finalización (epochmac o error)
    
    
%Si es epoca de validación 

    %Se propaga hacia adelante con el conjunto de valiación
    
    %Error de validación
    
    %Verificar si se cumple Numval
        
        %Si es asi se termina el aprendizaje
        
        %Si no se continua con otra epoca se recomienda iniciar nuevo
        %experimento
    %Se guarda error de entrenamiento y el error de aprendizaje 
    %Se guardan valores de pesos y bias

%%=======================PRUEBA DE GENERALIZACIÓN================

%Se propaga hacia adelante el conjunto de pruebas

%Se calcula el error de prueba errorTest [0.001 0.0001]



%Grafica de evolucióin de aprendizaje y error de validación 

%Grafica de la evolución de los pesos y de los bias  graficando cada capa
%del MLP (Si hay dos capas serán 2 gráficas)

%Graficar Ytest(Circulos sin relleno) vs salida MLP (USar Cruz)


%pesos_y_bias_finales.txt con el mejor resultado con diversas arquitecturas


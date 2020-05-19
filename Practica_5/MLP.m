clear ; close all; clc

disp("Hola,  bienvenido al MLP  de Rafael Garcia Garcia");
disp("Antes de iniciar nuestra red neuronal necesitamos algunos datos...");
disp();

%Datos de entrada p t

%Indicaci�n del rango de la se�al [-2 2]

%Separar el dataset en 3 subconjuntos

%Funci�n que reciba el vector original de datos y regrese 3 vectores

%Entrada de vectores de la arquitectura

% max 2 capas ocultas y 10 neuronas

%Introduce alpha entre 1x10 -2 a 1x10 .4

%introduce epochMax 

%introduce eepoch 0.0001 a 0.00001

% epochval -> 10% de epochmax.

% Nunval (Numero de veces que se pueda equivocar)


%Ejecuci�n escalonada (max 300 epoc)

    % Preg si desea continuar  o un nuevo aprendizaje
    
    %%Nuevo aprendizaje
        
        %Iniciar valores MLP aleatoriamente 
        %Se inicializan todos los valores de pesos y bias de la RNA con valores aleatorios entre -1 y +1
    
    %%Retomar aprendizaje
        
        %Pide archivos con parametros
        
        
        %Archivo de Valores Finales Diferente al archivo que almacena
        %evoluci�n de pesos y bias 3000 epc x 100 datos = graf 300,000
        


%%=======================ENTRENAMIENTO=====================%%

%Se verifica si es una epoca de validacion

%Si es epoca de entrenamiento
    
    %Propagacion hacia adelante
    
    %calculo del error del entrenamiento
    
    %Se aplican reglas de aprendizaje
    
    %Se verifican criterios de finalizaci�n (epochmac o error)
    
    
%Si es epoca de validaci�n 

    %Se propaga hacia adelante con el conjunto de valiaci�n
    
    %Error de validaci�n
    
    %Verificar si se cumple Numval
        
        %Si es asi se termina el aprendizaje
        
        %Si no se continua con otra epoca se recomienda iniciar nuevo
        %experimento
    %Se guarda error de entrenamiento y el error de aprendizaje 
    %Se guardan valores de pesos y bias

%%=======================PRUEBA DE GENERALIZACI�N================

%Se propaga hacia adelante el conjunto de pruebas

%Se calcula el error de prueba errorTest [0.001 0.0001]



%Grafica de evoluci�in de aprendizaje y error de validaci�n 

%Grafica de la evoluci�n de los pesos y de los bias  graficando cada capa
%del MLP (Si hay dos capas ser�n 2 gr�ficas)

%Graficar Ytest(Circulos sin relleno) vs salida MLP (USar Cruz)


%pesos_y_bias_finales.txt con el mejor resultado con diversas arquitecturas


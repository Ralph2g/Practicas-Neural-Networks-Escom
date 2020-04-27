epochMax = 5;
Eepoch = 0.01;
alpha = 0.04;
flag = 1;
while flag == 1
    disp("Hola, Bienvenido a la red Adaline\n");
    opt = input('Seleccione 0 Modo REGRESOR 1 modo CLASIFICADOR otro SALIR\n');
    if opt == 0
        disp('Selecciono la red en modo REGRESOR');
        data = load('codificador8bits.txt');
        X = data(:,1:end-1);
        y = data(:,end);
        [m,R] = size(X);
        %Iniamos los pesos entre -1 y 1
        W = -1 + 2.*rand(R,1);
        epochMax = input('Introduzca el numero de epochMax\n')
        disp("Generando matriz de pesos...");
        e = zeros(m,1);
        a = zeros(m,1);
        for j = 1:epochMax
            
            disp("Epoca número: "+j);
            %Iniciamos las épocas de aprendizaje
            for i=1:m
                a(i) = X(i,:)*W;
                e(i) = y(i)-a(i);
                if(e(i) == 0)
                    continue;
                else
                    W = W + (2.*alpha.*e(i).*(X(i,:)'));
                end
            end
            error = abs(sum(e.^2))/m
            if error <= Eepoch
                flag = 0;
                disp("La red convergió")
                break
            end
            
        end
        
    elseif opt == 1
        disp('Selecciono la red en modo CLASIFICADOR');
        %Leer Datoss
        load input_p.txt
        load input_p_2.txt
        load target.txt
        load target_2.txt
        X = input_p_2;
        y = target_2;
        [m,R] = size(X);%R = rasgos
        S = size(y,2);%S = neuronas
        num_cls = m/2;
        disp("El numero de rasgos es: "+R);
        disp("El numero de clases ingresadas es: "+ num_cls);
        disp("El numero de neuronas necesarias es: "+ S);
        %Epocas de aprendisaje
        % Matriz de pesos  y bias%
        W = -1 + 2.*rand(S,R);
        b = -1 + 2.*rand(S,1);
        %Aqui empieza el aprendizaje
        %Solicitamos el numero de iteraciones
        CU=0;
        epochMax=input('Ingrese el numero de MAX_EPOCH:');
        e = zeros(m,S);
        a = zeros(m,S);
        error =zeros(m,1);
        %Calcular la salida de la red
        for j =1 :epochMax
            disp("Epoca número: "+j);
            for i = 1:m
                a(i,:) = (purelin(W*X(i,:)' + b))';
                %Calcular el error
                e(i,:) = y(i,:) - a(i,:);
                %Nuevos valores de los pesos y bias
                if e(i,:) == zeros(1,S)
                    error(i) = sum( e(i,:) );
                    continue;
                else
                    W = W + ( 2.*alpha.*e(i,:)'*X(i,:) );
                    b = b + ( 2.*alpha.*e(i,:)' );
                    error(i) = sum( e(i,:).^2 );
                end
            end
            suma_e = sum(error)/m
            %Criterios de finalización
            if suma_e <= Eepoch
                flag = 0;
                disp("La red convergió")
                break
            end            
        end
        if flag == 1
            disp("La red no convergió vuelva a intentarlo")
        end
    else
        flag = 2;
        break;
    end
end

if flag == 0
    disp("Los valores W  don los siguientes:\n")
    disp(W);
    disp("El valor de EEPOCH: \n");
    disp(error);
    
end
disp("Fin del programa espero verte printo :D")
%Grafica con valores de W y b
%Grafica de valores de eepoch

%Caso del clasificador, dibujar el dataset y sus fronteras de decisión 

opcion=input('Ingrese\n1.NOT\n2.AND\n3.OR\n');
%Se realiza la accion dependiendo la opcion
%Optenemos el conjunto de entrenamiento    

[dataSet,e]=d_de_verdad(opcion);

%Aprendisaje, prueba y error      
%Se le pregunta al usuario cuantas épocas desea realizar (epoch>50).
aprender(dataSet,e);

%FUNCION que obtiene el conjunto de entrenamiento (d) la cual 
%está dada por la arquitectura y modelo matematico de cada uno de los casos
function [d,e] = d_de_verdad(c)
    switch c
        %Compuerta NOT
        case 1
            d = [0,1;1,0];
            e = 1;
        %Compuerta AND
        case 2
            e=input('Ingrese la dimensión de la compuerta\n');
            d = zeros(2^e,e+1);%Se crea tabla vacia
            for i=1:(e+1)
                if i<e+1
                    zero=0;
                    uno=0;
                    for j=1:(2^e)
                        if j<=(zero+((2^e)/(2^i)))
                            d(j,i)=0;
                        else
                            uno=((2^e)/(2^i))+(zero+((2^e)/(2^i)));
                            if j<=uno
                                d(j,i)=1;
                            else
                                zero=uno;
                            end%if
                        end%if
                    end%for
                else
                    for j=1:2^e
                        d(j,i)=1;
                        for k=1:(e)
                            d(j,i)=d(j,i)*d(j,k);
                        end%for
                    end%for
                end%if
            end%for
        %Compuerta OR
        case 3
            e=input('Ingrese la dimensión de la compuerta\n');
            d = zeros(2^e,e+1);
            for i=1:(e+1)
                if i<e+1
                    zero=0;
                    uno=0;
                    for j=1:(2^e)
                        if j<=(zero+((2^e)/(2^i)))
                            d(j,i)=0;
                        else
                            uno=((2^e)/(2^i))+(zero+((2^e)/(2^i)));
                            if j<=uno
                                d(j,i)=1;
                            else
                                zero=uno;
                            end
                        end
                    end
                else
                    for j=1:2^e
                        for k=1:(e)
                            if d(j,k)==1
                                d(j,i)=1;
                            end
                        end
                    end
                end
            end
            %Aquí termina la creación de la d de verdad del OR
        %Opción invalida
        otherwise
            disp("Opción invalida")
            exit(1)
    end
end

%FUNCION Escribe los valores de mis variables en un archivo
function escribir_archivo(t)
    file=fopen(['val_finales','.txt'],'w');
    fprintf(file,'%s\n',t);
    fclose(file);
end

function aprender(tabla,entradas)
    epocas = num_epocas();
    while epocas ~= 0
        t=['Epocas pendientes: ',num2str(epocas),char(13)];
        disp(t);%mostramos en terminal la epoca
        w = zeros(1,entradas);%se crea la matriz de pesos
        %Para cada entrada se le asigna un peso
        for j=1:entradas
            w(1,j) = randi([-10 10],[1 1]);
            fprintf('Valor de W[%d]: %d \n',j, w(1,j));
            t=[t,'Entrada w[',num2str(j),'] = ',num2str(w(1,j)),char(13)];
        end%for
        theta(1,1) = randi([-10 10],[1 1]);%se crea el valor de theta
        fprintf('Valor del Umbral--: [%d]\n',theta(1,1));
        t=[t,'Umbral=',num2str(theta(1,1)),char(13)];%se guarda en la variable t el texto
        %Al terminar de meter los valores, se calcula n
        flag=0;
        for j=1:2^entradas%para cada entrada de la tabla
            n=0;
            if flag==0
                for k=1:entradas%se suman pesos*entrada(tabla)
                    n = n + (tabla(j,k)*w(1,k));
                end
                if n>theta(1,1)%Si el valor de la suma es mayor a theta es 1
                    a=1;
                else
                    a=0;
                end
                if a~=tabla(j,entradas+1)%si el resultado es diferente a la entrada definida
                    disp('Epoca fallida');
                    flag=1;
                    epocas= epocas-1;
                end
            end
        end%for
        if flag==0
            disp('Aprendizaje correcto');
            %el aprendizaje fue correcto, podemos hacer la creación del archivo .txt
            escribir_archivo(t);
            break
        elseif epocas == 0
            preg = input('Aprendisaje fallido :(\n¿Quieres intentarlo de nuevo? \n1 - si\notro-no\n');
            if preg == 1
                   epocas = num_epocas();
            end
        end

    end
end
function ne = num_epocas()
    ne = 0;
    while ne < 50
    ne = input("¿Cuantas epocas quiere realizar? (min 50) \n");
    end
end
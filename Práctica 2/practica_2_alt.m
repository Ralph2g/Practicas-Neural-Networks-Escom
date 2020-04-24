load w1.txt
load p_new.txt
load a2.txt

[s,r]=size(w1);
%Se crea el bias usando de base las medidas del vector W (Que contienelas clases)
bias=zeros(s,1);
for i=1:s
    bias(i,1)=r;
end
%Se calcula el a inicial
a1=w1*p_new+bias;
%Se abre el archivo de texto salidas limpiando lo que tenga para poder
%realizar la escritura
text = fopen('a2.txt','wt');
for i = 1:s
    fprintf(text,'%g\t',a1(i,:));
end
fprintf(text,'\n');
fclose(text);
%Se calcula Epsilon
epsilonlim=1/(s-1);
epsilon=epsilonlim/3;
iteracionesMAX=50;
%Se crea W2
MatrizEpsilon=zeros(s,s);
for i=1:s
    for j=1:s
        if i==j
            MatrizEpsilon(i,j)=1;
        else
            MatrizEpsilon(i,j)=epsilon*-1;
        end
    end
end
for T=0:iteracionesMAX
    bandera=0;
    a1=MatrizEpsilon*a1;
%Se aplica la función poslin de manera manual para poder manipularlos
%casos de la bandera
    for i=1:s
        if a1(i,1)>=0
            a1(i,1)=a1(i,1);%La salida es la misma
        else
            a1(i,1)=0;%Si es negativo, la salida es 0
            bandera=bandera+1;
        end
    end
    %SE GENERA EL ARCHIVO DE TEXTO CON LAS DIFERENTES ITERACIONES
    text = fopen('a2.txt','a');
    for i = 1:s
        fprintf(text,'%g\t',a1(i,:));
    end
    fprintf(text,'\n');
    fclose(text);
    if bandera==s-1
        
        disp('La red de Hamming convergió');
        for h=1:s
            if a1(h,1)~=0
            fprintf('Pertenece a la clase: %d \n',h);
            end
        end
    break;
    end
end
if bandera~=s-1
    disp('No hay convergencia en los datos');
end
%Se genera la gráfica con el archivo salidas.txt en el que se ha estado
%sobreescribiendo durante la ejecución
plot(a2,'b--o')
xlabel('Iteración')
ylabel('Valores de las neuronas')
load a2.txt
%Se despliega en pantalla el último valor de las salidas
disp('Neuronas:');
disp(a1);
%Se borran las variables que no aportan información a la ejecución del
%programa
clear bandera
clear ans
clear h
clear i
clear iteracionesMAX
clear j
clear text
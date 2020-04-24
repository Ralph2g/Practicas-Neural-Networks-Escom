load a2.txt
load p_new.txt
load w1.txt

%calculamos el bias dependiando de el número de clases o neuronas a
%trabajar
%s= neuronas
%r= caracteristicas
[s,r]=size(w1);
%Se crea vector vacio
bias=zeros(s,1);
for i=1:s
    bias(i,1)=r;%el numero de caracteristicas
end
%salida capa FEEDDOWARD
a1 = w1*p_new + bias;
%escribimos "a2"
text = fopen('a2.txt','wt');
for i=1:s
   fprintf("%g\t",a1(i,:));
end
fprintf(text,'\n');
fclose(text);

%Se calcula Epsilon
epsilonlim=1/(s-1);
iteraciones=100;
%Se calcula W2
w2=zeros(s,s);
for i=1:s
    epsilon=epsilonlim/round(10*rand);%epsilon en un num aleatorio
    for j=1:s
        if i == j
            w2(i,j)=1;
        else
            w2(i,j)=epsilon*-1;
        end
        
    end
end 

for E=1:iteraciones
    bandera=0;
    a1=w2*a1;
    %Se aplica la función poslin de manera manual para poder manipularlos
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
        disp('La red de Hamming convergió\n');
        %revisamos a que clase pertenece
        for h=1:s
            if a1(h,1)~=0
            fprintf('Pertenece a la clase: %d \n',h);
            end
        end
    break;
    end
end
if bandera~=s-1
    disp('No hay convergencia en los datos vuelva a ejecutar el programa');
end
%Se genera la gráfica con el archivo salidas.txt en el que se ha estado
%sobreescribiendo durante la ejecución
plot(a2,'r--*')
xlabel('Iteración')
ylabel('Valores de las neuronas')
load a2.txt
%Se despliega en pantalla el último valor de las salidas
disp('Neuronas:');
disp(a1);




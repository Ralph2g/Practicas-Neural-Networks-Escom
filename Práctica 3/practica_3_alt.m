load dataset.txt
[Fil,Col]=size(dataset);%Sacamos el tamaño del dataset que nos dan
Cla=Fil/2;%Numero de clases
S=ceil(log2(Cla));%Numero de neuronas
target=zeros(S,Cla);
d=zeros(2,0);
%Utilizamos lo siguiente para llenar los targets
[T,x] = size(target);
switch T
    case 1
        for i =1: 1
            for j = 1: Cla
                if mod(j,2)
                    target(1,j) = 0;
                else
                    target(1,j) = 1;
                end
            end
        end
    case 2
        for i =1: 1
            for j = 1: Cla
                if mod(j,2)
                    target(i,j) = 0;
                else
                    target(i,j) = 1;
                end
            end
        end
bandera = 0;
for i =1: 1
    for j = 1: Cla
        if bandera==2||bandera==3
            target(2,j) = 1;
        else
            target(2,j) = 0;
        end
        bandera=bandera+1;
    end
end
case 3
    for i =1: 1
        for j = 1: Cla
            if mod(j,2)
                target(i,j) = 1;
            else
                target(i,j) = 0;
            end
        end
    end
bandera = 0;
for i =1: 1
    for j = 1: Cla
        if bandera==2||bandera==3
            target(2,j) = 1;
        else
            target(2,j) = 0;
        end
    bandera=bandera+1;
    end
end
bandera=0;
for i =1: 1
    for j = 1: Cla
        if bandera>=4
            target(3,j) = 1;
        else
            target(3,j) = 0;
        end
    bandera=bandera+1;
    end
end
otherwise
disp('¿Que esta pasandaaaa?');
end
%Aqui termina el llenado de targets
%Generamos la matriz de pesos y bias con números aleatorios
w = randi([-10 10],S,2);
for i=1:S
arc=['w',num2str(i),'.txt'];
textarc = fopen(arc,'wt');
for ese=1:2
fprintf(textarc,'%g\t',w(i,ese));
end
fprintf(textarc,'\n');
end
textarc = fopen('w.txt','wt');
fprintf(textarc,'%g\t',w);
b = randi([-10 10],S,1);
arc='bias.txt';
textarc = fopen(arc,'wt');
for ese=1:2
fprintf(textarc,'%g\t',b);
fprintf(textarc,'\n');
end
%Aqui empieza el aprendizaje
%Solicitamos el numero de iteraciones
CU=0;
cond=input('Ingrese el numero de repeticiones maximas:');
for u=1:cond
    g=1;
    bandera=0;
    text=['Epoca: ',num2str(u)];
    disp(text);
    for i=1:Cla
        for j=1:Col
            d=[dataset(g,j);dataset(g+1,j)];
            figure(1)
            hold on
            grid on
            plot(dataset(g,j),dataset(g+1,j),'ko');
            a=hardlim(w*d+b);
            e=target(:,i)-a;
            w=w+e*d';
            b=b+e;
            disp(target(:,i));
            CU=CU+1;
            arc='bias.txt';
            textarc=fopen(arc,'a');

            if e==0
                bandera=bandera+1;
            end
        end
        g=g+2;
    end
if bandera==Col*Cla
    disp('Aprendizaje Correcto!!!');
    break
end
end
%Acaba el aprendizaje y a continuación solo se procede a graficar las
%rectas perpendiculares a los pesos sinápticos
for i=1:S
arc=['w',num2str(i),'.txt'];
wgraf=load(arc);
X = wgraf(CU+1,1);
Y = wgraf(CU+1,2);
P1=[0 0];P2=[X Y];
plot([P1(1) P2(1)],[P1(2) P2(2)],'r')
X1 = (-1)*wgraf(CU+1,2);
Y1 = wgraf(CU+1,1);
P11=[0 0];P22=[X1 Y1];
plot([P11(1) P22(1)]-(b(i)'/w(i)),[P11(2) P22(2)],'b')
plot(-[P11(1) P22(1)]-(b(i)'/w(i)),-[P11(2) P22(2)],'b')
end
hold off
for g=1:S
text=['w',num2str(g),'.txt'];
figure(2)
hold on
plot(load(text));
hold off
end
load bias.txt;
hold on
plot(bias);
hold off
disp(w);
disp(b);
fclose('all');
clear text;
clear a;
clear i;
clear j;
clear u;
clear g;






p = linspace(-2,2,51);
%parse p to a vector column
p = p(:);
m = length(p);
v_1 = [2,1];
v_2 = [2,1];
W_1 = [10;10];
b_1 = [-10;10];
W_2 = [1,1];
b_2 = 0;

a_1 = [m,2];
a_2 = [m,1];
for i = 1 : m
    a_1(i,:) = logsig(W_1*p(i,:)' +b_1);
    a_2(i) = purelin(W_2*a_1(i,:)' +b_2);   
end

disp ("Rango a modificar de W_1(1)");
disp("Ejemplo: [-20,20]")
rango = input("\n");
rango = rango(:);
valores = linspace(rango(1),rango(2),4);
valores = [valores, W_1(1,:)];
figure;
hold on
for j = 1 : size(valores,2)
    W_1(1,:) = valores(:,j);
        for i = 1 : m
            a_1(i,:) = logsig(W_1*p(i,:)' +b_1);
            a_2(i) = purelin(W_2*a_1(i,:)' +b_2);   
        end
    plot(p,a_2);
end
hold off
title ('Evolucion de W_1^1')
xlabel ('P')
ylabel ('a^2')
legend(sprintfc('%g', valores));


disp ("Rango a modificar de W_1(2)");
disp("Ejemplo: [-20,20]")
rango = input("\n");
rango = rango(:);
valores = linspace(rango(1),rango(2),4);
valores = [valores, W_1(2,:)];
figure;
hold on
for j = 1 : size(valores,2)
    W_1(2,:) = valores(:,j); 
        for i = 1 : m
            a_1(i,:) = logsig(W_1*p(i,:)' +b_1);
            a_2(i) = purelin(W_2*a_1(i,:)' +b_2);   
        end
    plot(p,a_2);
end
hold off
title ('Evolucion de W_2^1')
xlabel ('P')
ylabel ('a^2')
legend(sprintfc('%g', valores));


disp ("Rango a modificar de bias_1(1)");
disp("Ejemplo: [0,20]")
rango = input("\n");
rango = rango(:);
valores = linspace(rango(1),rango(2),4);
valores = [valores, b_1(1,:)];
figure;
hold on
for j = 1 : size(valores,2)
    b_1(1,:) = valores(:,j); 
        for i = 1 : m
            a_1(i,:) = logsig(W_1*p(i,:)' +b_1);
            a_2(i) = purelin(W_2*a_1(i,:)' +b_2);   
        end
    plot(p,a_2);
end
hold off
title ('Evolucion de b_1^1')
xlabel ('P')
ylabel ('a^2')
legend(sprintfc('%g', valores));



disp ("Rango a modificar de bias_1(2)");
disp("Ejemplo: [0,20]")
rango = input("\n");
rango = rango(:);
valores = linspace(rango(1),rango(2),4);
valores = [valores, b_1(2,:)];
figure;
hold on
for j = 1 : size(valores,2)
    b_1(2,:) = valores(:,j);
        for i = 1 : m
            a_1(i,:) = logsig(W_1*p(i,:)' +b_1);
            a_2(i) = purelin(W_2*a_1(i,:)' +b_2);   
        end
    plot(p,a_2);
end
hold off
title ('Evolucion de b_2^1')
xlabel ('P')
ylabel ('a^2')
legend(sprintfc('%g', valores));


disp ("Rango a modificar de W_2(1)");
disp("Ejemplo: [-1,1]")
rango = input("\n");
rango = rango(:);
valores = linspace(rango(1),rango(2),4);
valores = [valores, W_2(:,1)];
figure;
hold on
for j = 1 : size(valores,2)
    W_2(:,1) = valores(:,j);
        for i = 1 : m
            a_1(i,:) = logsig(W_1*p(i,:)' +b_1);
            a_2(i) = purelin(W_2*a_1(i,:)' +b_2);   
        end
    plot(p,a_2);
end
hold off
title ('Evolucion de W_1^2')
xlabel ('P')
ylabel ('a^2')
legend(sprintfc('%g', valores));


disp ("Rango a modificar de W_2(2)");
disp("Ejemplo: [-1,1]")
rango = input("\n");
rango = rango(:);
valores = linspace(rango(1),rango(2),4);
valores = [valores, W_2(:,2)];
figure;
hold on
for j = 1 : size(valores,2)
    W_2(:,2) = valores(:,j); 
        for i = 1 : m
            a_1(i,:) = logsig(W_1*p(i,:)' +b_1);
            a_2(i) = purelin(W_2*a_1(i,:)' +b_2);   
        end
    plot(p,a_2);
end
hold off
title ('Evolucion de W_2^2')
xlabel ('P')
ylabel ('a^2')
legend(sprintfc('%g', valores));

disp ("Rango a modificar de bias_2(1)");
disp("Ejemplo: [-1,1]")
rango = input("\n");
rango = rango(:);
valores = linspace(rango(1),rango(2),4);
valores = [valores, b_2(:,1)];
figure;
hold on
for j = 1 : size(valores,2)
    b_2(:,1) = valores(:,j);
        for i = 1 : m
            a_1(i,:) = logsig(W_1*p(i,:)' +b_1);
            a_2(i) = purelin(W_2*a_1(i,:)' +b_2);   
        end
    plot(p,a_2);
end
hold off
title ('Evolucion de b_1^2')
xlabel ('P')
ylabel ('a^2')
legend(sprintfc('%g', valores));

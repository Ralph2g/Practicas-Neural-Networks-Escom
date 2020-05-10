p = linspace(-2,2,20);
g_p = 1+sin((pi/4).*p);
figure;
hold on;
plot(p,g_p, 'ro-');
xlabel ('P');
ylabel ('a^2');
array = "g_p";
valores = [];
valores  = [valores array];
legend(valores);
g_p= g_p(:);
%parse p to a vector column
p = p(:);
m = length(p);
%Inicialización de los valores aleatorios
W_1 = -1 + (1+1)*rand(2,1);
b_1 = -1 + (1+1)*rand(2,1);
W_2 = -1 + (1+1)*rand(1,2);
b_2 = -1 + (1+1)*rand(1,1);
alpha =0.01;
a_0 = p;
a_1 = zeros(m,2);
a_2 = zeros(m,1);
error = 1;
Eepoch = 0.01;
maxEpoch = 30;

for e = i :maxEpoch
    %Propagación hacia adelante
    for i = 1 : m
        a_1(i,:) = logsig(W_1*p(i,:)' +b_1);
        a_2(i,:) = purelin(W_2*a_1(i,:)' +b_2);   
    end
    a = a_2;
    %Error
    error = sum((a - g_p).^2)/m;
    %verificación del error
    disp(error);
    if error>Eepoch
        for i = 1:m
            f_n_1 = eye(2).*(a_1(i)');
            s_2 = -2.*(1).*( g_p(i)-a(i));
            s_1 = (f_n_1*W_2')*s_2;% 2x2 - 1x2 - 1x1
            W_2 = W_2 - alpha.*(s_2*a_1(i,:));
            b_2 = b_2 - alpha.*(s_2);
            W_1 = W_1 - alpha.*(s_1*a_0(i));
            b_1 = b_1 - alpha.*s_1;
        end
    else
        disp("La red convergió");
        break;
    end
    %Backpropagation
    
end
    
plot(p,a, 'bo-');
hold off;
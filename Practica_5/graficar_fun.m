function [] = graficar_fun()
    load("datos_finales.mat");
    figure;
    hold on;
    %plot(p,a, 'yx');
    plot(ptest,a_test, 'bx');
    plot(ptest,t_test,'ro');
    legend('Salida [pTest] MLP','ytest')
    hold off;
function [] = graficar_error()
    error_train = load('error_train.txt');
    error_val= load('error_val.txt');
    figure;
    hold on;
    plot(error_train(:,1),error_train(:,2));
    plot(error_val(:,1),error_val(:,2));
    hold off;
    legend('Error de entrenamiento','Error de validación');
end
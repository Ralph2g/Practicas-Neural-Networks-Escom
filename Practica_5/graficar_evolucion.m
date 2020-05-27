function [] = graficar_evolucion(bool)
    W_1 = load('W_1.txt');
    W_2 = load('W_2.txt');
    W_s = load('W_s.txt');
    b_1 = load('b_1.txt');
    b_2 = load('b_2.txt');
    b_s = load('b_s.txt');
    
    figure;
    xlabel("Iteración");
    ylabel("Valor de W^1");
    title("W^1");
    plot(W_1);
    lgd = legend;
    title(lgd,'Valores de cada W^1_i_j');
    
    figure;
    xlabel("Iteración");
    ylabel("Valor de b^1");
    title("b^1");
    plot(b_1);
    lgd = legend;
    title(lgd,'Valores de cada b^1_i');
    
    if bool
        figure;
        xlabel("Iteración");
        ylabel("Valor de W^2");
        title("W^2");
        plot(W_2);
        lgd = legend;
        title(lgd,'Valores de cada W^2_i_j');

        figure;
        xlabel("Iteración");
        ylabel("Valor de b^2");
        title("b^2");
        plot(b_1);
        lgd = legend;
        title(lgd,'Valores de cada b^2_i');
        
        figure;
        xlabel("Iteración");
        ylabel("Valor de W^3");
        title("W^3");
        plot(W_s);
        lgd = legend;
        title(lgd,'Valores de cada W^3_i_j');

        figure;
        xlabel("Iteración");
        ylabel("Valor de b^3");
        title("b^3");
        plot(b_s);
        lgd = legend;
        title(lgd,'Valores de cada b^3_i');
    else
        figure;
        xlabel("Iteración");
        ylabel("Valor de W^2");
        title("W^2");
        plot(W_s);
        lgd = legend;
        title(lgd,'Valores de cada W^2_i_j');

        figure;
        xlabel("Iteración");
        ylabel("Valor de b^2");
        title("b^2");
        plot(b_s);
        lgd = legend;
        title(lgd,'Valores de cada b^2_i');
        
    end

end